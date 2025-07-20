#!/usr/bin/env python3
"""
rv32_testgen.py – quick-n-dirty constrained random test-case generator for RV32I
Author: ChatGPT (2025-06-29)

Examples
--------
#  200 instructions, 25 % RAW hazards, 10 % branches, 60 % of those taken
python rv32_testgen.py -n 200 -hz 0.25 -br 0.10 -tk 0.60 -o my_test
"""

import argparse, random, os, pathlib, sys, yaml
from typing import List, Tuple

# ----------------------------------
#   Tiny RV32I encoder helpers
# ----------------------------------
def encode_R(funct7, rs2, rs1, funct3, rd, opcode=0x33):
    return ((funct7 & 0x7f) << 25) | ((rs2 & 0x1f) << 20) | \
           ((rs1 & 0x1f) << 15) | ((funct3 & 7) << 12) | \
           ((rd  & 0x1f) << 7)  | (opcode & 0x7f)

def encode_I(imm, rs1, funct3, rd, opcode=0x13):
    imm &= 0xfff
    return (imm << 20) | ((rs1 & 0x1f) << 15) | \
           ((funct3 & 7) << 12) | ((rd & 0x1f) << 7) | (opcode & 0x7f)

def encode_L(imm, rs1, funct3, rd, opcode=0x03):  # LW only
    return encode_I(imm, rs1, funct3, rd, opcode)

def encode_S(imm, rs2, rs1, funct3, opcode=0x23):  # SW only
    imm &= 0xfff
    imm11_5, imm4_0 = imm >> 5, imm & 0x1f
    return (imm11_5 << 25) | ((rs2 & 0x1f) << 20) | \
           ((rs1 & 0x1f) << 15) | ((funct3 & 7) << 12) | \
           (imm4_0 << 7) | (opcode & 0x7f)

def encode_B(imm, rs2, rs1, funct3, opcode=0x63):  # BEQ/BNE only
    imm &= 0x1fff            # 13-bit signed offset
    imm12 = (imm >> 12) & 1
    imm10_5 = (imm >> 5) & 0x3f
    imm4_1 = (imm >> 1) & 0xf
    imm11 = (imm >> 11) & 1
    return (imm12 << 31) | (imm11 << 7) | (imm10_5 << 25) | \
           (imm4_1 << 8) | ((rs2 & 0x1f) << 20) | ((rs1 & 0x1f) << 15) | \
           ((funct3 & 7) << 12) | (opcode & 0x7f)

def encode_J(imm, rd, opcode=0x6f):  # JAL
    imm &= 0x1fffff          # 21-bit signed
    imm20   = (imm >> 20) & 1
    imm10_1 = (imm >> 1) & 0x3ff
    imm11   = (imm >> 11) & 1
    imm19_12= (imm >> 12) & 0xff
    return (imm20 << 31) | (imm19_12 << 12) | (imm11 << 20) | \
           (imm10_1 << 21) | ((rd & 0x1f) << 7) | (opcode & 0x7f)

