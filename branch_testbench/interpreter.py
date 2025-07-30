#!/usr/bin/env python3
"""
rv32_assembler.py - RISC-V assembler for RV32I subset
Converts .s assembly to .hex machine code
Supports the instruction set from rv32_testgen.py
"""

import argparse
import re
import sys
import os
import yaml

# --------------------- Instruction Encoding Functions ------------------------
# (Same as in rv32_testgen.py)
def encode_R(funct7, rs2, rs1, funct3, rd, opcode=0x33):
    return ((funct7 & 0x7f) << 25) | ((rs2 & 0x1f) << 20) | \
           ((rs1 & 0x1f) << 15) | ((funct3 & 7) << 12) | \
           ((rd  & 0x1f) << 7)  | (opcode & 0x7f)

def encode_I(imm, rs1, funct3, rd, opcode=0x13):
    imm &= 0xfff
    return (imm << 20) | ((rs1 & 0x1f) << 15) | \
           ((funct3 & 7) << 12) | ((rd & 0x1f) << 7) | (opcode & 0x7f)

def encode_L(imm, rs1, funct3, rd, opcode=0x03):
    return encode_I(imm, rs1, funct3, rd, opcode)
def encode_U(imm, rd, opcode=0x37):
    return ((imm & 0xfffff) << 12) | ((rd & 0x1f) << 7) | (opcode & 0x7f)
def encode_S(imm, rs2, rs1, funct3, opcode=0x23):
    imm &= 0xfff
    imm11_5 = (imm >> 5) & 0x7f
    imm4_0 = imm & 0x1f
    return (imm11_5 << 25) | ((rs2 & 0x1f) << 20) | \
           ((rs1 & 0x1f) << 15) | ((funct3 & 7) << 12) | \
           (imm4_0 << 7) | (opcode & 0x7f)

def encode_B(imm, rs2, rs1, funct3, opcode=0x63):
    imm &= 0x1fff
    imm12 = (imm >> 12) & 1
    imm10_5 = (imm >> 5) & 0x3f
    imm4_1 = (imm >> 1) & 0xf
    imm11 = (imm >> 11) & 1
    return (imm12 << 31) | (imm10_5 << 25) | (imm11 << 7) | \
           (imm4_1 << 8) | ((rs2 & 0x1f) << 20) | \
           ((rs1 & 0x1f) << 15) | ((funct3 & 7) << 12) | (opcode & 0x7f)

def encode_J(imm, rd, opcode=0x6f):
    imm &= 0x1fffff
    imm20 = (imm >> 20) & 1
    imm10_1 = (imm >> 1) & 0x3ff
    imm11 = (imm >> 11) & 1
    imm19_12 = (imm >> 12) & 0xff
    return (imm20 << 31) | (imm19_12 << 12) | (imm11 << 20) | \
           (imm10_1 << 21) | ((rd & 0x1f) << 7) | (opcode & 0x7f)

