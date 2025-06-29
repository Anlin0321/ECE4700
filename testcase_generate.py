import os
import random
random.seed(42) 
InstList = {}


if __name__ == "__main__":
    outputPath = os.path.join("output", "testcase.s")
    os.makedirs(os.path.dirname(outputPath), exist_ok=True)
    codeLen = 1000
    hazardRatio = 0.5 # (alu% + load%) * hazardRatio = hazard ratio in the whole program
    instTypeSet = ["branch", "alu", "load", "store"]
    weights = [0.2, 0.4, 0.2, 0.2]
    regNum = 6
    memBase = 0x1000
    previousDest = -1
    hazardFlag = (random.random() <= hazardRatio)

    with open(outputPath, 'w') as f:
        for i in range(codeLen):
            instType = random.choices(instTypeSet, weights=weights, k=1)[0]
            reg1 = -1
            reg2 = -1 # destiny
            mem = -1
            branchTarget = -1
            inst = ""
            match instType:
                case "alu":
                    inst = instType ## FIXME
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
                    inst = " ".join([instType, str(reg1), str(reg2)])
                    previousDest = reg2
                    hazardFlag = (random.random() <= hazardRatio)
                case "load":
                    inst = instType ## FIXME
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                        mem = memBase + random.randint(0, 3 * codeLen)
                    else:
                        reg1 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                        mem = memBase + random.randint(0, 3 * codeLen)
                    inst = " ".join([instType, str(reg1), str(mem)])
                    previousDest = reg1
                    hazardFlag = (random.random() <= hazardRatio)
                case "store":
                    inst = instType ## FIXME
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                        mem = memBase + random.randint(0, 3 * codeLen)
                    else:
                        reg1 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                        mem = memBase + random.randint(0, 3 * codeLen)
                    inst = " ".join([instType, str(reg1), str(mem)])
                    hazardFlag = False
                case "branch":
                    inst = instType ## FIXME
                    if hazardFlag:
                        reg1 = previousDest
                        if reg1 == -1:
                            reg1 = random.randint(0, 5)
                        branchTarget = random.randint(0, int(codeLen / 2))
                    else:
                        reg1 = random.randint(0, 5)
                        while reg1 == previousDest:
                            reg1 = random.randint(0, 5)
                        branchTarget = random.randint(0, int(codeLen / 2))
                    inst = " ".join([instType, str(reg1), str(branchTarget)])
                    hazardFlag = False
            
            f.write(inst + "\n")