# Disassembler for the subset we use (keeps *.asm* readable)
def disasm(enc: int) -> str:
    opcode = enc & 0x7f
    rd, rs1, rs2 = (enc >> 7) & 0x1f, (enc >> 15) & 0x1f, (enc >> 20) & 0x1f
    funct3 = (enc >> 12) & 7
    funct7 = (enc >> 25) & 0x7f
    if opcode == 0x33:   # R-type ALU
        mnem = {0x00: {0x0: "add", 0x7: "and", 0x6: "or", 0x4: "xor"},
                0x20: {0x0: "sub"}}.get(funct7, {}).get(funct3, "unknown")
        return f"{mnem:<4} x{rd}, x{rs1}, x{rs2}"
    if opcode == 0x13:   # I-type ALU imm
        imm = (enc >> 20) & 0xfff
        if imm & 0x800: imm -= 0x1000
        mnem = {0x0: "addi", 0x7: "andi", 0x6: "ori", 0x4: "xori"}.get(funct3,"?")
        return f"{mnem:<4} x{rd}, x{rs1}, {imm}"
    if opcode == 0x03:   # LW
        imm = (enc >> 20) & 0xfff
        if imm & 0x800: imm -= 0x1000
        return f"lw   x{rd}, {imm}(x{rs1})"
    if opcode == 0x23:   # SW
        imm = ((enc >> 25) << 5) | ((enc >> 7) & 0x1f)
        if imm & 0x800: imm -= 0x1000
        return f"sw   x{rs2}, {imm}(x{rs1})"
    if opcode == 0x63:   # BEQ/BNE
        imm = ((enc>>31)&1)<<12 | ((enc>>7)&1)<<11 | ((enc>>25)&0x3f)<<5 | ((enc>>8)&0xf)<<1
        if imm & 0x1000: imm -= 0x2000
        mnem = {0x0: "beq", 0x1: "bne"}.get(funct3,"?")
        return f"{mnem:<4} x{rs1}, x{rs2}, {imm}"
    if opcode == 0x6f:   # JAL
        imm = ((enc>>31)&1)<<20 | ((enc>>12)&0xff)<<12 | ((enc>>20)&1)<<11 | ((enc>>21)&0x3ff)<<1
        if imm & 0x100000: imm -= 0x200000
        return f"jal  x{rd}, {imm}"
    if opcode == 0x73:  # SYSTEM
        return "wfi"
    return "unknown"

# ----------------------------------
#   Instruction pool
# ----------------------------------
ALU_R   : List[Tuple[str, int, int]] = [("add",0x0,0x00), ("sub",0x0,0x20),
                                        ("and",0x7,0x00), ("or",0x6,0x00),
                                        ("xor",0x4,0x00)]
ALU_I   : List[Tuple[str, int]]      = [("addi",0x0), ("andi",0x7),
                                        ("ori",0x6),  ("xori",0x4)]
BR      : List[Tuple[str, int]]      = [("beq",0x0), ("bne",0x1)]

WFI = 0x10500073

REGS = list(range(1, 32))       # x0 is constant, avoid as dest
SPREG = 2                        # x2 (stack pointer) – handy non-zero base

def rand_reg(exclude=()) -> int:
    c = [r for r in REGS if r not in exclude]
    return random.choice(c)

# ----------------------------------
#   Stream generator
# ----------------------------------
def generate(n=100, hazard_p=0.2, branch_p=0.1, taken_p=0.5, seed=0):
    random.seed(seed)
    code: List[int] = []
    last_def = None  # rd of previous instruction for RAW generation

    pc = 0
    for _ in range(n):
        make_hazard = last_def is not None and random.random() < hazard_p
        make_branch = random.random() < branch_p

        if make_branch:
            # use BEQ/BNE comparing two regs, maybe self-dependence for predictability
            rs1 = last_def if make_hazard else rand_reg()
            rs2 = rs1 if random.random() < taken_p else rand_reg(exclude=(rs1,))
            # taken = rs1 == rs2
            offset = 4  #  if not taken else -4   # trivial loop / skip
            mnem, f3 = random.choice(BR)
            if mnem == "beq": f3 = 0x0
            enc = encode_B(offset, rs2, rs1, f3)
            last_def = None  # branches don’t write RD
        else:
            if make_hazard:
                rs1 = last_def
            else:
                # FIXME: should we exclude last_def?
                rs1 = rand_reg()
            op_kind = random.choice(["R","I","LW","SW"])
            # op_kind = random.choice(["R","I"])
            if op_kind == "R":
                mnem,f3,f7 = random.choice(ALU_R)
                rs2 = rand_reg(exclude=(rs1,))
                rd  = rand_reg(exclude=(rs1, rs2))
                enc = encode_R(f7, rs2, rs1, f3, rd)
                last_def = rd
            elif op_kind == "I":
                mnem,f3 = random.choice(ALU_I)
                imm = random.randint(-2048, 2047)
                rd  = rand_reg(exclude=(rs1,))
                enc = encode_I(imm, rs1, f3, rd)
                last_def = rd
            elif op_kind == "LW":
                imm = random.randrange(-2048, 2047, 4)
                rd = rand_reg()
                enc = encode_L(imm, SPREG, 0x2, rd)   # funct3=010 for LW
                last_def = rd
            else:  # SW
                imm = random.randrange(-2048, 2047, 4)
                rs2 = rand_reg()
                enc = encode_S(imm, rs2, SPREG, 0x2)  # funct3=010
                last_def = None

        code.append(enc)
        pc += 4

    code.append(WFI)
    return code