# ------------------------- Assembler Implementation -------------------------
class RiscvAssembler:
    def __init__(self):
        self.symbol_table = {}
        self.instructions = []
        self.pseudo_ops = {
            'nop': ('addi', ['x0', 'x0', '0']),
            'j':   ('jal',  ['x0', None])  # Placeholder for label
        }
        self.inst_table = {
            # R-type
            'add':  ('R', 0x0, 0x33, 0x00),
            'sub':  ('R', 0x0, 0x33, 0x20),
            'and':  ('R', 0x7, 0x33, 0x00),
            'or':   ('R', 0x6, 0x33, 0x00),
            'xor':  ('R', 0x4, 0x33, 0x00),
            'sll':  ('R', 0x1, 0x33, 0x00),
            'srl':  ('R', 0x5, 0x33, 0x00),

            # I-type
            'addi': ('I', 0x0, 0x13),
            'andi': ('I', 0x7, 0x13),
            'ori':  ('I', 0x6, 0x13),
            'xori': ('I', 0x4, 0x13),

            # Load/Store
            'lw':   ('L', 0x2, 0x03),
            'sw':   ('S', 0x2, 0x23),

            # Branch
            'beq':  ('B', 0x0, 0x63),
            'bne':  ('B', 0x1, 0x63),
            'blt':  ('B', 0x4, 0x63),

            # Jump
            'jal':  ('J', 0x6f),
            'lui':  ('U', 0x37),
            # System
            'ecall': ('SYS',)
        }


    def _parse_reg(self, reg_str):
        """Parse register name (x0-x31) to integer"""
        if reg_str[0] != 'x' or not reg_str[1:].isdigit():
            raise ValueError(f"Invalid register: {reg_str}")
        regnum = int(reg_str[1:])
        if regnum < 0 or regnum > 31:
            raise ValueError(f"Register out of range: {reg_str}")
        return regnum

    def _parse_imm(self, imm_str, base=10):
        """Parse immediate value with optional sign and base prefix"""
        try:
            return int(imm_str, base)
        except ValueError:
            raise ValueError(f"Invalid immediate: {imm_str}")

    def _parse_mem(self, mem_str):
        """Parse memory operand: offset(rs)"""
        match = re.match(r'^(-?\d+|\w+)\((\w+)\)$', mem_str)
        if not match:
            raise ValueError(f"Invalid memory operand: {mem_str}")
        offset, rs = match.groups()
        try:
            imm = self._parse_imm(offset, 0)  # Auto-detect base
        except ValueError:
            # Might be a label reference - handled later
            imm = offset
        return imm, rs

    def _process_line(self, line):
        """Process one line of assembly code"""
        # Remove comments and whitespace
        line = re.sub(r'#.*$', '', line).strip()
        if not line:
            return None
            
        # Handle labels
        if line.endswith(':'):
            label = line[:-1].strip()
            return ('label', label)
            
        # Handle pseudo-instructions
        parts = re.split(r'[,\s]+', line)
        mnemonic = parts[0]
        operands = [op for op in parts[1:] if op]
        
        if mnemonic in self.pseudo_ops:
            real_mnem, pseudo_ops = self.pseudo_ops[mnemonic]
            # Special handling for jumps
            if mnemonic == 'j':
                pseudo_ops = ['x0', operands[0]]
            return ('inst', real_mnem, pseudo_ops)
        
        return ('inst', mnemonic, operands)

    def first_pass(self, lines):
        """Build symbol table with label addresses"""
        address = 0
        for line in lines:
            result = self._process_line(line)
            if not result:
                continue
                
            if result[0] == 'label':
                label = result[1]
                if label in self.symbol_table:
                    raise ValueError(f"Duplicate label: {label}")
                self.symbol_table[label] = address
            else:
                address += 4  # Advance PC for instructions

    def second_pass(self, lines):
        """Assemble instructions to machine code"""
        address = 0
        for line in lines:
            result = self._process_line(line)
            if not result or result[0] == 'label':
                continue
                
            mnemonic = result[1]
            operands = result[2]
            
            if mnemonic not in self.inst_table:
                raise ValueError(f"Unknown instruction: {mnemonic}")
                
            fmt, *fmt_info = self.inst_table[mnemonic]
            enc = 0
            
            try:
                # R-type: add rd, rs1, rs2
                if fmt == 'R':
                    if len(operands) != 3:
                        raise ValueError("R-type requires 3 operands")
                    rd = self._parse_reg(operands[0])
                    rs1 = self._parse_reg(operands[1])
                    rs2 = self._parse_reg(operands[2])
                    enc = encode_R(fmt_info[2], rs2, rs1, fmt_info[0], rd, fmt_info[1])
                
                # I-type: addi rd, rs1, imm
                elif fmt == 'I':
                    if len(operands) != 3:
                        raise ValueError("I-type requires 3 operands")
                    rd = self._parse_reg(operands[0])
                    rs1 = self._parse_reg(operands[1])
                    imm = self._parse_imm(operands[2], 0)
                    enc = encode_I(imm, rs1, fmt_info[0], rd, fmt_info[1])
                
                # Load: lw rd, offset(rs)
                elif fmt == 'L':
                    if len(operands) != 2:
                        raise ValueError("LW requires 2 operands")
                    rd = self._parse_reg(operands[0])
                    imm, rs_str = self._parse_mem(operands[1])
                    rs1 = self._parse_reg(rs_str)
                    
                    # Handle label references in offset
                    if isinstance(imm, str):
                        if imm not in self.symbol_table:
                            raise ValueError(f"Undefined label: {imm}")
                        imm = self.symbol_table[imm] - address
                    enc = encode_L(imm, rs1, fmt_info[0], rd, fmt_info[1])
                
                # Store: sw rs2, offset(rs1)
                elif fmt == 'S':
                    if len(operands) != 2:
                        raise ValueError("SW requires 2 operands")
                    rs2 = self._parse_reg(operands[0])
                    imm, rs_str = self._parse_mem(operands[1])
                    rs1 = self._parse_reg(rs_str)
                    
                    if isinstance(imm, str):
                        if imm not in self.symbol_table:
                            raise ValueError(f"Undefined label: {imm}")
                        imm = self.symbol_table[imm] - address
                    enc = encode_S(imm, rs2, rs1, fmt_info[0], fmt_info[1])
                
                # Branch: beq rs1, rs2, label
                elif fmt == 'B':
                    if len(operands) != 3:
                        raise ValueError("B-type requires 3 operands")
                    rs1 = self._parse_reg(operands[0])
                    rs2 = self._parse_reg(operands[1])
                    label_or_imm = operands[2]

                    if label_or_imm in self.symbol_table:
                        offset = self.symbol_table[label_or_imm] - address
                    else:
                        try:
                            offset = self._parse_imm(label_or_imm, 0)
                        except Exception:
                            raise ValueError(f"Undefined label or invalid immediate: {label_or_imm}")
                    enc = encode_B(offset, rs2, rs1, fmt_info[0], fmt_info[1])
                
                # Jump: jal rd, label
                elif fmt == 'J':
                    if len(operands) != 2:
                        raise ValueError("JAL requires 2 operands")
                    rd = self._parse_reg(operands[0])
                    label_or_imm = operands[1]
                    
                    if label_or_imm in self.symbol_table:
                        offset = self.symbol_table[label_or_imm] - address
                    else:
                        try:
                            offset = self._parse_imm(label_or_imm, 0)
                        except ValueError:
                            raise ValueError(f"Undefined label or invalid immediate: {label_or_imm}")

                    enc = encode_J(offset, rd, fmt_info[0])
                elif fmt == 'U':
                    if len(operands) != 2:
                        raise ValueError("U-type requires 2 operands")
                    rd = self._parse_reg(operands[0])
                    imm = self._parse_imm(operands[1], 0)
                    enc = encode_U(imm, rd, fmt_info[0])
                
                self.instructions.append(enc)
                address += 4
                
            except Exception as e:
                raise ValueError(f"Error at 0x{address:08x}: {line}\n  {str(e)}")

    def assemble(self, asm_text):
        """Assemble assembly text to machine code"""
        lines = asm_text.splitlines()
        self.first_pass(lines)
        self.second_pass(lines)
        return self.instructions

    def reset(self):
        """Reset assembler state"""
        self.symbol_table = {}
        self.instructions = []


