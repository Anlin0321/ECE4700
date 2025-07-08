import os
import random
import argparse
import yaml

def load_config(config_path):
    with open(config_path, 'r') as f:
        return yaml.safe_load(f)

def main():
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
    loop_id = 0
    
    # Available registers excluding x3 (reserved for memory) and x0
    available_regs = [i for i in range(1, regnum) if i != 3]
    loop_stack = []  # Stack to track nested loops

    with open(outputPath, 'w') as f:
        # Initialize memory base register (x3)
        f.write("lui x3, " + str(membase >> 12) + "\n")
        f.write("addi x3, x3, " + str(membase & 0xFFF) + "\n")
        
        i = 0
        while i < codelen:
            # Handle loop exits first if we're in a loop
            if loop_stack and random.random() < loop_exit_prob:
                depth, counter_reg, break_reg, index_reg, start_label, exit_label = loop_stack.pop()
                f.write(f"j {exit_label}  # Exit loop {depth}\n")
                i += 1
                continue
            
            # Determine loop insertion probability based on current depth
            current_depth = len(loop_stack)
            loop_prob = loop_insert_prob * (1 - current_depth/max_loop_depth)
            
            if current_depth < max_loop_depth and random.random() < loop_prob:
                # Generate loop
                target = random.randint(1, 5)
                max_iter = random.randint(target + 1, 10)
                loop_id += 1
                current_depth = len(loop_stack) + 1
                
                # Check if we have enough registers
                if len(available_regs) < 3:
                    # Not enough registers for loop - generate regular instruction instead
                    pass
                else:
                    # Select registers from available set
                    loop_regs = random.sample(available_regs, 3)
                    while previousDest in loop_regs:
                        loop_regs = random.sample(available_regs, 3)
                    
                    counter_reg, break_reg, index_reg = loop_regs
                    start_label = f"loop_start_{loop_id}"
                    exit_label = f"loop_exit_{loop_id}"
                    
                    # Push loop context to stack
                    loop_stack.append((current_depth, counter_reg, break_reg, index_reg, start_label, exit_label))
                    
                    # Generate loop header
                    loop_header = [
                        f"# LOOP {loop_id} (depth {current_depth}, break at {target}, max {max_iter})",
                        f"addi x{counter_reg}, x0, {max_iter}",
                        f"addi x{break_reg}, x0, {target}",
                        f"addi x{index_reg}, x0, 0",
                        f"{start_label}:"
                    ]
                    f.write("\n".join(loop_header) + "\n")
                    i += 3  # Account for 3 instructions
                    
                    # Update hazard tracking
                    previousDest = index_reg
                    hazardFlag = (random.random() <= hazard)
                    continue
            
            # Regular instruction
            instType = random.choices(instTypeSet, weights=weights, k=1)[0]
            inst = ""
            
            match instType:
                case "alu":
                    op = random.choice(["add", "sub", "xor", "or", "and", "sll", "srl"])
                    if hazardFlag:
                        reg1 = previousDest if previousDest != -1 else random.choice(available_regs)
                        reg2 = random.choice(available_regs)
                    else:
                        reg1 = random.choice(available_regs)
                        reg2 = random.choice(available_regs)
                        while reg1 == previousDest:
                            reg1 = random.choice(available_regs)
                        while reg2 == previousDest:
                            reg2 = random.choice(available_regs)
                    inst = f"{op} x{reg2}, x{reg1}, x{reg2}"
                    previousDest = reg2
                    hazardFlag = (random.random() <= hazard)
                
                case "load":
                    if hazardFlag:
                        reg1 = previousDest if previousDest != -1 else random.choice(available_regs)
                    else:
                        reg1 = random.choice(available_regs)
                        while reg1 == previousDest:
                            reg1 = random.choice(available_regs)
                    # Generate aligned memory offset
                    mem_offset = 4 * random.randint(0, 250)
                    inst = f"lw x{reg1}, {mem_offset}(x3)"
                    previousDest = reg1
                    hazardFlag = (random.random() <= hazard)
                
                case "store":
                    if hazardFlag:
                        reg1 = previousDest if previousDest != -1 else random.choice(available_regs)
                    else:
                        reg1 = random.choice(available_regs)
                        while reg1 == previousDest:
                            reg1 = random.choice(available_regs)
                    mem_offset = 4 * random.randint(0, 250)
                    inst = f"sw x{reg1}, {mem_offset}(x3)"
                    hazardFlag = False
                
                case "takenBranch":
                    # Taken branch (jump to instruction after next)
                    inst = "beq x0, x0, 8\n"
                    inst += "addi x0, x0, 0  # Skipped instruction"
                
                case "unTakenBranch":
                    # Untaken branch (fall through to next instruction)
                    inst = "bne x0, x0, 8\n"
                    inst += "addi x0, x0, 0  # Executed instruction"
            
            f.write(inst + "\n")
            i += 1
        
        # Close any remaining open loops
        while loop_stack:
            depth, counter_reg, break_reg, index_reg, start_label, exit_label = loop_stack.pop()
            loop_footer = [
                f"addi x{index_reg}, x{index_reg}, 1",
                f"beq x{index_reg}, x{break_reg}, 8   # Break to skip next instruction",
                f"blt x{index_reg}, x{counter_reg}, {start_label}",
                f"{exit_label}:"
            ]
            f.write("\n".join(loop_footer) + "\n")
        
        # Proper exit sequence
        f.write("\n# Program exit\n")
        f.write("addi a0, zero, 0     # Set exit code to 0\n")
        f.write("addi a7, zero, 93    # Exit syscall number\n")
        f.write("ecall\n")

if __name__ == "__main__":
    main()