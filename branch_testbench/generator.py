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

            # 1. Check if we should CLOSE the innermost loop
            # Ensure there's enough space for the loop footer instructions
            if loop_stack and random.random() < loop_exit_prob and i < (codelen - 5):
                depth, loop_id, counter_reg, break_reg, index_reg, start_label, end_label = loop_stack.pop()
                
                # Generate the loop footer using labels
                loop_footer = [
                    f"\n# --- Closing Loop {loop_id} (Depth: {depth}) ---",
                    f"addi x{index_reg}, x{index_reg}, 1",
                    f"beq x{index_reg}, x{break_reg}, {end_label}  # Conditional break from loop",
                    f"bge x{index_reg}, x{counter_reg}, {end_label} # Main loop exit condition",
                    f"j {start_label} # Jump back to loop start",
                    f"{end_label}: # --- Resuming code after Loop {loop_id} ---"
                ]
                f.write("\n".join(loop_footer) + "\n\n")
                i += 4  # Account for instructions in footer
                continue

            # 2. Check if we should START a new loop
            loop_prob = loop_insert_prob * (1 - current_depth / max_loop_depth) if max_loop_depth > 0 else 0
            if current_depth < max_loop_depth and random.random() < loop_prob and len(available_regs) >= 3:
                loop_id_counter += 1
                new_loop_id = loop_id_counter
                target = random.randint(1, 5)
                max_iter = random.randint(target + 1, 10)
                
                # Define unique labels for the new loop
                start_label = f"loop_start_{new_loop_id}"
                end_label = f"loop_end_{new_loop_id}"

                # Select registers, ensuring no conflicts with previous instruction
                loop_regs = random.sample(available_regs, 3)
                while previousDest in loop_regs:
                    loop_regs = random.sample(available_regs, 3)
                
                counter_reg, break_reg, index_reg = loop_regs

                # Push new loop context to stack, now including labels
                loop_stack.append((current_depth + 1, new_loop_id, counter_reg, break_reg, index_reg, start_label, end_label))

                # Generate loop header and the start label
                loop_header = [
                    f"\n# --- Starting Loop {new_loop_id} (Depth: {current_depth + 1}, break at {target}, max {max_iter}) ---",
                    f"addi x{counter_reg}, x0, {max_iter}",
                    f"addi x{break_reg}, x0, {target}",
                    f"addi x{index_reg}, x0, 0",
                    f"{start_label}: # Loop body start"
                ]
                f.write("\n".join(loop_header) + "\n")
                i += 3  # Account for 3 instructions in header
                
                # Update hazard tracking
                previousDest = index_reg
                hazardFlag = (random.random() <= hazard)
                continue

            # 3. Generate REGULAR instruction
            instType = random.choices(instTypeSet, weights=weights, k=1)[0]
            inst = ""
            extra_inst = 0

            match instType:
                case "alu":
                    op = random.choice(["add", "sub", "xor", "or", "and", "sll", "srl"])
                    dest_reg = random.choice(available_regs)
                    
                    if hazardFlag and previousDest != -1:
                        src1_reg = previousDest
                        src2_reg = random.choice([r for r in available_regs if r != dest_reg])
                    else:
                        src1_reg = random.choice([r for r in available_regs if r != dest_reg])
                        src2_reg = random.choice([r for r in available_regs if r not in [dest_reg, src1_reg]])

                    inst = f"{op} x{dest_reg}, x{src1_reg}, x{src2_reg}"
                    previousDest = dest_reg
                    hazardFlag = (random.random() <= hazard)

                case "load":
                    dest_reg = random.choice(available_regs)
                    if not hazardFlag and dest_reg == previousDest:
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
                    hazardFlag = False
                    previousDest = -1

                case "takenBranch":
                    inst = "beq x0, x0, 8 # Always branch\n"
                    inst += "nop # Skipped instruction\n"
                    inst += "nop # Target of the branch"
                    extra_inst = 2

                case "unTakenBranch":
                    inst = "bne x0, x0, 8 # Never branch\n"
                    inst += "nop # Executed instruction"
                    extra_inst = 1

            f.write(inst + "\n")
            i += 1 + extra_inst

        # Close any remaining open loops using labels
        f.write("\n# --- Final cleanup: Closing all remaining open loops ---\n")
        while loop_stack:
            depth, loop_id, counter_reg, break_reg, index_reg, start_label, end_label = loop_stack.pop()
            loop_footer = [
                f"\n# Closing remaining Loop {loop_id}",
                f"addi x{index_reg}, x{index_reg}, 1",
                f"beq x{index_reg}, x{break_reg}, {end_label}",
                f"bge x{index_reg}, x{counter_reg}, {end_label}",
                f"j {start_label}",
                f"{end_label}: # Loop exit"
            ]
            f.write("\n".join(loop_footer) + "\n")

        # Proper exit sequence
        f.write("\n# Program exit\n")
        f.write("li x7, 93 # ecall: exit\n")
        f.write("ecall\n")

if __name__ == "__main__":
    main()