def load_config(config_path):
    with open(config_path, 'r') as f:
        return yaml.safe_load(f)
# --------------------------- Main Program --------------------------------
def main():
    parser = argparse.ArgumentParser(
        description='RISC-V Assembler for RV32I subset',
        epilog='Converts .s assembly to .hex machine code'
    )
    # parser.add_argument('input', help='Input assembly file (.s)')
    # parser.add_argument('-o', '--output', help='Output hex file')
    parser.add_argument('--config', type=str, required=True, help='Path to YAML configuration file')
    args = parser.parse_args()
    config = load_config(args.config)
    input = config.get('input', '')
    output = config.get('output', '')
    try:
        # Read input assembly
        with open(input, 'r') as f:
            asm_text = f.read()

        # Assemble code
        assembler = RiscvAssembler()
        machine_code = assembler.assemble(asm_text)
        
        # Determine output filename
        outfile = output or os.path.splitext(input)[0] + '.hex'
        
        # Write hex output
        with open(outfile, 'w') as f:
            for instruction in machine_code:
                f.write(f"{instruction:08x}\n")
        
        print(f"Successfully assembled {len(machine_code)} instructions")
        print(f"Output written to: {outfile}")
        
    except Exception as e:
        sys.stderr.write(f"Assembly error: {str(e)}\n")
        sys.exit(1)

if __name__ == '__main__':
    main()