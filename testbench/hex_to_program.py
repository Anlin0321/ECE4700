import argparse


def hex32_to_mem64(hex_path, mem_path, mem_lines=8192):
    with open(hex_path, 'r') as f:
        instructions = [line.strip() for line in f if line.strip()]

    padding = "00000000"

    # Pack two instructions per line (LSB first)
    packed_lines = []
    for i in range(0, len(instructions), 2):
        lsb = instructions[i]
        msb = instructions[i + 1] if i + 1 < len(instructions) else padding
        packed = msb + lsb  # MSB first
        packed_lines.append(packed)

    # Pad with NOP pairs to reach 8192 lines
    while len(packed_lines) < mem_lines:
        packed_lines.append(padding + padding)

    with open(mem_path, 'w') as f:
        for line in packed_lines[:mem_lines]:
            f.write(line + '\n')


def parse_cli():
    ap = argparse.ArgumentParser(description="Random RV32I memory file generator")
    ap.add_argument("input_file", type=str,
                    help="hex file to be converted")
    
    return ap.parse_args()


if __name__ == "__main__":
    cli = parse_cli()
    input_file = cli.input_file
    output_file = input_file.replace(".hex", ".mem")
    hex32_to_mem64(input_file, output_file)
