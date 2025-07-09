import os
import random
import argparse
import yaml

def load_config(config_path):
    """Loads configuration from a YAML file."""
    with open(config_path, 'r') as f:
        return yaml.safe_load(f)

def main():
    """Main function to generate the RISC-V test case."""
    parser = argparse.ArgumentParser(description='RISC-V Branch Prediction Test Generator')
    parser.add_argument('--config', type=str, required=True, help='Path to YAML configuration file')
    args = parser.parse_args()

    # Load configuration from YAML
    config = load_config(args.config)

    # Set parameters from config
    seed = config.get('seed', 42)
    output = config.get('output', 'testcase.s')
    codelen = config.get('codelen', 1000)
    hazard = config.get('hazard', 0.5)
    weights = config.get('weights', [0.1, 0.1, 0.4, 0.2, 0.2])
    regnum = config.get('regnum', 8)
    membase = int(config.get('membase', '0x1000'), 16) if isinstance(config.get('membase'), str) else config.get('membase', 0x1000)
    max_loop_depth = config.get('max_loop_depth', 3)
    loop_exit_prob = config.get('loop_exit_prob', 0.2)
    loop_insert_prob = config.get('loop_insert_prob', 0.15)

    # Set random seed
    random.seed(seed)

    outputPath = os.path.join("output", output)
    os.makedirs(os.path.dirname(outputPath), exist_ok=True)

    instTypeSet = ["takenBranch", "unTakenBranch", "alu", "load", "store"]
    previousDest = -1
    hazardFlag = (random.random() <= hazard)
    loop_id_counter = 0
    short_branch_id_counter = 0 # Counter for unique labels for short branches

    # Available registers excluding x0 and x3 (reserved for memory base)
    available_regs = [i for i in range(1, regnum) if i != 3]
    loop_stack = []  # Stack to track nested loops

    with open(outputPath, 'w') as f:
        # Initialize memory base register (x3)
        f.write("# Initialize memory base register x3\n")
        f.write(f"lui x3, {membase >> 12}\n")
        f.write(f"addi x3, x3, {membase & 0xFFF}\n\n")

        i = 0
        while i < codelen:
            current_depth = len(loop_stack)

            # --- LOGIC: Decide whether to close a loop, start a new one, or generate a regular instruction ---

            # 1. Check if we should CLOSE the innermost loop.
            if loop_stack and random.random() < loop_exit_prob and i < (codelen - 3):
                depth, loop_id, counter_reg, break_reg, index_reg, start_label, exit_label = loop_stack.pop()
                
                # Generate the loop footer, which contains the actual loop-back logic
                loop_footer = [
                    f"\n# --- Closing Loop {loop_id} (Depth: {depth}) ---",
                    f"addi x{index_reg}, x{index_reg}, 1",
                    # CORRECTED: Branch to the specific loop's exit label instead of a fixed offset.
                    f"beq x{index_reg}, x{break_reg}, {exit_label}  # Conditional break from loop",
                    f"blt x{index_reg}, x{counter_reg}, {start_label} # Branch back to loop start",
                    f"{exit_label}: # Define loop exit label",
                    f"# --- Resuming code after Loop {loop_id} ---\n"
                ]
                f.write("\n".join(loop_footer) + "\n")
                i += 3  # Account for the 3 instructions in the footer
                continue

            # 2. Check if we should START a new loop.
            loop_prob = loop_insert_prob * (1 - current_depth / max_loop_depth) if max_loop_depth > 0 else 0
            if current_depth < max_loop_depth and random.random() < loop_prob:
                # Check if we have enough registers for a new loop
                if len(available_regs) < 3:
                    pass
                else:
                    loop_id_counter += 1
                    new_loop_id = loop_id_counter
                    target = random.randint(1, 5)
                    max_iter = random.randint(target + 1, 10)
                    
                    # Select registers, ensuring they don't conflict with the previous instruction's destination
                    loop_regs = random.sample(available_regs, 3)
                    while previousDest in loop_regs:
                        loop_regs = random.sample(available_regs, 3)
                    
                    counter_reg, break_reg, index_reg = loop_regs
                    start_label = f"loop_start_{new_loop_id}"
                    exit_label = f"loop_exit_{new_loop_id}"

                    # Push new loop context to the stack
                    loop_stack.append((current_depth + 1, new_loop_id, counter_reg, break_reg, index_reg, start_label, exit_label))

                    # Generate loop header
                    loop_header = [
                        f"\n# --- Starting Loop {new_loop_id} (Depth: {current_depth + 1}, break at {target}, max {max_iter}) ---",
                        f"addi x{counter_reg}, x0, {max_iter}",
                        f"addi x{break_reg}, x0, {target}",
                        f"addi x{index_reg}, x0, 0",
                        f"{start_label}:"
                    ]
                    f.write("\n".join(loop_header) + "\n")
                    i += 3  # Account for 3 instructions in the header
                    
                    # Update hazard tracking
                    previousDest = index_reg
                    hazardFlag = (random.random() <= hazard)
                    continue

            # 3. If we didn't start or close a loop, generate a REGULAR instruction.
            instType = random.choices(instTypeSet, weights=weights, k=1)[0]
            inst = ""

            match instType:
                case "alu":
                    op = random.choice(["add", "sub", "xor", "or", "and", "sll", "srl"])
                    dest_reg = random.choice(available_regs)
                    
                    if hazardFlag and previousDest != -1:
                        src1_reg = previousDest
                        src2_reg = random.choice([r for r in available_regs if r != dest_reg])
                    else:
                        # Avoid using previousDest as a source to prevent a hazard
                        src1_reg = random.choice([r for r in available_regs if r not in [dest_reg, previousDest]])
                        src2_reg = random.choice([r for r in available_regs if r not in [dest_reg, previousDest]])

                    inst = f"{op} x{dest_reg}, x{src1_reg}, x{src2_reg}"
                    previousDest = dest_reg
                    hazardFlag = (random.random() <= hazard)

                case "load":
                    dest_reg = random.choice(available_regs)
                    if not hazardFlag and dest_reg == previousDest:
                         # If no hazard is intended, ensure dest_reg is not the same as previousDest
                         dest_reg = random.choice([r for r in available_regs if r != previousDest])

                    mem_offset = 4 * random.randint(0, 250)
                    inst = f"lw x{dest_reg}, {mem_offset}(x3)"
                    previousDest = dest_reg
                    hazardFlag = (random.random() <= hazard)

                case "store":
                    src_reg = random.choice(available_regs)
                    if hazardFlag and previousDest != -1:
                        src_reg = previousDest
                    elif src_reg == previousDest:
                        src_reg = random.choice([r for r in available_regs if r != previousDest])
                        
                    mem_offset = 4 * random.randint(0, 250)
                    inst = f"sw x{src_reg}, {mem_offset}(x3)"
                    # Store instructions do not write to a register, so they can't cause a RAW hazard
                    hazardFlag = False
                    previousDest = -1

                case "takenBranch":
                    # CORRECTED: Use a label for the branch target instead of a fixed offset.
                    short_branch_id_counter += 1
                    label = f"skip_taken_{short_branch_id_counter}"
                    inst = f"beq x0, x0, {label} # Always branch\n"
                    inst += f"addi x0, x0, 0  # This instruction is skipped\n"
                    inst += f"{label}:"
                    i += 1 # This generates two instruction words

                case "unTakenBranch":
                    # CORRECTED: Use a label for the branch target.
                    short_branch_id_counter += 1
                    label = f"skip_nottaken_{short_branch_id_counter}"
                    inst = f"bne x0, x0, {label} # Never branch\n"
                    inst += f"addi x0, x0, 0  # This instruction is executed\n"
                    inst += f"{label}:"
                    i += 1 # This generates two instruction words

            f.write(inst + "\n")
            i += 1

        # Close any remaining open loops at the end of the file
        f.write("\n# --- Final cleanup: Closing all remaining open loops ---\n")
        while loop_stack:
            depth, loop_id, counter_reg, break_reg, index_reg, start_label, exit_label = loop_stack.pop()
            loop_footer = [
                f"\n# Closing remaining Loop {loop_id}",
                f"addi x{index_reg}, x{index_reg}, 1",
                # CORRECTED: Branch to the specific loop's exit label.
                f"beq x{index_reg}, x{break_reg}, {exit_label}",
                f"blt x{index_reg}, x{counter_reg}, {start_label}",
                f"{exit_label}:"
            ]
            f.write("\n".join(loop_footer) + "\n")

        # Proper exit sequence
        f.write("\n# Program exit\n")
        f.write("addi x0, x0, 0   # Set exit code to 0\n")
        f.write("addi x0, x0, 93  # Exit syscall number\n")
        f.write("ecall\n")

if __name__ == "__main__":
    main()
