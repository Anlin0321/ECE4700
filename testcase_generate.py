import os
import random
random.seed(42) 
InstList = {}

if __name__ == "__main__":
    outputPath = os.path.join("output", "testcase.s")
    os.makedirs(os.path.dirname(outputPath), exist_ok=True)
    codeLen = 1000
    hazardRatio = 0.5
    instTypeSet = ["branch", "alu", "load", "store", "loop"]  # Added "loop"
    weights = [0.15, 0.3, 0.15, 0.15, 0.25]  # Adjusted weights
    regNum = 6
    memBase = 0x1000
    previousDest = -1
    hazardFlag = (random.random() <= hazardRatio)
    loop_id = 0  # Unique ID for loop labels

    with open(outputPath, 'w') as f:
        # Initialize base register for memory operations
        f.write("lui x3, " + str(memBase >> 12) + "\n")
        f.write("addi x3, x3, " + str(memBase & 0xFFF) + "\n")
        
        for i in range(codeLen):
            instType = random.choices(instTypeSet, weights=weights, k=1)[0]
            reg1 = -1
            reg2 = -1
            mem = -1
            branchTarget = -1
            inst = ""
            match instType:
                case "alu":
                    # Maintain hazard handling for ALU ops
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                        reg2 = random.randint(0, 5)
                    else:
                        reg1 = random.randint(0, 5)
                        reg2 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                        while reg2 == previousDest:
                            reg2 = random.randint(0, 5)
                    inst = f"add x{reg2}, x{reg1}, x{reg2}"  # RISC-V ADD
                    previousDest = reg2
                    hazardFlag = (random.random() <= hazardRatio)
                    f.write(inst + "\n")
                
                case "load":
                    # Maintain hazard handling for loads
                    offset = random.randint(0, 3 * codeLen) & ~3  # Align to 4 bytes
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                    else:
                        reg1 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                    inst = f"lw x{reg1}, {offset}(x3)"  # RISC-V load
                    previousDest = reg1
                    hazardFlag = (random.random() <= hazardRatio)
                    f.write(inst + "\n")
                
                case "store":
                    # Maintain hazard handling for stores
                    offset = random.randint(0, 3 * codeLen) & ~3  # Align to 4 bytes
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                    else:
                        reg1 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                    inst = f"sw x{reg1}, {offset}(x3)"  # RISC-V store
                    hazardFlag = False
                    f.write(inst + "\n")
                
                case "branch":
                    # Maintain hazard handling for branches
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                    else:
                        reg1 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                    # Create branch target label
                    branch_label = f"branch_target_{i}"
                    inst = f"beq x{reg1}, x0, {branch_label}\naddi x0, x0, 0\n{branch_label}:"
                    hazardFlag = False
                    f.write(inst + "\n")
                
                case "loop":
                    # Generate loop parameters
                    num2 = random.randint(2, 10)  # Loop iterations (2-10)
                    num1 = random.randint(0, num2 - 1)  # Break condition
                    
                    # Handle hazard flag for register selection
                    if hazardFlag:
                        # Use previousDest in loop registers
                        loop_regs = [previousDest]
                        while len(loop_regs) < 3:
                            reg = random.randint(0, 5)
                            if reg != previousDest and reg not in loop_regs:
                                loop_regs.append(reg)
                        random.shuffle(loop_regs)
                    else:
                        # Avoid previousDest in loop registers
                        loop_regs = random.sample(range(regNum), 3)
                        while previousDest in loop_regs:
                            loop_regs = random.sample(range(regNum), 3)
                    
                    counter_reg, break_reg, index_reg = loop_regs
                    loop_id += 1
                    
                    # Write loop assembly
                    loop_code = [
                        f"# LOOP {loop_id} (iterations={num2}, break={num1})",
                        f"addi x{counter_reg}, x0, {num2}",
                        f"addi x{break_reg}, x0, {num1}",
                        f"addi x{index_reg}, x0, 0",
                        f"loop_start_{loop_id}:",
                        f"beq x{index_reg}, x{break_reg}, loop_exit_{loop_id}",
                        f"addi x{index_reg}, x{index_reg}, 1",
                        f"blt x{index_reg}, x{counter_reg}, loop_start_{loop_id}",
                        f"loop_exit_{loop_id}:"
                    ]
                    f.write("\n".join(loop_code))  # No newline at end
                    
                    # Update hazard tracking
                    previousDest = index_reg
                    hazardFlag = (random.random() <= hazardRatio)
                    # Only write newline if not last instruction
                    if i < codeLen - 1:
                        f.write("\n")