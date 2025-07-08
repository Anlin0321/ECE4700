import os

def asm_to_s_line(asm_line):
    """
    Given one line from the .asm file, extract just the instruction
    """
    # Ignore blank lines
    line = asm_line.strip()
    if not line:
        return ""
    
    # Expected format: ADDRESS: OPCODE   INSTRUCTION
    if ':' not in line:
        return ""
    
    parts = line.split(':', 1)
    if len(parts) < 2:
        return ""
    
    remainder = parts[1].strip()
    
    # Remainder starts with hex opcode
    tokens = remainder.split()
    if len(tokens) < 2:
        return ""
    
    # Remove first token (opcode)
    return ' '.join(tokens[1:])


def convert_asm_to_s(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            s_line = asm_to_s_line(line)
            if s_line:
                outfile.write(s_line + '\n')


if __name__ == '__main__':
    # Change these file names as needed
    for dir, _, filenames in os.walk('D:\\SunYihao\\ece470\\final_project\\ECE4700\\testbench\\testbenches'):
        for file in filenames:
            if file.lower().endswith(".asm"):
                input = file
                output = file.split('.')[0] + '.s'
                convert_asm_to_s(input, output)
                print(f"Converted {input} to {output}.")
