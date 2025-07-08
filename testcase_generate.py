import os
import random
random.seed(42) 

if __name__ == "__main__":
    outputPath = os.path.join("output", "testcase.s")
    os.makedirs(os.path.dirname(outputPath), exist_ok=True)
    codeLen = 1000
    hazardRatio = 0.5
    instTypeSet = ["takenBranch", "unTakenBranch", "alu", "load", "store"]  # Split branch types
    weights = [0.1, 0.1, 0.4, 0.2, 0.2]  # Adjusted weights
    regNum = 6
    memBase = 0x1000
    previousDest = -1
    hazardFlag = (random.random() <= hazardRatio)
    loop_id = 0

    with open(outputPath, 'w') as f:
        # Initialize memory base register
        f.write("lui x3, " + str(memBase >> 12) + "\n")
        f.write("addi x3, x3, " + str(memBase & 0xFFF) + "\n")
        
        for i in range(codeLen):
            # 10% chance to insert a loop
            if random.random() <= 0.1:
                target = random.randint(1, 10)
                max_iter = random.randint(target + 1, 20)
                
                # Select registers, avoiding x0 and previous destination
                loop_regs = random.sample(range(1, regNum), 3)
                while previousDest in loop_regs:
                    loop_regs = random.sample(range(1, regNum), 3)
                
                counter_reg, break_reg, index_reg = loop_regs
                loop_id += 1
                
                # Generate loop code
                loop_code = [
                    f"# LOOP {loop_id} (break at {target}, max {max_iter})",
                    f"addi x{counter_reg}, x0, {max_iter}",
                    f"addi x{break_reg}, x0, {target}",
                    f"addi x{index_reg}, x0, 0",
                    f"loop_start_{loop_id}:",
                    f"beq x{index_reg}, x{break_reg}, loop_exit_{loop_id}",
                    f"addi x{index_reg}, x{index_reg}, 1",
                    f"blt x{index_reg}, x{counter_reg}, loop_start_{loop_id}",
                    f"loop_exit_{loop_id}:"
                ]
                f.write("\n".join(loop_code) + "\n")
                
                # Update hazard tracking
                previousDest = index_reg
                hazardFlag = (random.random() <= hazardRatio)
                continue
            
            # Regular instruction
            instType = random.choices(instTypeSet, weights=weights, k=1)[0]
            reg1 = -1
            reg2 = -1
            mem_offset = -1
            inst = ""
            
            match instType:
                case "alu":
                    op = random.choice(["add", "sub", "xor", "or"])
                    if hazardFlag:
                        reg1 = previousDest if previousDest != -1 else random.randint(1, regNum-1)
                        reg2 = random.randint(1, regNum-1)
                    else:
                        reg1 = random.randint(1, regNum-1)
                        reg2 = random.randint(1, regNum-1)
                        while reg1 == previousDest:
                            reg1 = random.randint(1, regNum-1)
                        while reg2 == previousDest:
                            reg2 = random.randint(1, regNum-1)
                    inst = f"{op} x{reg2}, x{reg1}, x{reg2}"
                    previousDest = reg2
                    hazardFlag = (random.random() <= hazardRatio)
                
                case "load":
                    if hazardFlag:
                        reg1 = previousDest if previousDest != -1 else random.randint(1, regNum-1)
                    else:
                        reg1 = random.randint(1, regNum-1)
                        while reg1 == previousDest:
                            reg1 = random.randint(1, regNum-1)
                    # Generate aligned memory offset (multiple of 4)
                    mem_offset = 4 * random.randint(0, 250)
                    inst = f"lw x{reg1}, {mem_offset}(x3)"
                    previousDest = reg1
                    hazardFlag = (random.random() <= hazardRatio)
                
                case "store":
                    if hazardFlag:
                        reg1 = previousDest if previousDest != -1 else random.randint(1, regNum-1)
                    else:
                        reg1 = random.randint(1, regNum-1)
                        while reg1 == previousDest:
                            reg1 = random.randint(1, regNum-1)
                    # Generate aligned memory offset (multiple of 4)
                    mem_offset = 4 * random.randint(0, 250)
                    inst = f"sw x{reg1}, {mem_offset}(x3)"
                    hazardFlag = False
                
                case "takenBranch":
                    # Always taken branch (beq x0, x0)
                    branch_label = f"taken_branch_{i}"
                    inst = f"beq x0, x0, {branch_label}\n"
                    inst += f"addi x0, x0, 0  # This is skipped\n"
                    inst += f"{branch_label}:"
                    hazardFlag = False
                
                case "unTakenBranch":
                    # Never taken branch (bne x0, x0)
                    branch_label = f"untaken_branch_{i}"
                    inst = f"bne x0, x0, {branch_label}\n"
                    inst += f"addi x0, x0, 0  # This is executed"
                    hazardFlag = False
            
            f.write(inst + "\n")
        
        # Add final infinite loop to prevent running off end
        f.write("end:\n")
        f.write("j end\n")