# ----------------------------------
#   CLI / I/O
# ----------------------------------
def write_stream(code: List[int], stem: str):
    stem = pathlib.Path(stem)
    with open(stem.with_suffix(".hex"), "w") as fh_hex, \
         open(stem.with_suffix(".asm"), "w") as fh_asm, \
         open(stem.with_suffix(".s"), "w") as fh_s:
        for pc, enc in enumerate(code):
            fh_hex.write(f"{enc:08x}\n")
            fh_asm.write(f"{pc*4:08x}: {enc:08x}    {disasm(enc)}\n")
            fh_s.write(f"{disasm(enc)}\n")

# ----------  Config handling  ------------------------------------------------
def parse_cli():
    ap = argparse.ArgumentParser(description="Random RV32I test-stream generator")
    ap.add_argument("config", type=pathlib.Path,
                    help="YAML file with default parameters")

    ap.add_argument("-n", "--len",     type=int,   help="instruction count")
    ap.add_argument("-hz", "--hazard", type=float, help="RAW-hazard probability")
    ap.add_argument("-br", "--branch", type=float, help="branch probability")
    ap.add_argument("-tk", "--taken",  type=float, help="branch-taken probability")
    ap.add_argument("-s", "--seed",    type=int,   help="RNG seed")
    ap.add_argument("-d", "--dir",     type=str,   help="output directory")
    ap.add_argument("-o", "--out",     type=str,   help="output file stem")
    return ap.parse_args()

DEFAULTS = dict(len=100, hazard=0.2, branch=0.1, taken=0.5, seed=0, dir="./testbenches", out="test")

def merge_cfg(cli, yaml_cfg):
    cfg = DEFAULTS | yaml_cfg          # start with YAML values overriding defaults
    for k in DEFAULTS:                 # then apply *explicit* CLI overrides
        v = getattr(cli, k if k!="len" else "len")  # arg name tweak
        if v is not None:
            cfg[k] = v
    return cfg

# ----------  Main ------------------------------------------------------------
def main():
    cli = parse_cli()
    yaml_cfg = {}
    if cli.config:
        try:
            with open(cli.config) as f:
                yaml_cfg = yaml.safe_load(f) or {}
        except FileNotFoundError:
            sys.exit(f"Config file '{cli.config}' not found.")
        except yaml.YAMLError as e:
            sys.exit(f"YAML error: {e}")

    cfg = merge_cfg(cli, yaml_cfg)

    # sanity
    if not all(0 <= cfg[p] < 1 for p in ("hazard","branch","taken")):
        sys.exit("Probabilities must be in [0,1).")

    code = generate(cfg["len"], cfg["hazard"], cfg["branch"],
                    cfg["taken"], cfg["seed"])
    os.makedirs(cfg["dir"], exist_ok=True)  # ensure output dir exists
    write_stream(code, os.path.join(cfg["dir"], cfg["out"]))
    print(f"Wrote {cfg['out']}.hex and {cfg['out']}.asm  "
          f"({cfg['len']} instructions)")

if __name__ == "__main__":
    main()
