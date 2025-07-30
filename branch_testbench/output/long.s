# Initialize memory base register x3
lui x3, 9
addi x3, x3, 0

lw x5, 648(x3)
sw x1, 28(x3)

# --- Starting Loop 1 (Depth: 1, break at 3, max 9) ---
addi x1, x0, 9
addi x8, x0, 3
addi x9, x0, 0
loop_start_1: # Loop body start
sw x9, 404(x3)
or x2, x6, x9
or x6, x2, x1
lw x8, 188(x3)
sw x8, 624(x3)
srl x6, x9, x1
lw x4, 736(x3)

# --- Closing Loop 1 (Depth: 1) ---
addi x9, x9, 1
beq x9, x8, loop_end_1  # Conditional break from loop
bge x9, x1, loop_end_1 # Main loop exit condition
j loop_start_1 # Jump back to loop start
loop_end_1: # --- Resuming code after Loop 1 ---


# --- Starting Loop 2 (Depth: 1, break at 3, max 5) ---
addi x1, x0, 5
addi x7, x0, 3
addi x8, x0, 0
loop_start_2: # Loop body start
lw x1, 528(x3)

# --- Closing Loop 2 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_end_2  # Conditional break from loop
bge x8, x1, loop_end_2 # Main loop exit condition
j loop_start_2 # Jump back to loop start
loop_end_2: # --- Resuming code after Loop 2 ---

add x2, x6, x7

# --- Starting Loop 3 (Depth: 1, break at 4, max 9) ---
addi x6, x0, 9
addi x7, x0, 4
addi x8, x0, 0
loop_start_3: # Loop body start

# --- Starting Loop 4 (Depth: 2, break at 4, max 10) ---
addi x6, x0, 10
addi x5, x0, 4
addi x2, x0, 0
loop_start_4: # Loop body start

# --- Closing Loop 4 (Depth: 2) ---
addi x2, x2, 1
beq x2, x5, loop_end_4  # Conditional break from loop
bge x2, x6, loop_end_4 # Main loop exit condition
j loop_start_4 # Jump back to loop start
loop_end_4: # --- Resuming code after Loop 4 ---


# --- Starting Loop 5 (Depth: 2, break at 3, max 6) ---
addi x7, x0, 6
addi x1, x0, 3
addi x5, x0, 0
loop_start_5: # Loop body start
lw x5, 0(x3)
sw x8, 276(x3)
sw x9, 956(x3)

# --- Closing Loop 5 (Depth: 2) ---
addi x5, x5, 1
beq x5, x1, loop_end_5  # Conditional break from loop
bge x5, x7, loop_end_5 # Main loop exit condition
j loop_start_5 # Jump back to loop start
loop_end_5: # --- Resuming code after Loop 5 ---

lw x1, 868(x3)

# --- Closing Loop 3 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_end_3  # Conditional break from loop
bge x8, x6, loop_end_3 # Main loop exit condition
j loop_start_3 # Jump back to loop start
loop_end_3: # --- Resuming code after Loop 3 ---

lw x5, 16(x3)

# --- Starting Loop 6 (Depth: 1, break at 1, max 2) ---
addi x8, x0, 2
addi x1, x0, 1
addi x6, x0, 0
loop_start_6: # Loop body start
sw x6, 416(x3)

# --- Starting Loop 7 (Depth: 2, break at 3, max 8) ---
addi x4, x0, 8
addi x7, x0, 3
addi x5, x0, 0
loop_start_7: # Loop body start

# --- Starting Loop 8 (Depth: 3, break at 1, max 4) ---
addi x7, x0, 4
addi x2, x0, 1
addi x4, x0, 0
loop_start_8: # Loop body start
sw x2, 500(x3)
lw x8, 492(x3)
lw x2, 956(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x2, 192(x3)

# --- Closing Loop 8 (Depth: 3) ---
addi x4, x4, 1
beq x4, x2, loop_end_8  # Conditional break from loop
bge x4, x7, loop_end_8 # Main loop exit condition
j loop_start_8 # Jump back to loop start
loop_end_8: # --- Resuming code after Loop 8 ---


# --- Starting Loop 9 (Depth: 3, break at 5, max 7) ---
addi x6, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_9: # Loop body start
sw x5, 336(x3)
sub x7, x8, x1
sw x1, 156(x3)
add x9, x2, x1
sub x7, x9, x1
sw x7, 516(x3)
sw x7, 880(x3)
lw x2, 244(x3)

# --- Starting Loop 10 (Depth: 4, break at 2, max 6) ---
addi x1, x0, 6
addi x8, x0, 2
addi x7, x0, 0
loop_start_10: # Loop body start
sw x6, 64(x3)

# --- Closing Loop 10 (Depth: 4) ---
addi x7, x7, 1
beq x7, x8, loop_end_10  # Conditional break from loop
bge x7, x1, loop_end_10 # Main loop exit condition
j loop_start_10 # Jump back to loop start
loop_end_10: # --- Resuming code after Loop 10 ---


# --- Closing Loop 9 (Depth: 3) ---
addi x5, x5, 1
beq x5, x4, loop_end_9  # Conditional break from loop
bge x5, x6, loop_end_9 # Main loop exit condition
j loop_start_9 # Jump back to loop start
loop_end_9: # --- Resuming code after Loop 9 ---


# --- Starting Loop 11 (Depth: 3, break at 4, max 9) ---
addi x5, x0, 9
addi x4, x0, 4
addi x6, x0, 0
loop_start_11: # Loop body start
sw x6, 304(x3)
add x8, x4, x1
sw x8, 180(x3)

# --- Starting Loop 12 (Depth: 4, break at 1, max 7) ---
addi x8, x0, 7
addi x2, x0, 1
addi x6, x0, 0
loop_start_12: # Loop body start
lw x8, 668(x3)
and x4, x8, x9
srl x7, x6, x9
sw x7, 156(x3)
srl x9, x8, x6
lw x4, 252(x3)
sw x7, 932(x3)
xor x9, x1, x7
lw x9, 932(x3)
lw x8, 484(x3)
and x9, x8, x2
or x5, x9, x4
lw x7, 404(x3)
sw x4, 828(x3)
sw x5, 776(x3)

# --- Closing Loop 12 (Depth: 4) ---
addi x6, x6, 1
beq x6, x2, loop_end_12  # Conditional break from loop
bge x6, x8, loop_end_12 # Main loop exit condition
j loop_start_12 # Jump back to loop start
loop_end_12: # --- Resuming code after Loop 12 ---


# --- Starting Loop 13 (Depth: 4, break at 4, max 8) ---
addi x5, x0, 8
addi x8, x0, 4
addi x9, x0, 0
loop_start_13: # Loop body start
lw x7, 24(x3)

# --- Starting Loop 14 (Depth: 5, break at 2, max 10) ---
addi x9, x0, 10
addi x6, x0, 2
addi x1, x0, 0
loop_start_14: # Loop body start
lw x2, 652(x3)
sw x2, 444(x3)
sw x2, 844(x3)
sw x7, 984(x3)
sw x6, 420(x3)

# --- Closing Loop 14 (Depth: 5) ---
addi x1, x1, 1
beq x1, x6, loop_end_14  # Conditional break from loop
bge x1, x9, loop_end_14 # Main loop exit condition
j loop_start_14 # Jump back to loop start
loop_end_14: # --- Resuming code after Loop 14 ---

or x5, x8, x6
lw x2, 924(x3)

# --- Closing Loop 13 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_end_13  # Conditional break from loop
bge x9, x5, loop_end_13 # Main loop exit condition
j loop_start_13 # Jump back to loop start
loop_end_13: # --- Resuming code after Loop 13 ---

lw x1, 676(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 15 (Depth: 4, break at 5, max 9) ---
addi x8, x0, 9
addi x6, x0, 5
addi x7, x0, 0
loop_start_15: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x5, 660(x3)

# --- Starting Loop 16 (Depth: 5, break at 1, max 3) ---
addi x9, x0, 3
addi x2, x0, 1
addi x4, x0, 0
loop_start_16: # Loop body start
sub x8, x2, x1

# --- Starting Loop 17 (Depth: 6, break at 2, max 9) ---
addi x4, x0, 9
addi x5, x0, 2
addi x6, x0, 0
loop_start_17: # Loop body start
lw x4, 500(x3)
xor x4, x6, x9
sw x4, 624(x3)
sw x4, 876(x3)

# --- Closing Loop 17 (Depth: 6) ---
addi x6, x6, 1
beq x6, x5, loop_end_17  # Conditional break from loop
bge x6, x4, loop_end_17 # Main loop exit condition
j loop_start_17 # Jump back to loop start
loop_end_17: # --- Resuming code after Loop 17 ---

lw x6, 684(x3)
sw x1, 212(x3)

# --- Closing Loop 16 (Depth: 5) ---
addi x4, x4, 1
beq x4, x2, loop_end_16  # Conditional break from loop
bge x4, x9, loop_end_16 # Main loop exit condition
j loop_start_16 # Jump back to loop start
loop_end_16: # --- Resuming code after Loop 16 ---

srl x5, x2, x6

# --- Closing Loop 15 (Depth: 4) ---
addi x7, x7, 1
beq x7, x6, loop_end_15  # Conditional break from loop
bge x7, x8, loop_end_15 # Main loop exit condition
j loop_start_15 # Jump back to loop start
loop_end_15: # --- Resuming code after Loop 15 ---

lw x7, 672(x3)

# --- Starting Loop 18 (Depth: 4, break at 2, max 5) ---
addi x2, x0, 5
addi x5, x0, 2
addi x8, x0, 0
loop_start_18: # Loop body start
sll x4, x8, x8
sw x9, 756(x3)

# --- Starting Loop 19 (Depth: 5, break at 4, max 5) ---
addi x4, x0, 5
addi x2, x0, 4
addi x6, x0, 0
loop_start_19: # Loop body start
lw x7, 236(x3)
sll x6, x7, x9
sw x6, 44(x3)
lw x1, 196(x3)
sw x1, 988(x3)

# --- Closing Loop 19 (Depth: 5) ---
addi x6, x6, 1
beq x6, x2, loop_end_19  # Conditional break from loop
bge x6, x4, loop_end_19 # Main loop exit condition
j loop_start_19 # Jump back to loop start
loop_end_19: # --- Resuming code after Loop 19 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 20 (Depth: 5, break at 3, max 9) ---
addi x2, x0, 9
addi x1, x0, 3
addi x4, x0, 0
loop_start_20: # Loop body start
srl x5, x4, x6

# --- Starting Loop 21 (Depth: 6, break at 2, max 8) ---
addi x8, x0, 8
addi x6, x0, 2
addi x7, x0, 0
loop_start_21: # Loop body start
add x9, x8, x5
sw x4, 292(x3)

# --- Closing Loop 21 (Depth: 6) ---
addi x7, x7, 1
beq x7, x6, loop_end_21  # Conditional break from loop
bge x7, x8, loop_end_21 # Main loop exit condition
j loop_start_21 # Jump back to loop start
loop_end_21: # --- Resuming code after Loop 21 ---


# --- Closing Loop 20 (Depth: 5) ---
addi x4, x4, 1
beq x4, x1, loop_end_20  # Conditional break from loop
bge x4, x2, loop_end_20 # Main loop exit condition
j loop_start_20 # Jump back to loop start
loop_end_20: # --- Resuming code after Loop 20 ---

srl x8, x5, x4
sw x8, 88(x3)

# --- Closing Loop 18 (Depth: 4) ---
addi x8, x8, 1
beq x8, x5, loop_end_18  # Conditional break from loop
bge x8, x2, loop_end_18 # Main loop exit condition
j loop_start_18 # Jump back to loop start
loop_end_18: # --- Resuming code after Loop 18 ---

srl x4, x9, x1
add x2, x4, x4

# --- Starting Loop 22 (Depth: 4, break at 4, max 7) ---
addi x6, x0, 7
addi x8, x0, 4
addi x9, x0, 0
loop_start_22: # Loop body start
add x5, x7, x4
lw x9, 884(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x9, 420(x3)
sw x8, 712(x3)
sw x6, 348(x3)
lw x7, 468(x3)
add x2, x7, x6
sll x8, x2, x5
and x9, x8, x5

# --- Closing Loop 22 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_end_22  # Conditional break from loop
bge x9, x6, loop_end_22 # Main loop exit condition
j loop_start_22 # Jump back to loop start
loop_end_22: # --- Resuming code after Loop 22 ---

sw x2, 884(x3)
sub x2, x5, x9

# --- Closing Loop 11 (Depth: 3) ---
addi x6, x6, 1
beq x6, x4, loop_end_11  # Conditional break from loop
bge x6, x5, loop_end_11 # Main loop exit condition
j loop_start_11 # Jump back to loop start
loop_end_11: # --- Resuming code after Loop 11 ---

sw x2, 928(x3)
and x5, x4, x6
sw x7, 632(x3)
lw x9, 956(x3)
sll x8, x9, x9
sw x4, 976(x3)
lw x8, 628(x3)
lw x8, 216(x3)

# --- Starting Loop 23 (Depth: 3, break at 5, max 9) ---
addi x9, x0, 9
addi x4, x0, 5
addi x2, x0, 0
loop_start_23: # Loop body start

# --- Closing Loop 23 (Depth: 3) ---
addi x2, x2, 1
beq x2, x4, loop_end_23  # Conditional break from loop
bge x2, x9, loop_end_23 # Main loop exit condition
j loop_start_23 # Jump back to loop start
loop_end_23: # --- Resuming code after Loop 23 ---


# --- Closing Loop 7 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_end_7  # Conditional break from loop
bge x5, x4, loop_end_7 # Main loop exit condition
j loop_start_7 # Jump back to loop start
loop_end_7: # --- Resuming code after Loop 7 ---

lw x6, 96(x3)
lw x5, 736(x3)

# --- Starting Loop 24 (Depth: 2, break at 2, max 7) ---
addi x9, x0, 7
addi x7, x0, 2
addi x1, x0, 0
loop_start_24: # Loop body start
add x1, x1, x4

# --- Starting Loop 25 (Depth: 3, break at 3, max 5) ---
addi x9, x0, 5
addi x5, x0, 3
addi x2, x0, 0
loop_start_25: # Loop body start
sub x6, x2, x8
srl x7, x2, x8
sw x7, 500(x3)
sw x5, 844(x3)

# --- Starting Loop 26 (Depth: 4, break at 3, max 5) ---
addi x2, x0, 5
addi x4, x0, 3
addi x9, x0, 0
loop_start_26: # Loop body start
sll x2, x9, x5
lw x4, 704(x3)
or x1, x5, x6
sub x9, x5, x8

# --- Closing Loop 26 (Depth: 4) ---
addi x9, x9, 1
beq x9, x4, loop_end_26  # Conditional break from loop
bge x9, x2, loop_end_26 # Main loop exit condition
j loop_start_26 # Jump back to loop start
loop_end_26: # --- Resuming code after Loop 26 ---


# --- Starting Loop 27 (Depth: 4, break at 2, max 5) ---
addi x7, x0, 5
addi x5, x0, 2
addi x1, x0, 0
loop_start_27: # Loop body start
lw x2, 8(x3)
sw x2, 520(x3)
lw x5, 560(x3)
lw x4, 200(x3)
sw x4, 736(x3)
lw x5, 536(x3)
sw x5, 252(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 28 (Depth: 5, break at 2, max 4) ---
addi x1, x0, 4
addi x8, x0, 2
addi x9, x0, 0
loop_start_28: # Loop body start

# --- Closing Loop 28 (Depth: 5) ---
addi x9, x9, 1
beq x9, x8, loop_end_28  # Conditional break from loop
bge x9, x1, loop_end_28 # Main loop exit condition
j loop_start_28 # Jump back to loop start
loop_end_28: # --- Resuming code after Loop 28 ---

lw x8, 312(x3)
and x1, x6, x4
xor x8, x1, x9
lw x5, 356(x3)
sw x1, 544(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x6, 592(x3)
sw x4, 816(x3)

# --- Closing Loop 27 (Depth: 4) ---
addi x1, x1, 1
beq x1, x5, loop_end_27  # Conditional break from loop
bge x1, x7, loop_end_27 # Main loop exit condition
j loop_start_27 # Jump back to loop start
loop_end_27: # --- Resuming code after Loop 27 ---

or x5, x8, x9
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 29 (Depth: 4, break at 5, max 8) ---
addi x2, x0, 8
addi x9, x0, 5
addi x8, x0, 0
loop_start_29: # Loop body start
srl x4, x6, x8
sw x4, 568(x3)
sub x7, x4, x6
lw x1, 980(x3)

# --- Starting Loop 30 (Depth: 5, break at 2, max 3) ---
addi x8, x0, 3
addi x5, x0, 2
addi x4, x0, 0
loop_start_30: # Loop body start
xor x1, x5, x4

# --- Closing Loop 30 (Depth: 5) ---
addi x4, x4, 1
beq x4, x5, loop_end_30  # Conditional break from loop
bge x4, x8, loop_end_30 # Main loop exit condition
j loop_start_30 # Jump back to loop start
loop_end_30: # --- Resuming code after Loop 30 ---

sw x1, 744(x3)
lw x9, 532(x3)
and x9, x9, x4

# --- Closing Loop 29 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_end_29  # Conditional break from loop
bge x8, x2, loop_end_29 # Main loop exit condition
j loop_start_29 # Jump back to loop start
loop_end_29: # --- Resuming code after Loop 29 ---

or x1, x4, x5

# --- Closing Loop 25 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_end_25  # Conditional break from loop
bge x2, x9, loop_end_25 # Main loop exit condition
j loop_start_25 # Jump back to loop start
loop_end_25: # --- Resuming code after Loop 25 ---

lw x4, 512(x3)

# --- Starting Loop 31 (Depth: 3, break at 1, max 4) ---
addi x5, x0, 4
addi x8, x0, 1
addi x9, x0, 0
loop_start_31: # Loop body start
sw x4, 484(x3)
lw x5, 780(x3)

# --- Starting Loop 32 (Depth: 4, break at 5, max 8) ---
addi x9, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_32: # Loop body start
lw x1, 648(x3)
lw x2, 84(x3)
and x1, x2, x2

# --- Closing Loop 32 (Depth: 4) ---
addi x4, x4, 1
beq x4, x6, loop_end_32  # Conditional break from loop
bge x4, x9, loop_end_32 # Main loop exit condition
j loop_start_32 # Jump back to loop start
loop_end_32: # --- Resuming code after Loop 32 ---

sll x6, x5, x2
or x2, x6, x1
sw x2, 472(x3)
xor x8, x1, x7
sw x8, 488(x3)

# --- Starting Loop 33 (Depth: 4, break at 1, max 4) ---
addi x7, x0, 4
addi x8, x0, 1
addi x4, x0, 0
loop_start_33: # Loop body start

# --- Starting Loop 34 (Depth: 5, break at 1, max 5) ---
addi x6, x0, 5
addi x7, x0, 1
addi x2, x0, 0
loop_start_34: # Loop body start

# --- Closing Loop 34 (Depth: 5) ---
addi x2, x2, 1
beq x2, x7, loop_end_34  # Conditional break from loop
bge x2, x6, loop_end_34 # Main loop exit condition
j loop_start_34 # Jump back to loop start
loop_end_34: # --- Resuming code after Loop 34 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sub x9, x2, x1
lw x6, 660(x3)
srl x2, x6, x1

# --- Starting Loop 35 (Depth: 5, break at 1, max 3) ---
addi x7, x0, 3
addi x1, x0, 1
addi x6, x0, 0
loop_start_35: # Loop body start

# --- Closing Loop 35 (Depth: 5) ---
addi x6, x6, 1
beq x6, x1, loop_end_35  # Conditional break from loop
bge x6, x7, loop_end_35 # Main loop exit condition
j loop_start_35 # Jump back to loop start
loop_end_35: # --- Resuming code after Loop 35 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 364(x3)

# --- Closing Loop 33 (Depth: 4) ---
addi x4, x4, 1
beq x4, x8, loop_end_33  # Conditional break from loop
bge x4, x7, loop_end_33 # Main loop exit condition
j loop_start_33 # Jump back to loop start
loop_end_33: # --- Resuming code after Loop 33 ---


# --- Closing Loop 31 (Depth: 3) ---
addi x9, x9, 1
beq x9, x8, loop_end_31  # Conditional break from loop
bge x9, x5, loop_end_31 # Main loop exit condition
j loop_start_31 # Jump back to loop start
loop_end_31: # --- Resuming code after Loop 31 ---


# --- Starting Loop 36 (Depth: 3, break at 1, max 6) ---
addi x9, x0, 6
addi x4, x0, 1
addi x2, x0, 0
loop_start_36: # Loop body start
sw x6, 548(x3)

# --- Closing Loop 36 (Depth: 3) ---
addi x2, x2, 1
beq x2, x4, loop_end_36  # Conditional break from loop
bge x2, x9, loop_end_36 # Main loop exit condition
j loop_start_36 # Jump back to loop start
loop_end_36: # --- Resuming code after Loop 36 ---

sw x9, 392(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
xor x1, x9, x4
sll x7, x1, x5
xor x8, x7, x4
lw x6, 820(x3)

# --- Starting Loop 37 (Depth: 3, break at 1, max 9) ---
addi x5, x0, 9
addi x2, x0, 1
addi x7, x0, 0
loop_start_37: # Loop body start

# --- Closing Loop 37 (Depth: 3) ---
addi x7, x7, 1
beq x7, x2, loop_end_37  # Conditional break from loop
bge x7, x5, loop_end_37 # Main loop exit condition
j loop_start_37 # Jump back to loop start
loop_end_37: # --- Resuming code after Loop 37 ---

sw x4, 60(x3)
sw x2, 592(x3)
lw x8, 60(x3)
sw x8, 980(x3)

# --- Closing Loop 24 (Depth: 2) ---
addi x1, x1, 1
beq x1, x7, loop_end_24  # Conditional break from loop
bge x1, x9, loop_end_24 # Main loop exit condition
j loop_start_24 # Jump back to loop start
loop_end_24: # --- Resuming code after Loop 24 ---

sll x6, x7, x8

# --- Starting Loop 38 (Depth: 2, break at 5, max 10) ---
addi x2, x0, 10
addi x1, x0, 5
addi x9, x0, 0
loop_start_38: # Loop body start
sw x6, 392(x3)

# --- Starting Loop 39 (Depth: 3, break at 1, max 9) ---
addi x6, x0, 9
addi x7, x0, 1
addi x8, x0, 0
loop_start_39: # Loop body start
sw x9, 568(x3)
add x6, x9, x2
and x5, x7, x4
or x5, x5, x9
sw x4, 492(x3)
add x5, x2, x9
lw x1, 916(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x4, x9, x8

# --- Starting Loop 40 (Depth: 4, break at 5, max 6) ---
addi x7, x0, 6
addi x5, x0, 5
addi x9, x0, 0
loop_start_40: # Loop body start
sw x9, 240(x3)
lw x4, 440(x3)
add x2, x7, x8
lw x4, 428(x3)

# --- Starting Loop 41 (Depth: 5, break at 1, max 9) ---
addi x9, x0, 9
addi x1, x0, 1
addi x8, x0, 0
loop_start_41: # Loop body start
sub x7, x8, x6

# --- Closing Loop 41 (Depth: 5) ---
addi x8, x8, 1
beq x8, x1, loop_end_41  # Conditional break from loop
bge x8, x9, loop_end_41 # Main loop exit condition
j loop_start_41 # Jump back to loop start
loop_end_41: # --- Resuming code after Loop 41 ---

sw x7, 432(x3)
or x4, x1, x5
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 224(x3)
srl x8, x5, x1

# --- Starting Loop 42 (Depth: 5, break at 2, max 5) ---
addi x1, x0, 5
addi x7, x0, 2
addi x5, x0, 0
loop_start_42: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 42 (Depth: 5) ---
addi x5, x5, 1
beq x5, x7, loop_end_42  # Conditional break from loop
bge x5, x1, loop_end_42 # Main loop exit condition
j loop_start_42 # Jump back to loop start
loop_end_42: # --- Resuming code after Loop 42 ---


# --- Closing Loop 40 (Depth: 4) ---
addi x9, x9, 1
beq x9, x5, loop_end_40  # Conditional break from loop
bge x9, x7, loop_end_40 # Main loop exit condition
j loop_start_40 # Jump back to loop start
loop_end_40: # --- Resuming code after Loop 40 ---

and x6, x5, x2

# --- Closing Loop 39 (Depth: 3) ---
addi x8, x8, 1
beq x8, x7, loop_end_39  # Conditional break from loop
bge x8, x6, loop_end_39 # Main loop exit condition
j loop_start_39 # Jump back to loop start
loop_end_39: # --- Resuming code after Loop 39 ---


# --- Starting Loop 43 (Depth: 3, break at 1, max 3) ---
addi x8, x0, 3
addi x7, x0, 1
addi x4, x0, 0
loop_start_43: # Loop body start

# --- Closing Loop 43 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_end_43  # Conditional break from loop
bge x4, x8, loop_end_43 # Main loop exit condition
j loop_start_43 # Jump back to loop start
loop_end_43: # --- Resuming code after Loop 43 ---

srl x7, x1, x9

# --- Starting Loop 44 (Depth: 3, break at 5, max 8) ---
addi x6, x0, 8
addi x9, x0, 5
addi x8, x0, 0
loop_start_44: # Loop body start

# --- Closing Loop 44 (Depth: 3) ---
addi x8, x8, 1
beq x8, x9, loop_end_44  # Conditional break from loop
bge x8, x6, loop_end_44 # Main loop exit condition
j loop_start_44 # Jump back to loop start
loop_end_44: # --- Resuming code after Loop 44 ---

srl x7, x8, x6
sw x4, 804(x3)

# --- Closing Loop 38 (Depth: 2) ---
addi x9, x9, 1
beq x9, x1, loop_end_38  # Conditional break from loop
bge x9, x2, loop_end_38 # Main loop exit condition
j loop_start_38 # Jump back to loop start
loop_end_38: # --- Resuming code after Loop 38 ---

xor x4, x9, x7

# --- Closing Loop 6 (Depth: 1) ---
addi x6, x6, 1
beq x6, x1, loop_end_6  # Conditional break from loop
bge x6, x8, loop_end_6 # Main loop exit condition
j loop_start_6 # Jump back to loop start
loop_end_6: # --- Resuming code after Loop 6 ---

sub x6, x4, x2
and x9, x2, x4

# --- Starting Loop 45 (Depth: 1, break at 5, max 10) ---
addi x7, x0, 10
addi x5, x0, 5
addi x6, x0, 0
loop_start_45: # Loop body start
sw x2, 780(x3)

# --- Starting Loop 46 (Depth: 2, break at 4, max 10) ---
addi x2, x0, 10
addi x5, x0, 4
addi x1, x0, 0
loop_start_46: # Loop body start

# --- Closing Loop 46 (Depth: 2) ---
addi x1, x1, 1
beq x1, x5, loop_end_46  # Conditional break from loop
bge x1, x2, loop_end_46 # Main loop exit condition
j loop_start_46 # Jump back to loop start
loop_end_46: # --- Resuming code after Loop 46 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 47 (Depth: 2, break at 2, max 6) ---
addi x4, x0, 6
addi x5, x0, 2
addi x2, x0, 0
loop_start_47: # Loop body start
sw x2, 716(x3)

# --- Starting Loop 48 (Depth: 3, break at 3, max 7) ---
addi x2, x0, 7
addi x6, x0, 3
addi x1, x0, 0
loop_start_48: # Loop body start
sw x9, 252(x3)

# --- Starting Loop 49 (Depth: 4, break at 5, max 8) ---
addi x1, x0, 8
addi x5, x0, 5
addi x2, x0, 0
loop_start_49: # Loop body start
xor x1, x2, x6
sw x1, 936(x3)
add x4, x5, x9
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 50 (Depth: 5, break at 5, max 6) ---
addi x7, x0, 6
addi x6, x0, 5
addi x9, x0, 0
loop_start_50: # Loop body start

# --- Closing Loop 50 (Depth: 5) ---
addi x9, x9, 1
beq x9, x6, loop_end_50  # Conditional break from loop
bge x9, x7, loop_end_50 # Main loop exit condition
j loop_start_50 # Jump back to loop start
loop_end_50: # --- Resuming code after Loop 50 ---

lw x7, 688(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x2, 76(x3)
lw x8, 76(x3)

# --- Closing Loop 49 (Depth: 4) ---
addi x2, x2, 1
beq x2, x5, loop_end_49  # Conditional break from loop
bge x2, x1, loop_end_49 # Main loop exit condition
j loop_start_49 # Jump back to loop start
loop_end_49: # --- Resuming code after Loop 49 ---

lw x9, 152(x3)
xor x1, x2, x8

# --- Closing Loop 48 (Depth: 3) ---
addi x1, x1, 1
beq x1, x6, loop_end_48  # Conditional break from loop
bge x1, x2, loop_end_48 # Main loop exit condition
j loop_start_48 # Jump back to loop start
loop_end_48: # --- Resuming code after Loop 48 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 51 (Depth: 3, break at 2, max 5) ---
addi x5, x0, 5
addi x6, x0, 2
addi x2, x0, 0
loop_start_51: # Loop body start

# --- Closing Loop 51 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_end_51  # Conditional break from loop
bge x2, x5, loop_end_51 # Main loop exit condition
j loop_start_51 # Jump back to loop start
loop_end_51: # --- Resuming code after Loop 51 ---

and x5, x6, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 976(x3)
xor x6, x4, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 920(x3)

# --- Closing Loop 47 (Depth: 2) ---
addi x2, x2, 1
beq x2, x5, loop_end_47  # Conditional break from loop
bge x2, x4, loop_end_47 # Main loop exit condition
j loop_start_47 # Jump back to loop start
loop_end_47: # --- Resuming code after Loop 47 ---

lw x4, 492(x3)
lw x7, 216(x3)

# --- Starting Loop 52 (Depth: 2, break at 4, max 8) ---
addi x8, x0, 8
addi x2, x0, 4
addi x1, x0, 0
loop_start_52: # Loop body start
sw x7, 492(x3)
lw x8, 184(x3)
sw x8, 864(x3)

# --- Closing Loop 52 (Depth: 2) ---
addi x1, x1, 1
beq x1, x2, loop_end_52  # Conditional break from loop
bge x1, x8, loop_end_52 # Main loop exit condition
j loop_start_52 # Jump back to loop start
loop_end_52: # --- Resuming code after Loop 52 ---

and x5, x6, x7
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x1, 376(x3)

# --- Starting Loop 53 (Depth: 2, break at 2, max 5) ---
addi x6, x0, 5
addi x8, x0, 2
addi x2, x0, 0
loop_start_53: # Loop body start
or x5, x9, x2

# --- Starting Loop 54 (Depth: 3, break at 2, max 7) ---
addi x9, x0, 7
addi x6, x0, 2
addi x4, x0, 0
loop_start_54: # Loop body start
xor x6, x1, x9
lw x8, 440(x3)
lw x2, 724(x3)

# --- Starting Loop 55 (Depth: 4, break at 5, max 7) ---
addi x8, x0, 7
addi x1, x0, 5
addi x4, x0, 0
loop_start_55: # Loop body start
sw x4, 20(x3)

# --- Starting Loop 56 (Depth: 5, break at 4, max 9) ---
addi x1, x0, 9
addi x8, x0, 4
addi x5, x0, 0
loop_start_56: # Loop body start
srl x6, x4, x1
lw x8, 960(x3)
add x9, x8, x7
sub x6, x9, x8
sw x6, 268(x3)
sw x1, 184(x3)
srl x6, x9, x1
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x4, 596(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x8, 756(x3)
sw x8, 540(x3)
sll x8, x7, x6
sw x8, 272(x3)
or x2, x9, x5
srl x6, x2, x9

# --- Closing Loop 56 (Depth: 5) ---
addi x5, x5, 1
beq x5, x8, loop_end_56  # Conditional break from loop
bge x5, x1, loop_end_56 # Main loop exit condition
j loop_start_56 # Jump back to loop start
loop_end_56: # --- Resuming code after Loop 56 ---

lw x8, 68(x3)
lw x9, 936(x3)

# --- Closing Loop 55 (Depth: 4) ---
addi x4, x4, 1
beq x4, x1, loop_end_55  # Conditional break from loop
bge x4, x8, loop_end_55 # Main loop exit condition
j loop_start_55 # Jump back to loop start
loop_end_55: # --- Resuming code after Loop 55 ---


# --- Starting Loop 57 (Depth: 4, break at 1, max 3) ---
addi x2, x0, 3
addi x8, x0, 1
addi x6, x0, 0
loop_start_57: # Loop body start
sw x6, 788(x3)
lw x1, 620(x3)
lw x4, 140(x3)
lw x8, 564(x3)
srl x8, x5, x1
lw x1, 20(x3)
sw x1, 232(x3)

# --- Starting Loop 58 (Depth: 5, break at 5, max 6) ---
addi x7, x0, 6
addi x4, x0, 5
addi x9, x0, 0
loop_start_58: # Loop body start

# --- Starting Loop 59 (Depth: 6, break at 1, max 2) ---
addi x5, x0, 2
addi x1, x0, 1
addi x7, x0, 0
loop_start_59: # Loop body start

# --- Closing Loop 59 (Depth: 6) ---
addi x7, x7, 1
beq x7, x1, loop_end_59  # Conditional break from loop
bge x7, x5, loop_end_59 # Main loop exit condition
j loop_start_59 # Jump back to loop start
loop_end_59: # --- Resuming code after Loop 59 ---

lw x2, 240(x3)

# --- Closing Loop 58 (Depth: 5) ---
addi x9, x9, 1
beq x9, x4, loop_end_58  # Conditional break from loop
bge x9, x7, loop_end_58 # Main loop exit condition
j loop_start_58 # Jump back to loop start
loop_end_58: # --- Resuming code after Loop 58 ---

sw x4, 276(x3)
lw x4, 472(x3)
or x5, x8, x1
and x9, x5, x4
lw x2, 452(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x2, 536(x3)
lw x6, 756(x3)
add x7, x1, x2
lw x1, 848(x3)

# --- Closing Loop 57 (Depth: 4) ---
addi x6, x6, 1
beq x6, x8, loop_end_57  # Conditional break from loop
bge x6, x2, loop_end_57 # Main loop exit condition
j loop_start_57 # Jump back to loop start
loop_end_57: # --- Resuming code after Loop 57 ---

sw x8, 552(x3)
srl x6, x1, x8

# --- Closing Loop 54 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_end_54  # Conditional break from loop
bge x4, x9, loop_end_54 # Main loop exit condition
j loop_start_54 # Jump back to loop start
loop_end_54: # --- Resuming code after Loop 54 ---

sw x6, 952(x3)

# --- Closing Loop 53 (Depth: 2) ---
addi x2, x2, 1
beq x2, x8, loop_end_53  # Conditional break from loop
bge x2, x6, loop_end_53 # Main loop exit condition
j loop_start_53 # Jump back to loop start
loop_end_53: # --- Resuming code after Loop 53 ---

srl x2, x5, x8

# --- Starting Loop 60 (Depth: 2, break at 5, max 10) ---
addi x5, x0, 10
addi x1, x0, 5
addi x9, x0, 0
loop_start_60: # Loop body start
sll x9, x9, x4
xor x2, x9, x6
srl x9, x2, x2
sw x5, 800(x3)

# --- Starting Loop 61 (Depth: 3, break at 5, max 6) ---
addi x2, x0, 6
addi x8, x0, 5
addi x7, x0, 0
loop_start_61: # Loop body start
sw x7, 664(x3)
or x1, x8, x2
srl x6, x1, x7
sub x5, x1, x7
lw x4, 400(x3)

# --- Closing Loop 61 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_end_61  # Conditional break from loop
bge x7, x2, loop_end_61 # Main loop exit condition
j loop_start_61 # Jump back to loop start
loop_end_61: # --- Resuming code after Loop 61 ---

lw x5, 880(x3)
sw x5, 48(x3)

# --- Starting Loop 62 (Depth: 3, break at 1, max 5) ---
addi x5, x0, 5
addi x2, x0, 1
addi x9, x0, 0
loop_start_62: # Loop body start
sw x5, 280(x3)

# --- Starting Loop 63 (Depth: 4, break at 5, max 10) ---
addi x1, x0, 10
addi x2, x0, 5
addi x9, x0, 0
loop_start_63: # Loop body start
and x4, x9, x8

# --- Starting Loop 64 (Depth: 5, break at 3, max 7) ---
addi x2, x0, 7
addi x6, x0, 3
addi x5, x0, 0
loop_start_64: # Loop body start
lw x2, 620(x3)
xor x7, x2, x8
lw x6, 912(x3)
and x7, x6, x9

# --- Starting Loop 65 (Depth: 6, break at 1, max 2) ---
addi x4, x0, 2
addi x1, x0, 1
addi x8, x0, 0
loop_start_65: # Loop body start
and x7, x5, x6
sw x7, 848(x3)
lw x7, 272(x3)
sw x7, 28(x3)
sw x6, 632(x3)

# --- Closing Loop 65 (Depth: 6) ---
addi x8, x8, 1
beq x8, x1, loop_end_65  # Conditional break from loop
bge x8, x4, loop_end_65 # Main loop exit condition
j loop_start_65 # Jump back to loop start
loop_end_65: # --- Resuming code after Loop 65 ---

sll x6, x1, x4
sll x4, x6, x5
sw x9, 832(x3)
lw x5, 88(x3)
lw x2, 556(x3)
sw x2, 724(x3)
sw x2, 632(x3)
lw x9, 812(x3)
lw x8, 68(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x8, 172(x3)
sw x1, 908(x3)
lw x4, 468(x3)
lw x8, 688(x3)

# --- Closing Loop 64 (Depth: 5) ---
addi x5, x5, 1
beq x5, x6, loop_end_64  # Conditional break from loop
bge x5, x2, loop_end_64 # Main loop exit condition
j loop_start_64 # Jump back to loop start
loop_end_64: # --- Resuming code after Loop 64 ---

sub x9, x5, x7
or x6, x9, x1
and x1, x7, x8
lw x8, 160(x3)
lw x9, 216(x3)
sw x5, 956(x3)
lw x2, 44(x3)
lw x5, 596(x3)

# --- Starting Loop 66 (Depth: 5, break at 3, max 5) ---
addi x6, x0, 5
addi x1, x0, 3
addi x4, x0, 0
loop_start_66: # Loop body start
srl x8, x4, x7
sw x8, 676(x3)
sw x5, 904(x3)
sw x9, 984(x3)
sub x9, x7, x5
sw x9, 996(x3)

# --- Closing Loop 66 (Depth: 5) ---
addi x4, x4, 1
beq x4, x1, loop_end_66  # Conditional break from loop
bge x4, x6, loop_end_66 # Main loop exit condition
j loop_start_66 # Jump back to loop start
loop_end_66: # --- Resuming code after Loop 66 ---

sw x7, 408(x3)

# --- Starting Loop 67 (Depth: 5, break at 4, max 5) ---
addi x2, x0, 5
addi x7, x0, 4
addi x8, x0, 0
loop_start_67: # Loop body start
add x8, x5, x9
lw x1, 396(x3)
add x7, x4, x6
sll x1, x4, x5
sw x1, 316(x3)
xor x2, x8, x6
sw x1, 60(x3)
sub x2, x5, x4

# --- Closing Loop 67 (Depth: 5) ---
addi x8, x8, 1
beq x8, x7, loop_end_67  # Conditional break from loop
bge x8, x2, loop_end_67 # Main loop exit condition
j loop_start_67 # Jump back to loop start
loop_end_67: # --- Resuming code after Loop 67 ---

or x9, x8, x4
lw x7, 660(x3)

# --- Starting Loop 68 (Depth: 5, break at 2, max 7) ---
addi x4, x0, 7
addi x5, x0, 2
addi x6, x0, 0
loop_start_68: # Loop body start
sw x1, 264(x3)

# --- Starting Loop 69 (Depth: 6, break at 5, max 8) ---
addi x1, x0, 8
addi x7, x0, 5
addi x6, x0, 0
loop_start_69: # Loop body start

# --- Closing Loop 69 (Depth: 6) ---
addi x6, x6, 1
beq x6, x7, loop_end_69  # Conditional break from loop
bge x6, x1, loop_end_69 # Main loop exit condition
j loop_start_69 # Jump back to loop start
loop_end_69: # --- Resuming code after Loop 69 ---

sw x6, 360(x3)
sw x4, 0(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x5, x1, x2
sll x2, x5, x9
lw x8, 680(x3)

# --- Closing Loop 68 (Depth: 5) ---
addi x6, x6, 1
beq x6, x5, loop_end_68  # Conditional break from loop
bge x6, x4, loop_end_68 # Main loop exit condition
j loop_start_68 # Jump back to loop start
loop_end_68: # --- Resuming code after Loop 68 ---


# --- Starting Loop 70 (Depth: 5, break at 1, max 7) ---
addi x9, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_70: # Loop body start
sw x6, 144(x3)

# --- Starting Loop 71 (Depth: 6, break at 2, max 4) ---
addi x7, x0, 4
addi x5, x0, 2
addi x8, x0, 0
loop_start_71: # Loop body start

# --- Closing Loop 71 (Depth: 6) ---
addi x8, x8, 1
beq x8, x5, loop_end_71  # Conditional break from loop
bge x8, x7, loop_end_71 # Main loop exit condition
j loop_start_71 # Jump back to loop start
loop_end_71: # --- Resuming code after Loop 71 ---

add x6, x8, x7
lw x1, 116(x3)
sw x6, 964(x3)
sw x9, 216(x3)
and x4, x9, x2
srl x4, x4, x2
or x7, x5, x4
lw x2, 692(x3)
sw x2, 704(x3)
sw x7, 448(x3)
lw x8, 504(x3)

# --- Closing Loop 70 (Depth: 5) ---
addi x6, x6, 1
beq x6, x4, loop_end_70  # Conditional break from loop
bge x6, x9, loop_end_70 # Main loop exit condition
j loop_start_70 # Jump back to loop start
loop_end_70: # --- Resuming code after Loop 70 ---


# --- Starting Loop 72 (Depth: 5, break at 5, max 8) ---
addi x2, x0, 8
addi x4, x0, 5
addi x9, x0, 0
loop_start_72: # Loop body start
sw x9, 836(x3)
lw x2, 872(x3)

# --- Starting Loop 73 (Depth: 6, break at 2, max 8) ---
addi x4, x0, 8
addi x7, x0, 2
addi x8, x0, 0
loop_start_73: # Loop body start
sw x2, 160(x3)
sw x1, 236(x3)
sw x8, 984(x3)
add x2, x1, x5
lw x8, 536(x3)
sw x2, 904(x3)
lw x9, 532(x3)
sw x9, 48(x3)
lw x6, 552(x3)
lw x2, 516(x3)
sw x2, 36(x3)

# --- Closing Loop 73 (Depth: 6) ---
addi x8, x8, 1
beq x8, x7, loop_end_73  # Conditional break from loop
bge x8, x4, loop_end_73 # Main loop exit condition
j loop_start_73 # Jump back to loop start
loop_end_73: # --- Resuming code after Loop 73 ---


# --- Starting Loop 74 (Depth: 6, break at 3, max 5) ---
addi x8, x0, 5
addi x9, x0, 3
addi x4, x0, 0
loop_start_74: # Loop body start
lw x8, 792(x3)
sw x2, 312(x3)
lw x1, 488(x3)

# --- Closing Loop 74 (Depth: 6) ---
addi x4, x4, 1
beq x4, x9, loop_end_74  # Conditional break from loop
bge x4, x8, loop_end_74 # Main loop exit condition
j loop_start_74 # Jump back to loop start
loop_end_74: # --- Resuming code after Loop 74 ---

add x6, x1, x4
add x5, x7, x4
xor x4, x5, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x5, 296(x3)
sw x5, 564(x3)
sw x8, 828(x3)
sw x4, 256(x3)
sw x8, 480(x3)
lw x2, 388(x3)

# --- Closing Loop 72 (Depth: 5) ---
addi x9, x9, 1
beq x9, x4, loop_end_72  # Conditional break from loop
bge x9, x2, loop_end_72 # Main loop exit condition
j loop_start_72 # Jump back to loop start
loop_end_72: # --- Resuming code after Loop 72 ---

sw x4, 796(x3)
sub x5, x2, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 952(x3)
xor x6, x9, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 63 (Depth: 4) ---
addi x9, x9, 1
beq x9, x2, loop_end_63  # Conditional break from loop
bge x9, x1, loop_end_63 # Main loop exit condition
j loop_start_63 # Jump back to loop start
loop_end_63: # --- Resuming code after Loop 63 ---


# --- Closing Loop 62 (Depth: 3) ---
addi x9, x9, 1
beq x9, x2, loop_end_62  # Conditional break from loop
bge x9, x5, loop_end_62 # Main loop exit condition
j loop_start_62 # Jump back to loop start
loop_end_62: # --- Resuming code after Loop 62 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 75 (Depth: 3, break at 4, max 6) ---
addi x1, x0, 6
addi x8, x0, 4
addi x5, x0, 0
loop_start_75: # Loop body start
or x9, x5, x5
lw x2, 604(x3)
sw x6, 896(x3)
sub x1, x5, x9

# --- Starting Loop 76 (Depth: 4, break at 4, max 6) ---
addi x6, x0, 6
addi x5, x0, 4
addi x9, x0, 0
loop_start_76: # Loop body start
lw x6, 464(x3)
sub x2, x1, x9
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 77 (Depth: 5, break at 1, max 7) ---
addi x5, x0, 7
addi x9, x0, 1
addi x8, x0, 0
loop_start_77: # Loop body start
lw x2, 960(x3)
sw x4, 392(x3)
lw x4, 772(x3)

# --- Closing Loop 77 (Depth: 5) ---
addi x8, x8, 1
beq x8, x9, loop_end_77  # Conditional break from loop
bge x8, x5, loop_end_77 # Main loop exit condition
j loop_start_77 # Jump back to loop start
loop_end_77: # --- Resuming code after Loop 77 ---

or x7, x1, x8
sll x4, x7, x1
sw x8, 996(x3)
or x9, x4, x7

# --- Closing Loop 76 (Depth: 4) ---
addi x9, x9, 1
beq x9, x5, loop_end_76  # Conditional break from loop
bge x9, x6, loop_end_76 # Main loop exit condition
j loop_start_76 # Jump back to loop start
loop_end_76: # --- Resuming code after Loop 76 ---

lw x7, 724(x3)
sw x7, 116(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x6, x1, x2
add x7, x4, x6
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 75 (Depth: 3) ---
addi x5, x5, 1
beq x5, x8, loop_end_75  # Conditional break from loop
bge x5, x1, loop_end_75 # Main loop exit condition
j loop_start_75 # Jump back to loop start
loop_end_75: # --- Resuming code after Loop 75 ---


# --- Starting Loop 78 (Depth: 3, break at 3, max 4) ---
addi x2, x0, 4
addi x4, x0, 3
addi x9, x0, 0
loop_start_78: # Loop body start

# --- Starting Loop 79 (Depth: 4, break at 2, max 5) ---
addi x1, x0, 5
addi x4, x0, 2
addi x8, x0, 0
loop_start_79: # Loop body start
sw x8, 712(x3)
sw x7, 424(x3)
sll x2, x8, x6
sw x1, 464(x3)
lw x5, 756(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 296(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 960(x3)
lw x1, 884(x3)
sw x2, 548(x3)

# --- Closing Loop 79 (Depth: 4) ---
addi x8, x8, 1
beq x8, x4, loop_end_79  # Conditional break from loop
bge x8, x1, loop_end_79 # Main loop exit condition
j loop_start_79 # Jump back to loop start
loop_end_79: # --- Resuming code after Loop 79 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 78 (Depth: 3) ---
addi x9, x9, 1
beq x9, x4, loop_end_78  # Conditional break from loop
bge x9, x2, loop_end_78 # Main loop exit condition
j loop_start_78 # Jump back to loop start
loop_end_78: # --- Resuming code after Loop 78 ---

sw x5, 400(x3)
add x4, x7, x1
sw x4, 304(x3)
lw x8, 116(x3)
sw x8, 416(x3)
sw x2, 132(x3)
lw x5, 228(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 60 (Depth: 2) ---
addi x9, x9, 1
beq x9, x1, loop_end_60  # Conditional break from loop
bge x9, x5, loop_end_60 # Main loop exit condition
j loop_start_60 # Jump back to loop start
loop_end_60: # --- Resuming code after Loop 60 ---

add x5, x5, x2
sw x5, 984(x3)
sw x6, 40(x3)

# --- Starting Loop 80 (Depth: 2, break at 2, max 5) ---
addi x4, x0, 5
addi x7, x0, 2
addi x1, x0, 0
loop_start_80: # Loop body start
and x5, x9, x1
sll x8, x5, x6

# --- Closing Loop 80 (Depth: 2) ---
addi x1, x1, 1
beq x1, x7, loop_end_80  # Conditional break from loop
bge x1, x4, loop_end_80 # Main loop exit condition
j loop_start_80 # Jump back to loop start
loop_end_80: # --- Resuming code after Loop 80 ---

sw x8, 588(x3)
and x9, x4, x8
or x1, x9, x2

# --- Closing Loop 45 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_end_45  # Conditional break from loop
bge x6, x7, loop_end_45 # Main loop exit condition
j loop_start_45 # Jump back to loop start
loop_end_45: # --- Resuming code after Loop 45 ---

or x5, x1, x9
sw x5, 72(x3)
sw x1, 880(x3)

# --- Starting Loop 81 (Depth: 1, break at 4, max 7) ---
addi x8, x0, 7
addi x2, x0, 4
addi x1, x0, 0
loop_start_81: # Loop body start
sll x8, x6, x7

# --- Starting Loop 82 (Depth: 2, break at 2, max 9) ---
addi x9, x0, 9
addi x4, x0, 2
addi x2, x0, 0
loop_start_82: # Loop body start
lw x2, 912(x3)
and x4, x2, x6
xor x1, x4, x2
sub x9, x1, x7

# --- Starting Loop 83 (Depth: 3, break at 2, max 4) ---
addi x8, x0, 4
addi x6, x0, 2
addi x4, x0, 0
loop_start_83: # Loop body start

# --- Closing Loop 83 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_end_83  # Conditional break from loop
bge x4, x8, loop_end_83 # Main loop exit condition
j loop_start_83 # Jump back to loop start
loop_end_83: # --- Resuming code after Loop 83 ---

lw x1, 720(x3)

# --- Closing Loop 82 (Depth: 2) ---
addi x2, x2, 1
beq x2, x4, loop_end_82  # Conditional break from loop
bge x2, x9, loop_end_82 # Main loop exit condition
j loop_start_82 # Jump back to loop start
loop_end_82: # --- Resuming code after Loop 82 ---


# --- Starting Loop 84 (Depth: 2, break at 2, max 3) ---
addi x2, x0, 3
addi x7, x0, 2
addi x9, x0, 0
loop_start_84: # Loop body start

# --- Starting Loop 85 (Depth: 3, break at 2, max 6) ---
addi x1, x0, 6
addi x8, x0, 2
addi x6, x0, 0
loop_start_85: # Loop body start

# --- Starting Loop 86 (Depth: 4, break at 1, max 8) ---
addi x5, x0, 8
addi x1, x0, 1
addi x2, x0, 0
loop_start_86: # Loop body start
lw x5, 696(x3)
sub x8, x5, x2
sw x8, 536(x3)
lw x9, 172(x3)
lw x4, 804(x3)

# --- Starting Loop 87 (Depth: 5, break at 2, max 7) ---
addi x7, x0, 7
addi x8, x0, 2
addi x5, x0, 0
loop_start_87: # Loop body start
lw x4, 796(x3)
sw x8, 772(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
and x2, x6, x5
xor x7, x2, x4
lw x5, 336(x3)

# --- Closing Loop 87 (Depth: 5) ---
addi x5, x5, 1
beq x5, x8, loop_end_87  # Conditional break from loop
bge x5, x7, loop_end_87 # Main loop exit condition
j loop_start_87 # Jump back to loop start
loop_end_87: # --- Resuming code after Loop 87 ---

sll x5, x5, x9
and x9, x7, x8
lw x6, 832(x3)
sw x6, 340(x3)

# --- Closing Loop 86 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_end_86  # Conditional break from loop
bge x2, x5, loop_end_86 # Main loop exit condition
j loop_start_86 # Jump back to loop start
loop_end_86: # --- Resuming code after Loop 86 ---


# --- Starting Loop 88 (Depth: 4, break at 1, max 6) ---
addi x1, x0, 6
addi x4, x0, 1
addi x2, x0, 0
loop_start_88: # Loop body start
sw x2, 464(x3)
sw x8, 916(x3)
sw x6, 156(x3)
sw x1, 716(x3)

# --- Closing Loop 88 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_end_88  # Conditional break from loop
bge x2, x1, loop_end_88 # Main loop exit condition
j loop_start_88 # Jump back to loop start
loop_end_88: # --- Resuming code after Loop 88 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 84(x3)

# --- Starting Loop 89 (Depth: 4, break at 2, max 9) ---
addi x7, x0, 9
addi x6, x0, 2
addi x4, x0, 0
loop_start_89: # Loop body start
sub x4, x7, x5

# --- Starting Loop 90 (Depth: 5, break at 5, max 8) ---
addi x1, x0, 8
addi x5, x0, 5
addi x2, x0, 0
loop_start_90: # Loop body start
and x8, x5, x1
or x5, x6, x1

# --- Closing Loop 90 (Depth: 5) ---
addi x2, x2, 1
beq x2, x5, loop_end_90  # Conditional break from loop
bge x2, x1, loop_end_90 # Main loop exit condition
j loop_start_90 # Jump back to loop start
loop_end_90: # --- Resuming code after Loop 90 ---


# --- Starting Loop 91 (Depth: 5, break at 4, max 6) ---
addi x7, x0, 6
addi x2, x0, 4
addi x1, x0, 0
loop_start_91: # Loop body start

# --- Closing Loop 91 (Depth: 5) ---
addi x1, x1, 1
beq x1, x2, loop_end_91  # Conditional break from loop
bge x1, x7, loop_end_91 # Main loop exit condition
j loop_start_91 # Jump back to loop start
loop_end_91: # --- Resuming code after Loop 91 ---

lw x7, 844(x3)
lw x2, 680(x3)
sw x2, 768(x3)
sw x9, 480(x3)

# --- Closing Loop 89 (Depth: 4) ---
addi x4, x4, 1
beq x4, x6, loop_end_89  # Conditional break from loop
bge x4, x7, loop_end_89 # Main loop exit condition
j loop_start_89 # Jump back to loop start
loop_end_89: # --- Resuming code after Loop 89 ---

lw x9, 292(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 92 (Depth: 4, break at 3, max 10) ---
addi x1, x0, 10
addi x4, x0, 3
addi x8, x0, 0
loop_start_92: # Loop body start
sw x4, 192(x3)
sub x6, x8, x1
sw x4, 788(x3)
sw x1, 996(x3)
lw x5, 868(x3)

# --- Closing Loop 92 (Depth: 4) ---
addi x8, x8, 1
beq x8, x4, loop_end_92  # Conditional break from loop
bge x8, x1, loop_end_92 # Main loop exit condition
j loop_start_92 # Jump back to loop start
loop_end_92: # --- Resuming code after Loop 92 ---

sw x5, 540(x3)

# --- Starting Loop 93 (Depth: 4, break at 1, max 8) ---
addi x9, x0, 8
addi x7, x0, 1
addi x4, x0, 0
loop_start_93: # Loop body start
and x4, x7, x1

# --- Closing Loop 93 (Depth: 4) ---
addi x4, x4, 1
beq x4, x7, loop_end_93  # Conditional break from loop
bge x4, x9, loop_end_93 # Main loop exit condition
j loop_start_93 # Jump back to loop start
loop_end_93: # --- Resuming code after Loop 93 ---


# --- Closing Loop 85 (Depth: 3) ---
addi x6, x6, 1
beq x6, x8, loop_end_85  # Conditional break from loop
bge x6, x1, loop_end_85 # Main loop exit condition
j loop_start_85 # Jump back to loop start
loop_end_85: # --- Resuming code after Loop 85 ---

xor x8, x2, x1
lw x5, 412(x3)

# --- Starting Loop 94 (Depth: 3, break at 1, max 6) ---
addi x4, x0, 6
addi x8, x0, 1
addi x1, x0, 0
loop_start_94: # Loop body start
sw x1, 316(x3)
sw x6, 64(x3)
sw x6, 892(x3)
lw x7, 228(x3)

# --- Closing Loop 94 (Depth: 3) ---
addi x1, x1, 1
beq x1, x8, loop_end_94  # Conditional break from loop
bge x1, x4, loop_end_94 # Main loop exit condition
j loop_start_94 # Jump back to loop start
loop_end_94: # --- Resuming code after Loop 94 ---


# --- Starting Loop 95 (Depth: 3, break at 3, max 9) ---
addi x1, x0, 9
addi x6, x0, 3
addi x5, x0, 0
loop_start_95: # Loop body start

# --- Closing Loop 95 (Depth: 3) ---
addi x5, x5, 1
beq x5, x6, loop_end_95  # Conditional break from loop
bge x5, x1, loop_end_95 # Main loop exit condition
j loop_start_95 # Jump back to loop start
loop_end_95: # --- Resuming code after Loop 95 ---

sw x5, 996(x3)
lw x4, 888(x3)
lw x4, 232(x3)
lw x6, 888(x3)
lw x2, 876(x3)

# --- Starting Loop 96 (Depth: 3, break at 5, max 10) ---
addi x9, x0, 10
addi x5, x0, 5
addi x1, x0, 0
loop_start_96: # Loop body start
sub x4, x1, x8
lw x5, 652(x3)

# --- Closing Loop 96 (Depth: 3) ---
addi x1, x1, 1
beq x1, x5, loop_end_96  # Conditional break from loop
bge x1, x9, loop_end_96 # Main loop exit condition
j loop_start_96 # Jump back to loop start
loop_end_96: # --- Resuming code after Loop 96 ---

sw x1, 56(x3)
sw x5, 656(x3)

# --- Closing Loop 84 (Depth: 2) ---
addi x9, x9, 1
beq x9, x7, loop_end_84  # Conditional break from loop
bge x9, x2, loop_end_84 # Main loop exit condition
j loop_start_84 # Jump back to loop start
loop_end_84: # --- Resuming code after Loop 84 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x7, 916(x3)
sll x1, x7, x4
sw x1, 188(x3)

# --- Starting Loop 97 (Depth: 2, break at 5, max 8) ---
addi x1, x0, 8
addi x9, x0, 5
addi x2, x0, 0
loop_start_97: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 828(x3)

# --- Starting Loop 98 (Depth: 3, break at 5, max 6) ---
addi x6, x0, 6
addi x4, x0, 5
addi x9, x0, 0
loop_start_98: # Loop body start

# --- Starting Loop 99 (Depth: 4, break at 5, max 10) ---
addi x2, x0, 10
addi x4, x0, 5
addi x6, x0, 0
loop_start_99: # Loop body start

# --- Closing Loop 99 (Depth: 4) ---
addi x6, x6, 1
beq x6, x4, loop_end_99  # Conditional break from loop
bge x6, x2, loop_end_99 # Main loop exit condition
j loop_start_99 # Jump back to loop start
loop_end_99: # --- Resuming code after Loop 99 ---


# --- Starting Loop 100 (Depth: 4, break at 1, max 10) ---
addi x1, x0, 10
addi x7, x0, 1
addi x2, x0, 0
loop_start_100: # Loop body start

# --- Closing Loop 100 (Depth: 4) ---
addi x2, x2, 1
beq x2, x7, loop_end_100  # Conditional break from loop
bge x2, x1, loop_end_100 # Main loop exit condition
j loop_start_100 # Jump back to loop start
loop_end_100: # --- Resuming code after Loop 100 ---


# --- Starting Loop 101 (Depth: 4, break at 3, max 7) ---
addi x6, x0, 7
addi x7, x0, 3
addi x8, x0, 0
loop_start_101: # Loop body start
srl x1, x9, x8
srl x6, x1, x1
lw x5, 248(x3)

# --- Closing Loop 101 (Depth: 4) ---
addi x8, x8, 1
beq x8, x7, loop_end_101  # Conditional break from loop
bge x8, x6, loop_end_101 # Main loop exit condition
j loop_start_101 # Jump back to loop start
loop_end_101: # --- Resuming code after Loop 101 ---


# --- Closing Loop 98 (Depth: 3) ---
addi x9, x9, 1
beq x9, x4, loop_end_98  # Conditional break from loop
bge x9, x6, loop_end_98 # Main loop exit condition
j loop_start_98 # Jump back to loop start
loop_end_98: # --- Resuming code after Loop 98 ---

sub x7, x5, x9
xor x9, x7, x6
xor x7, x9, x2
sw x7, 728(x3)
sw x9, 632(x3)
sw x5, 756(x3)

# --- Closing Loop 97 (Depth: 2) ---
addi x2, x2, 1
beq x2, x9, loop_end_97  # Conditional break from loop
bge x2, x1, loop_end_97 # Main loop exit condition
j loop_start_97 # Jump back to loop start
loop_end_97: # --- Resuming code after Loop 97 ---

lw x2, 552(x3)
sw x8, 784(x3)
lw x1, 120(x3)
sw x1, 548(x3)
sw x1, 460(x3)

# --- Closing Loop 81 (Depth: 1) ---
addi x1, x1, 1
beq x1, x2, loop_end_81  # Conditional break from loop
bge x1, x8, loop_end_81 # Main loop exit condition
j loop_start_81 # Jump back to loop start
loop_end_81: # --- Resuming code after Loop 81 ---

and x8, x9, x7

# --- Starting Loop 102 (Depth: 1, break at 3, max 10) ---
addi x5, x0, 10
addi x7, x0, 3
addi x2, x0, 0
loop_start_102: # Loop body start
lw x7, 244(x3)
xor x5, x4, x8

# --- Starting Loop 103 (Depth: 2, break at 4, max 7) ---
addi x9, x0, 7
addi x7, x0, 4
addi x6, x0, 0
loop_start_103: # Loop body start
srl x1, x6, x9
lw x7, 784(x3)
lw x8, 792(x3)

# --- Starting Loop 104 (Depth: 3, break at 1, max 8) ---
addi x9, x0, 8
addi x1, x0, 1
addi x2, x0, 0
loop_start_104: # Loop body start
sw x2, 664(x3)
sub x7, x1, x8
sll x5, x7, x8

# --- Closing Loop 104 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_end_104  # Conditional break from loop
bge x2, x9, loop_end_104 # Main loop exit condition
j loop_start_104 # Jump back to loop start
loop_end_104: # --- Resuming code after Loop 104 ---

and x7, x6, x8

# --- Closing Loop 103 (Depth: 2) ---
addi x6, x6, 1
beq x6, x7, loop_end_103  # Conditional break from loop
bge x6, x9, loop_end_103 # Main loop exit condition
j loop_start_103 # Jump back to loop start
loop_end_103: # --- Resuming code after Loop 103 ---


# --- Starting Loop 105 (Depth: 2, break at 3, max 9) ---
addi x2, x0, 9
addi x8, x0, 3
addi x6, x0, 0
loop_start_105: # Loop body start
lw x8, 600(x3)

# --- Starting Loop 106 (Depth: 3, break at 5, max 6) ---
addi x7, x0, 6
addi x1, x0, 5
addi x2, x0, 0
loop_start_106: # Loop body start

# --- Closing Loop 106 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_end_106  # Conditional break from loop
bge x2, x7, loop_end_106 # Main loop exit condition
j loop_start_106 # Jump back to loop start
loop_end_106: # --- Resuming code after Loop 106 ---

and x2, x2, x4
lw x1, 764(x3)
add x1, x9, x8
sub x5, x8, x7
lw x4, 344(x3)

# --- Starting Loop 107 (Depth: 3, break at 3, max 10) ---
addi x6, x0, 10
addi x8, x0, 3
addi x1, x0, 0
loop_start_107: # Loop body start

# --- Closing Loop 107 (Depth: 3) ---
addi x1, x1, 1
beq x1, x8, loop_end_107  # Conditional break from loop
bge x1, x6, loop_end_107 # Main loop exit condition
j loop_start_107 # Jump back to loop start
loop_end_107: # --- Resuming code after Loop 107 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 105 (Depth: 2) ---
addi x6, x6, 1
beq x6, x8, loop_end_105  # Conditional break from loop
bge x6, x2, loop_end_105 # Main loop exit condition
j loop_start_105 # Jump back to loop start
loop_end_105: # --- Resuming code after Loop 105 ---

or x7, x8, x2
lw x6, 912(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x6, 592(x3)
lw x4, 652(x3)

# --- Starting Loop 108 (Depth: 2, break at 3, max 9) ---
addi x1, x0, 9
addi x9, x0, 3
addi x7, x0, 0
loop_start_108: # Loop body start
or x6, x8, x7

# --- Starting Loop 109 (Depth: 3, break at 1, max 3) ---
addi x1, x0, 3
addi x9, x0, 1
addi x5, x0, 0
loop_start_109: # Loop body start
lw x1, 500(x3)

# --- Closing Loop 109 (Depth: 3) ---
addi x5, x5, 1
beq x5, x9, loop_end_109  # Conditional break from loop
bge x5, x1, loop_end_109 # Main loop exit condition
j loop_start_109 # Jump back to loop start
loop_end_109: # --- Resuming code after Loop 109 ---

sw x1, 400(x3)

# --- Closing Loop 108 (Depth: 2) ---
addi x7, x7, 1
beq x7, x9, loop_end_108  # Conditional break from loop
bge x7, x1, loop_end_108 # Main loop exit condition
j loop_start_108 # Jump back to loop start
loop_end_108: # --- Resuming code after Loop 108 ---

sw x2, 160(x3)
sw x8, 356(x3)
lw x2, 516(x3)

# --- Starting Loop 110 (Depth: 2, break at 2, max 9) ---
addi x8, x0, 9
addi x6, x0, 2
addi x1, x0, 0
loop_start_110: # Loop body start
lw x6, 256(x3)

# --- Starting Loop 111 (Depth: 3, break at 5, max 9) ---
addi x4, x0, 9
addi x2, x0, 5
addi x5, x0, 0
loop_start_111: # Loop body start
sw x5, 972(x3)
and x8, x2, x9
lw x2, 312(x3)
sw x2, 800(x3)
add x8, x9, x6
sw x8, 408(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
add x4, x7, x1
xor x9, x8, x6

# --- Starting Loop 112 (Depth: 4, break at 4, max 8) ---
addi x1, x0, 8
addi x2, x0, 4
addi x5, x0, 0
loop_start_112: # Loop body start
sll x4, x5, x5

# --- Closing Loop 112 (Depth: 4) ---
addi x5, x5, 1
beq x5, x2, loop_end_112  # Conditional break from loop
bge x5, x1, loop_end_112 # Main loop exit condition
j loop_start_112 # Jump back to loop start
loop_end_112: # --- Resuming code after Loop 112 ---

lw x7, 172(x3)

# --- Closing Loop 111 (Depth: 3) ---
addi x5, x5, 1
beq x5, x2, loop_end_111  # Conditional break from loop
bge x5, x4, loop_end_111 # Main loop exit condition
j loop_start_111 # Jump back to loop start
loop_end_111: # --- Resuming code after Loop 111 ---


# --- Starting Loop 113 (Depth: 3, break at 4, max 9) ---
addi x2, x0, 9
addi x6, x0, 4
addi x4, x0, 0
loop_start_113: # Loop body start

# --- Starting Loop 114 (Depth: 4, break at 3, max 5) ---
addi x1, x0, 5
addi x9, x0, 3
addi x8, x0, 0
loop_start_114: # Loop body start
sw x8, 800(x3)
and x2, x8, x5

# --- Closing Loop 114 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_end_114  # Conditional break from loop
bge x8, x1, loop_end_114 # Main loop exit condition
j loop_start_114 # Jump back to loop start
loop_end_114: # --- Resuming code after Loop 114 ---

lw x7, 960(x3)
lw x8, 712(x3)
lw x6, 772(x3)
sw x6, 668(x3)

# --- Starting Loop 115 (Depth: 4, break at 3, max 7) ---
addi x2, x0, 7
addi x5, x0, 3
addi x7, x0, 0
loop_start_115: # Loop body start
sw x8, 984(x3)

# --- Closing Loop 115 (Depth: 4) ---
addi x7, x7, 1
beq x7, x5, loop_end_115  # Conditional break from loop
bge x7, x2, loop_end_115 # Main loop exit condition
j loop_start_115 # Jump back to loop start
loop_end_115: # --- Resuming code after Loop 115 ---

sub x1, x6, x5
sll x8, x7, x2
sw x8, 352(x3)
lw x4, 820(x3)
xor x8, x1, x5
lw x9, 700(x3)
sw x4, 480(x3)
sub x2, x5, x1
sw x8, 440(x3)

# --- Closing Loop 113 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_end_113  # Conditional break from loop
bge x4, x2, loop_end_113 # Main loop exit condition
j loop_start_113 # Jump back to loop start
loop_end_113: # --- Resuming code after Loop 113 ---


# --- Starting Loop 116 (Depth: 3, break at 3, max 4) ---
addi x4, x0, 4
addi x1, x0, 3
addi x7, x0, 0
loop_start_116: # Loop body start

# --- Starting Loop 117 (Depth: 4, break at 4, max 5) ---
addi x8, x0, 5
addi x4, x0, 4
addi x1, x0, 0
loop_start_117: # Loop body start

# --- Starting Loop 118 (Depth: 5, break at 5, max 6) ---
addi x8, x0, 6
addi x6, x0, 5
addi x5, x0, 0
loop_start_118: # Loop body start
lw x4, 988(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 118 (Depth: 5) ---
addi x5, x5, 1
beq x5, x6, loop_end_118  # Conditional break from loop
bge x5, x8, loop_end_118 # Main loop exit condition
j loop_start_118 # Jump back to loop start
loop_end_118: # --- Resuming code after Loop 118 ---


# --- Starting Loop 119 (Depth: 5, break at 1, max 5) ---
addi x6, x0, 5
addi x2, x0, 1
addi x5, x0, 0
loop_start_119: # Loop body start
lw x2, 776(x3)
sw x5, 204(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x5, 620(x3)
lw x1, 56(x3)
srl x8, x1, x9
lw x4, 748(x3)

# --- Closing Loop 119 (Depth: 5) ---
addi x5, x5, 1
beq x5, x2, loop_end_119  # Conditional break from loop
bge x5, x6, loop_end_119 # Main loop exit condition
j loop_start_119 # Jump back to loop start
loop_end_119: # --- Resuming code after Loop 119 ---

sw x4, 320(x3)

# --- Closing Loop 117 (Depth: 4) ---
addi x1, x1, 1
beq x1, x4, loop_end_117  # Conditional break from loop
bge x1, x8, loop_end_117 # Main loop exit condition
j loop_start_117 # Jump back to loop start
loop_end_117: # --- Resuming code after Loop 117 ---

lw x5, 188(x3)
sub x2, x7, x5

# --- Closing Loop 116 (Depth: 3) ---
addi x7, x7, 1
beq x7, x1, loop_end_116  # Conditional break from loop
bge x7, x4, loop_end_116 # Main loop exit condition
j loop_start_116 # Jump back to loop start
loop_end_116: # --- Resuming code after Loop 116 ---

lw x8, 232(x3)

# --- Starting Loop 120 (Depth: 3, break at 2, max 7) ---
addi x5, x0, 7
addi x2, x0, 2
addi x9, x0, 0
loop_start_120: # Loop body start
srl x6, x9, x1
sw x6, 856(x3)

# --- Starting Loop 121 (Depth: 4, break at 2, max 7) ---
addi x8, x0, 7
addi x5, x0, 2
addi x7, x0, 0
loop_start_121: # Loop body start

# --- Starting Loop 122 (Depth: 5, break at 1, max 9) ---
addi x2, x0, 9
addi x9, x0, 1
addi x8, x0, 0
loop_start_122: # Loop body start

# --- Closing Loop 122 (Depth: 5) ---
addi x8, x8, 1
beq x8, x9, loop_end_122  # Conditional break from loop
bge x8, x2, loop_end_122 # Main loop exit condition
j loop_start_122 # Jump back to loop start
loop_end_122: # --- Resuming code after Loop 122 ---

or x5, x4, x9
srl x9, x5, x7
srl x2, x9, x5
sw x2, 988(x3)

# --- Starting Loop 123 (Depth: 5, break at 2, max 8) ---
addi x9, x0, 8
addi x4, x0, 2
addi x8, x0, 0
loop_start_123: # Loop body start
sll x8, x9, x2
sw x8, 24(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sll x1, x9, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x7, 184(x3)

# --- Closing Loop 123 (Depth: 5) ---
addi x8, x8, 1
beq x8, x4, loop_end_123  # Conditional break from loop
bge x8, x9, loop_end_123 # Main loop exit condition
j loop_start_123 # Jump back to loop start
loop_end_123: # --- Resuming code after Loop 123 ---


# --- Starting Loop 124 (Depth: 5, break at 4, max 8) ---
addi x5, x0, 8
addi x4, x0, 4
addi x8, x0, 0
loop_start_124: # Loop body start
xor x5, x8, x9
lw x2, 180(x3)
sw x5, 496(x3)
lw x7, 744(x3)
lw x9, 100(x3)
lw x8, 488(x3)
or x5, x8, x9
sw x5, 816(x3)
sw x4, 584(x3)

# --- Closing Loop 124 (Depth: 5) ---
addi x8, x8, 1
beq x8, x4, loop_end_124  # Conditional break from loop
bge x8, x5, loop_end_124 # Main loop exit condition
j loop_start_124 # Jump back to loop start
loop_end_124: # --- Resuming code after Loop 124 ---

sw x4, 364(x3)
and x2, x7, x5
add x1, x5, x4

# --- Closing Loop 121 (Depth: 4) ---
addi x7, x7, 1
beq x7, x5, loop_end_121  # Conditional break from loop
bge x7, x8, loop_end_121 # Main loop exit condition
j loop_start_121 # Jump back to loop start
loop_end_121: # --- Resuming code after Loop 121 ---

lw x8, 564(x3)

# --- Closing Loop 120 (Depth: 3) ---
addi x9, x9, 1
beq x9, x2, loop_end_120  # Conditional break from loop
bge x9, x5, loop_end_120 # Main loop exit condition
j loop_start_120 # Jump back to loop start
loop_end_120: # --- Resuming code after Loop 120 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 204(x3)

# --- Starting Loop 125 (Depth: 3, break at 3, max 7) ---
addi x2, x0, 7
addi x4, x0, 3
addi x5, x0, 0
loop_start_125: # Loop body start
or x8, x6, x4
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x4, x1, x2
lw x8, 308(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
and x4, x8, x8
add x1, x4, x4

# --- Starting Loop 126 (Depth: 4, break at 1, max 2) ---
addi x2, x0, 2
addi x9, x0, 1
addi x5, x0, 0
loop_start_126: # Loop body start
lw x7, 544(x3)
lw x9, 436(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x2, 484(x3)
xor x8, x2, x5
sw x2, 808(x3)
lw x5, 980(x3)
lw x6, 792(x3)

# --- Starting Loop 127 (Depth: 5, break at 4, max 6) ---
addi x2, x0, 6
addi x8, x0, 4
addi x4, x0, 0
loop_start_127: # Loop body start
add x4, x4, x8
lw x9, 888(x3)
lw x6, 460(x3)
lw x8, 268(x3)
xor x8, x2, x9
srl x9, x5, x8

# --- Closing Loop 127 (Depth: 5) ---
addi x4, x4, 1
beq x4, x8, loop_end_127  # Conditional break from loop
bge x4, x2, loop_end_127 # Main loop exit condition
j loop_start_127 # Jump back to loop start
loop_end_127: # --- Resuming code after Loop 127 ---

lw x4, 600(x3)

# --- Closing Loop 126 (Depth: 4) ---
addi x5, x5, 1
beq x5, x9, loop_end_126  # Conditional break from loop
bge x5, x2, loop_end_126 # Main loop exit condition
j loop_start_126 # Jump back to loop start
loop_end_126: # --- Resuming code after Loop 126 ---

sw x7, 468(x3)

# --- Closing Loop 125 (Depth: 3) ---
addi x5, x5, 1
beq x5, x4, loop_end_125  # Conditional break from loop
bge x5, x2, loop_end_125 # Main loop exit condition
j loop_start_125 # Jump back to loop start
loop_end_125: # --- Resuming code after Loop 125 ---

sw x7, 308(x3)

# --- Starting Loop 128 (Depth: 3, break at 3, max 9) ---
addi x6, x0, 9
addi x1, x0, 3
addi x4, x0, 0
loop_start_128: # Loop body start
srl x9, x4, x7
sw x5, 728(x3)

# --- Closing Loop 128 (Depth: 3) ---
addi x4, x4, 1
beq x4, x1, loop_end_128  # Conditional break from loop
bge x4, x6, loop_end_128 # Main loop exit condition
j loop_start_128 # Jump back to loop start
loop_end_128: # --- Resuming code after Loop 128 ---

sub x5, x9, x2

# --- Starting Loop 129 (Depth: 3, break at 3, max 10) ---
addi x7, x0, 10
addi x8, x0, 3
addi x1, x0, 0
loop_start_129: # Loop body start
lw x7, 572(x3)
sll x2, x1, x6
sw x6, 144(x3)
sw x2, 496(x3)
lw x5, 208(x3)
lw x7, 484(x3)
lw x7, 44(x3)
sw x7, 764(x3)
sll x5, x9, x2

# --- Closing Loop 129 (Depth: 3) ---
addi x1, x1, 1
beq x1, x8, loop_end_129  # Conditional break from loop
bge x1, x7, loop_end_129 # Main loop exit condition
j loop_start_129 # Jump back to loop start
loop_end_129: # --- Resuming code after Loop 129 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 500(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 130 (Depth: 3, break at 2, max 3) ---
addi x6, x0, 3
addi x7, x0, 2
addi x8, x0, 0
loop_start_130: # Loop body start

# --- Closing Loop 130 (Depth: 3) ---
addi x8, x8, 1
beq x8, x7, loop_end_130  # Conditional break from loop
bge x8, x6, loop_end_130 # Main loop exit condition
j loop_start_130 # Jump back to loop start
loop_end_130: # --- Resuming code after Loop 130 ---

lw x9, 956(x3)
sw x2, 412(x3)

# --- Closing Loop 110 (Depth: 2) ---
addi x1, x1, 1
beq x1, x6, loop_end_110  # Conditional break from loop
bge x1, x8, loop_end_110 # Main loop exit condition
j loop_start_110 # Jump back to loop start
loop_end_110: # --- Resuming code after Loop 110 ---

lw x5, 632(x3)
lw x7, 408(x3)
sw x7, 40(x3)

# --- Starting Loop 131 (Depth: 2, break at 5, max 9) ---
addi x4, x0, 9
addi x6, x0, 5
addi x1, x0, 0
loop_start_131: # Loop body start

# --- Closing Loop 131 (Depth: 2) ---
addi x1, x1, 1
beq x1, x6, loop_end_131  # Conditional break from loop
bge x1, x4, loop_end_131 # Main loop exit condition
j loop_start_131 # Jump back to loop start
loop_end_131: # --- Resuming code after Loop 131 ---


# --- Closing Loop 102 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_end_102  # Conditional break from loop
bge x2, x5, loop_end_102 # Main loop exit condition
j loop_start_102 # Jump back to loop start
loop_end_102: # --- Resuming code after Loop 102 ---

sw x4, 32(x3)
sw x9, 204(x3)
lw x4, 660(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x1, 460(x3)

# --- Starting Loop 132 (Depth: 1, break at 1, max 3) ---
addi x6, x0, 3
addi x8, x0, 1
addi x1, x0, 0
loop_start_132: # Loop body start

# --- Closing Loop 132 (Depth: 1) ---
addi x1, x1, 1
beq x1, x8, loop_end_132  # Conditional break from loop
bge x1, x6, loop_end_132 # Main loop exit condition
j loop_start_132 # Jump back to loop start
loop_end_132: # --- Resuming code after Loop 132 ---


# --- Starting Loop 133 (Depth: 1, break at 1, max 9) ---
addi x4, x0, 9
addi x6, x0, 1
addi x9, x0, 0
loop_start_133: # Loop body start
sw x5, 372(x3)
add x8, x9, x1

# --- Starting Loop 134 (Depth: 2, break at 4, max 5) ---
addi x9, x0, 5
addi x7, x0, 4
addi x2, x0, 0
loop_start_134: # Loop body start

# --- Closing Loop 134 (Depth: 2) ---
addi x2, x2, 1
beq x2, x7, loop_end_134  # Conditional break from loop
bge x2, x9, loop_end_134 # Main loop exit condition
j loop_start_134 # Jump back to loop start
loop_end_134: # --- Resuming code after Loop 134 ---


# --- Starting Loop 135 (Depth: 2, break at 3, max 8) ---
addi x6, x0, 8
addi x1, x0, 3
addi x7, x0, 0
loop_start_135: # Loop body start

# --- Closing Loop 135 (Depth: 2) ---
addi x7, x7, 1
beq x7, x1, loop_end_135  # Conditional break from loop
bge x7, x6, loop_end_135 # Main loop exit condition
j loop_start_135 # Jump back to loop start
loop_end_135: # --- Resuming code after Loop 135 ---


# --- Closing Loop 133 (Depth: 1) ---
addi x9, x9, 1
beq x9, x6, loop_end_133  # Conditional break from loop
bge x9, x4, loop_end_133 # Main loop exit condition
j loop_start_133 # Jump back to loop start
loop_end_133: # --- Resuming code after Loop 133 ---

sw x6, 344(x3)

# --- Starting Loop 136 (Depth: 1, break at 3, max 9) ---
addi x6, x0, 9
addi x2, x0, 3
addi x1, x0, 0
loop_start_136: # Loop body start

# --- Closing Loop 136 (Depth: 1) ---
addi x1, x1, 1
beq x1, x2, loop_end_136  # Conditional break from loop
bge x1, x6, loop_end_136 # Main loop exit condition
j loop_start_136 # Jump back to loop start
loop_end_136: # --- Resuming code after Loop 136 ---

lw x5, 176(x3)

# --- Starting Loop 137 (Depth: 1, break at 3, max 4) ---
addi x6, x0, 4
addi x9, x0, 3
addi x1, x0, 0
loop_start_137: # Loop body start
sw x4, 256(x3)

# --- Closing Loop 137 (Depth: 1) ---
addi x1, x1, 1
beq x1, x9, loop_end_137  # Conditional break from loop
bge x1, x6, loop_end_137 # Main loop exit condition
j loop_start_137 # Jump back to loop start
loop_end_137: # --- Resuming code after Loop 137 ---


# --- Starting Loop 138 (Depth: 1, break at 1, max 7) ---
addi x6, x0, 7
addi x2, x0, 1
addi x4, x0, 0
loop_start_138: # Loop body start

# --- Starting Loop 139 (Depth: 2, break at 4, max 9) ---
addi x5, x0, 9
addi x6, x0, 4
addi x1, x0, 0
loop_start_139: # Loop body start
and x8, x5, x2
lw x9, 384(x3)
lw x6, 60(x3)
xor x1, x6, x9
sw x1, 228(x3)
sw x4, 52(x3)
lw x2, 824(x3)
lw x4, 496(x3)

# --- Starting Loop 140 (Depth: 3, break at 4, max 7) ---
addi x5, x0, 7
addi x1, x0, 4
addi x6, x0, 0
loop_start_140: # Loop body start
lw x2, 612(x3)
or x7, x2, x8
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 141 (Depth: 4, break at 5, max 7) ---
addi x5, x0, 7
addi x6, x0, 5
addi x9, x0, 0
loop_start_141: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x8, x9, x7
sw x5, 708(x3)
lw x5, 804(x3)
sub x2, x5, x4
lw x2, 692(x3)
sw x1, 956(x3)
sw x6, 32(x3)
sw x7, 380(x3)

# --- Closing Loop 141 (Depth: 4) ---
addi x9, x9, 1
beq x9, x6, loop_end_141  # Conditional break from loop
bge x9, x5, loop_end_141 # Main loop exit condition
j loop_start_141 # Jump back to loop start
loop_end_141: # --- Resuming code after Loop 141 ---

add x1, x8, x9

# --- Closing Loop 140 (Depth: 3) ---
addi x6, x6, 1
beq x6, x1, loop_end_140  # Conditional break from loop
bge x6, x5, loop_end_140 # Main loop exit condition
j loop_start_140 # Jump back to loop start
loop_end_140: # --- Resuming code after Loop 140 ---


# --- Closing Loop 139 (Depth: 2) ---
addi x1, x1, 1
beq x1, x6, loop_end_139  # Conditional break from loop
bge x1, x5, loop_end_139 # Main loop exit condition
j loop_start_139 # Jump back to loop start
loop_end_139: # --- Resuming code after Loop 139 ---

add x5, x1, x8

# --- Closing Loop 138 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_end_138  # Conditional break from loop
bge x4, x6, loop_end_138 # Main loop exit condition
j loop_start_138 # Jump back to loop start
loop_end_138: # --- Resuming code after Loop 138 ---

sub x8, x1, x4

# --- Starting Loop 142 (Depth: 1, break at 1, max 3) ---
addi x7, x0, 3
addi x1, x0, 1
addi x9, x0, 0
loop_start_142: # Loop body start

# --- Starting Loop 143 (Depth: 2, break at 1, max 2) ---
addi x6, x0, 2
addi x4, x0, 1
addi x8, x0, 0
loop_start_143: # Loop body start
sw x7, 524(x3)

# --- Closing Loop 143 (Depth: 2) ---
addi x8, x8, 1
beq x8, x4, loop_end_143  # Conditional break from loop
bge x8, x6, loop_end_143 # Main loop exit condition
j loop_start_143 # Jump back to loop start
loop_end_143: # --- Resuming code after Loop 143 ---

xor x6, x7, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 644(x3)
lw x9, 0(x3)

# --- Closing Loop 142 (Depth: 1) ---
addi x9, x9, 1
beq x9, x1, loop_end_142  # Conditional break from loop
bge x9, x7, loop_end_142 # Main loop exit condition
j loop_start_142 # Jump back to loop start
loop_end_142: # --- Resuming code after Loop 142 ---

srl x2, x9, x8
add x9, x2, x4

# --- Starting Loop 144 (Depth: 1, break at 5, max 10) ---
addi x1, x0, 10
addi x8, x0, 5
addi x2, x0, 0
loop_start_144: # Loop body start
or x8, x1, x5

# --- Starting Loop 145 (Depth: 2, break at 5, max 6) ---
addi x7, x0, 6
addi x1, x0, 5
addi x6, x0, 0
loop_start_145: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 146 (Depth: 3, break at 2, max 9) ---
addi x8, x0, 9
addi x5, x0, 2
addi x9, x0, 0
loop_start_146: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x1, 304(x3)
xor x7, x8, x5

# --- Closing Loop 146 (Depth: 3) ---
addi x9, x9, 1
beq x9, x5, loop_end_146  # Conditional break from loop
bge x9, x8, loop_end_146 # Main loop exit condition
j loop_start_146 # Jump back to loop start
loop_end_146: # --- Resuming code after Loop 146 ---

sub x1, x7, x9
or x4, x1, x6
sw x4, 184(x3)
sw x9, 76(x3)
sub x1, x7, x2
sw x1, 88(x3)
lw x5, 860(x3)

# --- Starting Loop 147 (Depth: 3, break at 1, max 4) ---
addi x7, x0, 4
addi x8, x0, 1
addi x2, x0, 0
loop_start_147: # Loop body start
sw x2, 992(x3)
srl x6, x4, x5
sub x8, x6, x5
lw x9, 604(x3)

# --- Closing Loop 147 (Depth: 3) ---
addi x2, x2, 1
beq x2, x8, loop_end_147  # Conditional break from loop
bge x2, x7, loop_end_147 # Main loop exit condition
j loop_start_147 # Jump back to loop start
loop_end_147: # --- Resuming code after Loop 147 ---

sll x2, x8, x6
lw x9, 436(x3)
and x1, x7, x6
sw x4, 324(x3)
lw x1, 736(x3)
lw x5, 948(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x4, x1, x2

# --- Closing Loop 145 (Depth: 2) ---
addi x6, x6, 1
beq x6, x1, loop_end_145  # Conditional break from loop
bge x6, x7, loop_end_145 # Main loop exit condition
j loop_start_145 # Jump back to loop start
loop_end_145: # --- Resuming code after Loop 145 ---


# --- Starting Loop 148 (Depth: 2, break at 3, max 9) ---
addi x7, x0, 9
addi x5, x0, 3
addi x1, x0, 0
loop_start_148: # Loop body start

# --- Starting Loop 149 (Depth: 3, break at 2, max 4) ---
addi x2, x0, 4
addi x4, x0, 2
addi x7, x0, 0
loop_start_149: # Loop body start
srl x4, x7, x5
or x5, x4, x7
and x1, x4, x7
add x2, x9, x8
lw x7, 924(x3)
xor x1, x7, x6

# --- Starting Loop 150 (Depth: 4, break at 2, max 7) ---
addi x8, x0, 7
addi x2, x0, 2
addi x5, x0, 0
loop_start_150: # Loop body start
sub x4, x1, x2
or x4, x2, x7
lw x5, 988(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 150 (Depth: 4) ---
addi x5, x5, 1
beq x5, x2, loop_end_150  # Conditional break from loop
bge x5, x8, loop_end_150 # Main loop exit condition
j loop_start_150 # Jump back to loop start
loop_end_150: # --- Resuming code after Loop 150 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 708(x3)
sll x5, x2, x6

# --- Closing Loop 149 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_end_149  # Conditional break from loop
bge x7, x2, loop_end_149 # Main loop exit condition
j loop_start_149 # Jump back to loop start
loop_end_149: # --- Resuming code after Loop 149 ---


# --- Closing Loop 148 (Depth: 2) ---
addi x1, x1, 1
beq x1, x5, loop_end_148  # Conditional break from loop
bge x1, x7, loop_end_148 # Main loop exit condition
j loop_start_148 # Jump back to loop start
loop_end_148: # --- Resuming code after Loop 148 ---


# --- Closing Loop 144 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_end_144  # Conditional break from loop
bge x2, x1, loop_end_144 # Main loop exit condition
j loop_start_144 # Jump back to loop start
loop_end_144: # --- Resuming code after Loop 144 ---

and x9, x5, x6

# --- Starting Loop 151 (Depth: 1, break at 2, max 3) ---
addi x4, x0, 3
addi x2, x0, 2
addi x5, x0, 0
loop_start_151: # Loop body start
sll x2, x4, x9

# --- Starting Loop 152 (Depth: 2, break at 2, max 7) ---
addi x8, x0, 7
addi x4, x0, 2
addi x7, x0, 0
loop_start_152: # Loop body start
srl x7, x9, x4

# --- Closing Loop 152 (Depth: 2) ---
addi x7, x7, 1
beq x7, x4, loop_end_152  # Conditional break from loop
bge x7, x8, loop_end_152 # Main loop exit condition
j loop_start_152 # Jump back to loop start
loop_end_152: # --- Resuming code after Loop 152 ---


# --- Closing Loop 151 (Depth: 1) ---
addi x5, x5, 1
beq x5, x2, loop_end_151  # Conditional break from loop
bge x5, x4, loop_end_151 # Main loop exit condition
j loop_start_151 # Jump back to loop start
loop_end_151: # --- Resuming code after Loop 151 ---

sw x7, 908(x3)

# --- Starting Loop 153 (Depth: 1, break at 1, max 2) ---
addi x4, x0, 2
addi x7, x0, 1
addi x9, x0, 0
loop_start_153: # Loop body start

# --- Closing Loop 153 (Depth: 1) ---
addi x9, x9, 1
beq x9, x7, loop_end_153  # Conditional break from loop
bge x9, x4, loop_end_153 # Main loop exit condition
j loop_start_153 # Jump back to loop start
loop_end_153: # --- Resuming code after Loop 153 ---

sw x5, 712(x3)
or x6, x1, x5

# --- Starting Loop 154 (Depth: 1, break at 5, max 10) ---
addi x1, x0, 10
addi x7, x0, 5
addi x4, x0, 0
loop_start_154: # Loop body start

# --- Starting Loop 155 (Depth: 2, break at 2, max 5) ---
addi x5, x0, 5
addi x2, x0, 2
addi x1, x0, 0
loop_start_155: # Loop body start

# --- Starting Loop 156 (Depth: 3, break at 1, max 2) ---
addi x5, x0, 2
addi x7, x0, 1
addi x4, x0, 0
loop_start_156: # Loop body start

# --- Closing Loop 156 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_end_156  # Conditional break from loop
bge x4, x5, loop_end_156 # Main loop exit condition
j loop_start_156 # Jump back to loop start
loop_end_156: # --- Resuming code after Loop 156 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 157 (Depth: 3, break at 1, max 5) ---
addi x9, x0, 5
addi x6, x0, 1
addi x1, x0, 0
loop_start_157: # Loop body start
sw x1, 352(x3)

# --- Closing Loop 157 (Depth: 3) ---
addi x1, x1, 1
beq x1, x6, loop_end_157  # Conditional break from loop
bge x1, x9, loop_end_157 # Main loop exit condition
j loop_start_157 # Jump back to loop start
loop_end_157: # --- Resuming code after Loop 157 ---


# --- Closing Loop 155 (Depth: 2) ---
addi x1, x1, 1
beq x1, x2, loop_end_155  # Conditional break from loop
bge x1, x5, loop_end_155 # Main loop exit condition
j loop_start_155 # Jump back to loop start
loop_end_155: # --- Resuming code after Loop 155 ---

sw x8, 120(x3)
or x2, x1, x7
sw x6, 244(x3)
lw x6, 788(x3)
lw x1, 864(x3)
sw x1, 632(x3)

# --- Starting Loop 158 (Depth: 2, break at 2, max 10) ---
addi x5, x0, 10
addi x8, x0, 2
addi x2, x0, 0
loop_start_158: # Loop body start

# --- Closing Loop 158 (Depth: 2) ---
addi x2, x2, 1
beq x2, x8, loop_end_158  # Conditional break from loop
bge x2, x5, loop_end_158 # Main loop exit condition
j loop_start_158 # Jump back to loop start
loop_end_158: # --- Resuming code after Loop 158 ---


# --- Starting Loop 159 (Depth: 2, break at 5, max 7) ---
addi x7, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_159: # Loop body start
srl x2, x5, x5

# --- Starting Loop 160 (Depth: 3, break at 2, max 10) ---
addi x4, x0, 10
addi x9, x0, 2
addi x7, x0, 0
loop_start_160: # Loop body start

# --- Starting Loop 161 (Depth: 4, break at 3, max 7) ---
addi x5, x0, 7
addi x2, x0, 3
addi x6, x0, 0
loop_start_161: # Loop body start
sll x2, x5, x4

# --- Starting Loop 162 (Depth: 5, break at 4, max 8) ---
addi x6, x0, 8
addi x1, x0, 4
addi x5, x0, 0
loop_start_162: # Loop body start
lw x9, 732(x3)
sw x9, 872(x3)
sll x4, x7, x9
and x7, x4, x9
sll x5, x8, x9
lw x2, 516(x3)
sw x2, 744(x3)

# --- Closing Loop 162 (Depth: 5) ---
addi x5, x5, 1
beq x5, x1, loop_end_162  # Conditional break from loop
bge x5, x6, loop_end_162 # Main loop exit condition
j loop_start_162 # Jump back to loop start
loop_end_162: # --- Resuming code after Loop 162 ---

sw x6, 484(x3)
lw x2, 228(x3)

# --- Starting Loop 163 (Depth: 5, break at 3, max 5) ---
addi x1, x0, 5
addi x6, x0, 3
addi x8, x0, 0
loop_start_163: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x8, 868(x3)
lw x9, 984(x3)
sw x6, 96(x3)
lw x8, 556(x3)
sw x5, 740(x3)
sll x2, x4, x5
xor x4, x2, x5

# --- Closing Loop 163 (Depth: 5) ---
addi x8, x8, 1
beq x8, x6, loop_end_163  # Conditional break from loop
bge x8, x1, loop_end_163 # Main loop exit condition
j loop_start_163 # Jump back to loop start
loop_end_163: # --- Resuming code after Loop 163 ---

lw x5, 108(x3)
lw x9, 544(x3)
lw x7, 428(x3)
lw x1, 816(x3)
lw x5, 20(x3)

# --- Closing Loop 161 (Depth: 4) ---
addi x6, x6, 1
beq x6, x2, loop_end_161  # Conditional break from loop
bge x6, x5, loop_end_161 # Main loop exit condition
j loop_start_161 # Jump back to loop start
loop_end_161: # --- Resuming code after Loop 161 ---

lw x6, 952(x3)

# --- Starting Loop 164 (Depth: 4, break at 3, max 8) ---
addi x7, x0, 8
addi x9, x0, 3
addi x2, x0, 0
loop_start_164: # Loop body start

# --- Closing Loop 164 (Depth: 4) ---
addi x2, x2, 1
beq x2, x9, loop_end_164  # Conditional break from loop
bge x2, x7, loop_end_164 # Main loop exit condition
j loop_start_164 # Jump back to loop start
loop_end_164: # --- Resuming code after Loop 164 ---

lw x9, 928(x3)
sw x9, 944(x3)
lw x5, 760(x3)

# --- Starting Loop 165 (Depth: 4, break at 1, max 3) ---
addi x9, x0, 3
addi x8, x0, 1
addi x2, x0, 0
loop_start_165: # Loop body start

# --- Closing Loop 165 (Depth: 4) ---
addi x2, x2, 1
beq x2, x8, loop_end_165  # Conditional break from loop
bge x2, x9, loop_end_165 # Main loop exit condition
j loop_start_165 # Jump back to loop start
loop_end_165: # --- Resuming code after Loop 165 ---

and x1, x2, x8
sw x1, 988(x3)
srl x9, x6, x7
lw x5, 104(x3)

# --- Starting Loop 166 (Depth: 4, break at 2, max 5) ---
addi x7, x0, 5
addi x9, x0, 2
addi x2, x0, 0
loop_start_166: # Loop body start

# --- Closing Loop 166 (Depth: 4) ---
addi x2, x2, 1
beq x2, x9, loop_end_166  # Conditional break from loop
bge x2, x7, loop_end_166 # Main loop exit condition
j loop_start_166 # Jump back to loop start
loop_end_166: # --- Resuming code after Loop 166 ---

lw x7, 152(x3)

# --- Starting Loop 167 (Depth: 4, break at 1, max 8) ---
addi x9, x0, 8
addi x1, x0, 1
addi x2, x0, 0
loop_start_167: # Loop body start
sw x2, 68(x3)
sw x2, 828(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 168 (Depth: 5, break at 1, max 7) ---
addi x2, x0, 7
addi x4, x0, 1
addi x1, x0, 0
loop_start_168: # Loop body start
sub x6, x1, x8
sw x7, 896(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 916(x3)

# --- Closing Loop 168 (Depth: 5) ---
addi x1, x1, 1
beq x1, x4, loop_end_168  # Conditional break from loop
bge x1, x2, loop_end_168 # Main loop exit condition
j loop_start_168 # Jump back to loop start
loop_end_168: # --- Resuming code after Loop 168 ---

lw x6, 84(x3)

# --- Closing Loop 167 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_end_167  # Conditional break from loop
bge x2, x9, loop_end_167 # Main loop exit condition
j loop_start_167 # Jump back to loop start
loop_end_167: # --- Resuming code after Loop 167 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 348(x3)
sll x2, x9, x8
sll x6, x2, x1
sw x6, 692(x3)
and x5, x4, x6

# --- Starting Loop 169 (Depth: 4, break at 5, max 7) ---
addi x8, x0, 7
addi x9, x0, 5
addi x7, x0, 0
loop_start_169: # Loop body start
sw x2, 340(x3)
lw x2, 948(x3)
sw x9, 588(x3)

# --- Starting Loop 170 (Depth: 5, break at 4, max 6) ---
addi x6, x0, 6
addi x1, x0, 4
addi x7, x0, 0
loop_start_170: # Loop body start
lw x9, 912(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x2, x6, x8
sw x2, 360(x3)
sw x6, 92(x3)

# --- Closing Loop 170 (Depth: 5) ---
addi x7, x7, 1
beq x7, x1, loop_end_170  # Conditional break from loop
bge x7, x6, loop_end_170 # Main loop exit condition
j loop_start_170 # Jump back to loop start
loop_end_170: # --- Resuming code after Loop 170 ---

sw x5, 500(x3)

# --- Starting Loop 171 (Depth: 5, break at 2, max 4) ---
addi x4, x0, 4
addi x1, x0, 2
addi x9, x0, 0
loop_start_171: # Loop body start
and x2, x9, x7
sw x2, 112(x3)
and x9, x8, x7
sw x9, 724(x3)

# --- Closing Loop 171 (Depth: 5) ---
addi x9, x9, 1
beq x9, x1, loop_end_171  # Conditional break from loop
bge x9, x4, loop_end_171 # Main loop exit condition
j loop_start_171 # Jump back to loop start
loop_end_171: # --- Resuming code after Loop 171 ---

lw x9, 532(x3)
sw x9, 228(x3)
or x9, x4, x1
sw x6, 284(x3)
sw x6, 160(x3)
srl x7, x4, x9
lw x9, 644(x3)
or x7, x9, x1

# --- Starting Loop 172 (Depth: 5, break at 2, max 10) ---
addi x1, x0, 10
addi x8, x0, 2
addi x5, x0, 0
loop_start_172: # Loop body start

# --- Closing Loop 172 (Depth: 5) ---
addi x5, x5, 1
beq x5, x8, loop_end_172  # Conditional break from loop
bge x5, x1, loop_end_172 # Main loop exit condition
j loop_start_172 # Jump back to loop start
loop_end_172: # --- Resuming code after Loop 172 ---

lw x9, 312(x3)
lw x7, 288(x3)
sll x9, x5, x6
lw x1, 472(x3)
and x5, x2, x1

# --- Closing Loop 169 (Depth: 4) ---
addi x7, x7, 1
beq x7, x9, loop_end_169  # Conditional break from loop
bge x7, x8, loop_end_169 # Main loop exit condition
j loop_start_169 # Jump back to loop start
loop_end_169: # --- Resuming code after Loop 169 ---

sw x5, 888(x3)
sub x7, x4, x9
lw x8, 88(x3)

# --- Closing Loop 160 (Depth: 3) ---
addi x7, x7, 1
beq x7, x9, loop_end_160  # Conditional break from loop
bge x7, x4, loop_end_160 # Main loop exit condition
j loop_start_160 # Jump back to loop start
loop_end_160: # --- Resuming code after Loop 160 ---


# --- Starting Loop 173 (Depth: 3, break at 1, max 8) ---
addi x6, x0, 8
addi x7, x0, 1
addi x5, x0, 0
loop_start_173: # Loop body start

# --- Closing Loop 173 (Depth: 3) ---
addi x5, x5, 1
beq x5, x7, loop_end_173  # Conditional break from loop
bge x5, x6, loop_end_173 # Main loop exit condition
j loop_start_173 # Jump back to loop start
loop_end_173: # --- Resuming code after Loop 173 ---

sub x7, x1, x9
and x1, x8, x9

# --- Starting Loop 174 (Depth: 3, break at 3, max 8) ---
addi x5, x0, 8
addi x8, x0, 3
addi x9, x0, 0
loop_start_174: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x4, 228(x3)

# --- Starting Loop 175 (Depth: 4, break at 1, max 4) ---
addi x1, x0, 4
addi x8, x0, 1
addi x2, x0, 0
loop_start_175: # Loop body start
sw x7, 608(x3)
add x9, x1, x4

# --- Starting Loop 176 (Depth: 5, break at 1, max 3) ---
addi x6, x0, 3
addi x8, x0, 1
addi x5, x0, 0
loop_start_176: # Loop body start
lw x7, 216(x3)

# --- Closing Loop 176 (Depth: 5) ---
addi x5, x5, 1
beq x5, x8, loop_end_176  # Conditional break from loop
bge x5, x6, loop_end_176 # Main loop exit condition
j loop_start_176 # Jump back to loop start
loop_end_176: # --- Resuming code after Loop 176 ---

sw x7, 992(x3)
sw x5, 852(x3)

# --- Closing Loop 175 (Depth: 4) ---
addi x2, x2, 1
beq x2, x8, loop_end_175  # Conditional break from loop
bge x2, x1, loop_end_175 # Main loop exit condition
j loop_start_175 # Jump back to loop start
loop_end_175: # --- Resuming code after Loop 175 ---


# --- Starting Loop 177 (Depth: 4, break at 4, max 6) ---
addi x2, x0, 6
addi x7, x0, 4
addi x1, x0, 0
loop_start_177: # Loop body start
lw x9, 228(x3)

# --- Closing Loop 177 (Depth: 4) ---
addi x1, x1, 1
beq x1, x7, loop_end_177  # Conditional break from loop
bge x1, x2, loop_end_177 # Main loop exit condition
j loop_start_177 # Jump back to loop start
loop_end_177: # --- Resuming code after Loop 177 ---

lw x2, 92(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
xor x8, x9, x7
xor x7, x8, x6
sw x4, 116(x3)

# --- Starting Loop 178 (Depth: 4, break at 2, max 8) ---
addi x8, x0, 8
addi x2, x0, 2
addi x1, x0, 0
loop_start_178: # Loop body start
lw x2, 28(x3)
add x7, x5, x2
lw x1, 156(x3)

# --- Starting Loop 179 (Depth: 5, break at 2, max 4) ---
addi x7, x0, 4
addi x8, x0, 2
addi x6, x0, 0
loop_start_179: # Loop body start
sw x5, 488(x3)
sw x7, 392(x3)
lw x7, 136(x3)
lw x6, 824(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x2, x6, x4
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x8, 76(x3)
sw x8, 292(x3)

# --- Closing Loop 179 (Depth: 5) ---
addi x6, x6, 1
beq x6, x8, loop_end_179  # Conditional break from loop
bge x6, x7, loop_end_179 # Main loop exit condition
j loop_start_179 # Jump back to loop start
loop_end_179: # --- Resuming code after Loop 179 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x6, 832(x3)
lw x8, 596(x3)
lw x9, 444(x3)

# --- Starting Loop 180 (Depth: 5, break at 5, max 6) ---
addi x1, x0, 6
addi x6, x0, 5
addi x2, x0, 0
loop_start_180: # Loop body start
lw x9, 72(x3)
or x7, x2, x5
sw x7, 624(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x8, 608(x3)
add x2, x1, x9
or x8, x6, x1
lw x9, 216(x3)
sw x1, 900(x3)
sw x7, 780(x3)
add x9, x6, x8
srl x2, x1, x7

# --- Closing Loop 180 (Depth: 5) ---
addi x2, x2, 1
beq x2, x6, loop_end_180  # Conditional break from loop
bge x2, x1, loop_end_180 # Main loop exit condition
j loop_start_180 # Jump back to loop start
loop_end_180: # --- Resuming code after Loop 180 ---


# --- Starting Loop 181 (Depth: 5, break at 2, max 6) ---
addi x5, x0, 6
addi x4, x0, 2
addi x7, x0, 0
loop_start_181: # Loop body start
sw x7, 752(x3)
add x9, x7, x5

# --- Closing Loop 181 (Depth: 5) ---
addi x7, x7, 1
beq x7, x4, loop_end_181  # Conditional break from loop
bge x7, x5, loop_end_181 # Main loop exit condition
j loop_start_181 # Jump back to loop start
loop_end_181: # --- Resuming code after Loop 181 ---

xor x7, x9, x5
lw x5, 904(x3)
lw x5, 84(x3)
sw x5, 372(x3)
and x9, x4, x6

# --- Starting Loop 182 (Depth: 5, break at 1, max 7) ---
addi x7, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_182: # Loop body start
and x9, x2, x5
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x2, 584(x3)

# --- Closing Loop 182 (Depth: 5) ---
addi x6, x6, 1
beq x6, x4, loop_end_182  # Conditional break from loop
bge x6, x7, loop_end_182 # Main loop exit condition
j loop_start_182 # Jump back to loop start
loop_end_182: # --- Resuming code after Loop 182 ---


# --- Starting Loop 183 (Depth: 5, break at 3, max 5) ---
addi x7, x0, 5
addi x4, x0, 3
addi x6, x0, 0
loop_start_183: # Loop body start

# --- Closing Loop 183 (Depth: 5) ---
addi x6, x6, 1
beq x6, x4, loop_end_183  # Conditional break from loop
bge x6, x7, loop_end_183 # Main loop exit condition
j loop_start_183 # Jump back to loop start
loop_end_183: # --- Resuming code after Loop 183 ---

lw x8, 108(x3)

# --- Closing Loop 178 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_end_178  # Conditional break from loop
bge x1, x8, loop_end_178 # Main loop exit condition
j loop_start_178 # Jump back to loop start
loop_end_178: # --- Resuming code after Loop 178 ---


# --- Closing Loop 174 (Depth: 3) ---
addi x9, x9, 1
beq x9, x8, loop_end_174  # Conditional break from loop
bge x9, x5, loop_end_174 # Main loop exit condition
j loop_start_174 # Jump back to loop start
loop_end_174: # --- Resuming code after Loop 174 ---

sub x4, x8, x5
sw x6, 592(x3)

# --- Closing Loop 159 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_end_159  # Conditional break from loop
bge x5, x7, loop_end_159 # Main loop exit condition
j loop_start_159 # Jump back to loop start
loop_end_159: # --- Resuming code after Loop 159 ---


# --- Starting Loop 184 (Depth: 2, break at 5, max 8) ---
addi x8, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_184: # Loop body start
lw x4, 0(x3)

# --- Closing Loop 184 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_end_184  # Conditional break from loop
bge x4, x8, loop_end_184 # Main loop exit condition
j loop_start_184 # Jump back to loop start
loop_end_184: # --- Resuming code after Loop 184 ---

sw x4, 628(x3)
lw x7, 932(x3)
lw x9, 416(x3)

# --- Closing Loop 154 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_end_154  # Conditional break from loop
bge x4, x1, loop_end_154 # Main loop exit condition
j loop_start_154 # Jump back to loop start
loop_end_154: # --- Resuming code after Loop 154 ---

or x1, x9, x6
lw x9, 948(x3)
sw x9, 420(x3)
lw x7, 608(x3)
sub x2, x7, x5

# --- Starting Loop 185 (Depth: 1, break at 1, max 7) ---
addi x7, x0, 7
addi x6, x0, 1
addi x1, x0, 0
loop_start_185: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 186 (Depth: 2, break at 2, max 6) ---
addi x8, x0, 6
addi x6, x0, 2
addi x2, x0, 0
loop_start_186: # Loop body start

# --- Closing Loop 186 (Depth: 2) ---
addi x2, x2, 1
beq x2, x6, loop_end_186  # Conditional break from loop
bge x2, x8, loop_end_186 # Main loop exit condition
j loop_start_186 # Jump back to loop start
loop_end_186: # --- Resuming code after Loop 186 ---

srl x4, x9, x5
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 187 (Depth: 2, break at 4, max 7) ---
addi x1, x0, 7
addi x9, x0, 4
addi x8, x0, 0
loop_start_187: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x4, 580(x3)

# --- Starting Loop 188 (Depth: 3, break at 1, max 3) ---
addi x2, x0, 3
addi x9, x0, 1
addi x8, x0, 0
loop_start_188: # Loop body start
sw x1, 248(x3)

# --- Closing Loop 188 (Depth: 3) ---
addi x8, x8, 1
beq x8, x9, loop_end_188  # Conditional break from loop
bge x8, x2, loop_end_188 # Main loop exit condition
j loop_start_188 # Jump back to loop start
loop_end_188: # --- Resuming code after Loop 188 ---

and x2, x6, x1
sw x2, 108(x3)
lw x2, 100(x3)

# --- Starting Loop 189 (Depth: 3, break at 5, max 10) ---
addi x1, x0, 10
addi x7, x0, 5
addi x8, x0, 0
loop_start_189: # Loop body start
lw x7, 704(x3)
sw x7, 464(x3)
lw x6, 220(x3)
sw x6, 36(x3)
sw x1, 452(x3)

# --- Starting Loop 190 (Depth: 4, break at 2, max 9) ---
addi x1, x0, 9
addi x9, x0, 2
addi x7, x0, 0
loop_start_190: # Loop body start
add x4, x7, x9
or x8, x9, x6

# --- Starting Loop 191 (Depth: 5, break at 4, max 8) ---
addi x9, x0, 8
addi x6, x0, 4
addi x1, x0, 0
loop_start_191: # Loop body start
lw x8, 928(x3)

# --- Closing Loop 191 (Depth: 5) ---
addi x1, x1, 1
beq x1, x6, loop_end_191  # Conditional break from loop
bge x1, x9, loop_end_191 # Main loop exit condition
j loop_start_191 # Jump back to loop start
loop_end_191: # --- Resuming code after Loop 191 ---

sw x1, 260(x3)
sw x1, 732(x3)
lw x8, 948(x3)
srl x8, x2, x5
sub x5, x8, x4
lw x9, 284(x3)
add x5, x6, x9
sw x2, 664(x3)
sw x8, 204(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x6, 172(x3)
srl x1, x6, x6
sw x1, 456(x3)
or x9, x2, x1
lw x5, 240(x3)
lw x4, 876(x3)
lw x7, 260(x3)
sw x1, 336(x3)

# --- Starting Loop 192 (Depth: 5, break at 1, max 3) ---
addi x1, x0, 3
addi x5, x0, 1
addi x4, x0, 0
loop_start_192: # Loop body start
xor x2, x4, x4
sw x2, 380(x3)

# --- Closing Loop 192 (Depth: 5) ---
addi x4, x4, 1
beq x4, x5, loop_end_192  # Conditional break from loop
bge x4, x1, loop_end_192 # Main loop exit condition
j loop_start_192 # Jump back to loop start
loop_end_192: # --- Resuming code after Loop 192 ---


# --- Closing Loop 190 (Depth: 4) ---
addi x7, x7, 1
beq x7, x9, loop_end_190  # Conditional break from loop
bge x7, x1, loop_end_190 # Main loop exit condition
j loop_start_190 # Jump back to loop start
loop_end_190: # --- Resuming code after Loop 190 ---


# --- Closing Loop 189 (Depth: 3) ---
addi x8, x8, 1
beq x8, x7, loop_end_189  # Conditional break from loop
bge x8, x1, loop_end_189 # Main loop exit condition
j loop_start_189 # Jump back to loop start
loop_end_189: # --- Resuming code after Loop 189 ---


# --- Starting Loop 193 (Depth: 3, break at 5, max 7) ---
addi x1, x0, 7
addi x5, x0, 5
addi x2, x0, 0
loop_start_193: # Loop body start
sw x1, 440(x3)
and x1, x2, x7
lw x2, 132(x3)

# --- Starting Loop 194 (Depth: 4, break at 2, max 7) ---
addi x6, x0, 7
addi x7, x0, 2
addi x8, x0, 0
loop_start_194: # Loop body start

# --- Closing Loop 194 (Depth: 4) ---
addi x8, x8, 1
beq x8, x7, loop_end_194  # Conditional break from loop
bge x8, x6, loop_end_194 # Main loop exit condition
j loop_start_194 # Jump back to loop start
loop_end_194: # --- Resuming code after Loop 194 ---

sw x8, 320(x3)
sub x7, x9, x4

# --- Starting Loop 195 (Depth: 4, break at 5, max 10) ---
addi x4, x0, 10
addi x2, x0, 5
addi x1, x0, 0
loop_start_195: # Loop body start
sw x8, 816(x3)
lw x6, 928(x3)
sw x2, 956(x3)
and x8, x1, x7
lw x5, 252(x3)
sw x5, 148(x3)

# --- Closing Loop 195 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_end_195  # Conditional break from loop
bge x1, x4, loop_end_195 # Main loop exit condition
j loop_start_195 # Jump back to loop start
loop_end_195: # --- Resuming code after Loop 195 ---


# --- Starting Loop 196 (Depth: 4, break at 1, max 6) ---
addi x7, x0, 6
addi x8, x0, 1
addi x9, x0, 0
loop_start_196: # Loop body start
srl x8, x1, x9
or x4, x9, x8
sll x5, x2, x1
sw x6, 524(x3)
xor x6, x2, x8
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 244(x3)
lw x7, 856(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
and x1, x6, x9
sw x2, 960(x3)
sw x9, 380(x3)
add x4, x2, x8
sw x5, 472(x3)
and x9, x5, x4

# --- Starting Loop 197 (Depth: 5, break at 3, max 4) ---
addi x8, x0, 4
addi x4, x0, 3
addi x2, x0, 0
loop_start_197: # Loop body start
lw x6, 464(x3)
lw x9, 184(x3)
sll x9, x7, x8
xor x8, x6, x2
sw x2, 324(x3)
sw x1, 480(x3)
lw x1, 976(x3)
lw x7, 332(x3)
lw x9, 72(x3)
lw x2, 764(x3)
lw x7, 584(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x1, 988(x3)

# --- Closing Loop 197 (Depth: 5) ---
addi x2, x2, 1
beq x2, x4, loop_end_197  # Conditional break from loop
bge x2, x8, loop_end_197 # Main loop exit condition
j loop_start_197 # Jump back to loop start
loop_end_197: # --- Resuming code after Loop 197 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 196 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_end_196  # Conditional break from loop
bge x9, x7, loop_end_196 # Main loop exit condition
j loop_start_196 # Jump back to loop start
loop_end_196: # --- Resuming code after Loop 196 ---


# --- Starting Loop 198 (Depth: 4, break at 3, max 5) ---
addi x5, x0, 5
addi x7, x0, 3
addi x6, x0, 0
loop_start_198: # Loop body start

# --- Closing Loop 198 (Depth: 4) ---
addi x6, x6, 1
beq x6, x7, loop_end_198  # Conditional break from loop
bge x6, x5, loop_end_198 # Main loop exit condition
j loop_start_198 # Jump back to loop start
loop_end_198: # --- Resuming code after Loop 198 ---

add x7, x5, x4
lw x6, 236(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x8, x1, x2

# --- Closing Loop 193 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_end_193  # Conditional break from loop
bge x2, x1, loop_end_193 # Main loop exit condition
j loop_start_193 # Jump back to loop start
loop_end_193: # --- Resuming code after Loop 193 ---

sw x8, 396(x3)

# --- Starting Loop 199 (Depth: 3, break at 1, max 8) ---
addi x1, x0, 8
addi x6, x0, 1
addi x8, x0, 0
loop_start_199: # Loop body start
lw x9, 268(x3)
lw x5, 656(x3)
lw x9, 280(x3)
lw x1, 732(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x8, 344(x3)
lw x4, 272(x3)
lw x6, 136(x3)
lw x9, 828(x3)

# --- Starting Loop 200 (Depth: 4, break at 2, max 9) ---
addi x6, x0, 9
addi x5, x0, 2
addi x8, x0, 0
loop_start_200: # Loop body start

# --- Closing Loop 200 (Depth: 4) ---
addi x8, x8, 1
beq x8, x5, loop_end_200  # Conditional break from loop
bge x8, x6, loop_end_200 # Main loop exit condition
j loop_start_200 # Jump back to loop start
loop_end_200: # --- Resuming code after Loop 200 ---

lw x1, 96(x3)
lw x9, 196(x3)
lw x5, 912(x3)

# --- Closing Loop 199 (Depth: 3) ---
addi x8, x8, 1
beq x8, x6, loop_end_199  # Conditional break from loop
bge x8, x1, loop_end_199 # Main loop exit condition
j loop_start_199 # Jump back to loop start
loop_end_199: # --- Resuming code after Loop 199 ---

sw x5, 704(x3)
sw x5, 108(x3)

# --- Closing Loop 187 (Depth: 2) ---
addi x8, x8, 1
beq x8, x9, loop_end_187  # Conditional break from loop
bge x8, x1, loop_end_187 # Main loop exit condition
j loop_start_187 # Jump back to loop start
loop_end_187: # --- Resuming code after Loop 187 ---


# --- Starting Loop 201 (Depth: 2, break at 5, max 8) ---
addi x6, x0, 8
addi x5, x0, 5
addi x1, x0, 0
loop_start_201: # Loop body start

# --- Starting Loop 202 (Depth: 3, break at 2, max 9) ---
addi x8, x0, 9
addi x6, x0, 2
addi x7, x0, 0
loop_start_202: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
or x8, x7, x4
sll x6, x8, x7
xor x8, x6, x2
lw x1, 244(x3)
srl x4, x9, x2
sw x6, 936(x3)
sw x8, 936(x3)
lw x1, 592(x3)
lw x2, 704(x3)
lw x8, 704(x3)
srl x7, x8, x1
sw x1, 144(x3)
xor x1, x7, x8
xor x7, x6, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
add x1, x7, x8

# --- Starting Loop 203 (Depth: 4, break at 1, max 9) ---
addi x7, x0, 9
addi x4, x0, 1
addi x5, x0, 0
loop_start_203: # Loop body start
sw x2, 852(x3)
sll x7, x5, x8
sw x7, 788(x3)

# --- Closing Loop 203 (Depth: 4) ---
addi x5, x5, 1
beq x5, x4, loop_end_203  # Conditional break from loop
bge x5, x7, loop_end_203 # Main loop exit condition
j loop_start_203 # Jump back to loop start
loop_end_203: # --- Resuming code after Loop 203 ---


# --- Starting Loop 204 (Depth: 4, break at 1, max 2) ---
addi x8, x0, 2
addi x7, x0, 1
addi x6, x0, 0
loop_start_204: # Loop body start
sw x4, 60(x3)
lw x9, 204(x3)
add x9, x9, x8
lw x1, 940(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x6, 488(x3)
lw x2, 464(x3)
lw x4, 232(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x7, 972(x3)
lw x8, 596(x3)

# --- Starting Loop 205 (Depth: 5, break at 5, max 9) ---
addi x6, x0, 9
addi x1, x0, 5
addi x9, x0, 0
loop_start_205: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x9, 132(x3)

# --- Starting Loop 206 (Depth: 6, break at 5, max 10) ---
addi x6, x0, 10
addi x5, x0, 5
addi x4, x0, 0
loop_start_206: # Loop body start
lw x2, 844(x3)
lw x5, 688(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 206 (Depth: 6) ---
addi x4, x4, 1
beq x4, x5, loop_end_206  # Conditional break from loop
bge x4, x6, loop_end_206 # Main loop exit condition
j loop_start_206 # Jump back to loop start
loop_end_206: # --- Resuming code after Loop 206 ---

sw x5, 764(x3)
sw x4, 152(x3)
sw x2, 524(x3)
add x7, x4, x9
and x5, x9, x1
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 207 (Depth: 6, break at 1, max 2) ---
addi x2, x0, 2
addi x8, x0, 1
addi x1, x0, 0
loop_start_207: # Loop body start
sll x8, x1, x6
add x5, x1, x2
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 207 (Depth: 6) ---
addi x1, x1, 1
beq x1, x8, loop_end_207  # Conditional break from loop
bge x1, x2, loop_end_207 # Main loop exit condition
j loop_start_207 # Jump back to loop start
loop_end_207: # --- Resuming code after Loop 207 ---

srl x4, x5, x1
sub x1, x4, x2
sw x4, 980(x3)

# --- Closing Loop 205 (Depth: 5) ---
addi x9, x9, 1
beq x9, x1, loop_end_205  # Conditional break from loop
bge x9, x6, loop_end_205 # Main loop exit condition
j loop_start_205 # Jump back to loop start
loop_end_205: # --- Resuming code after Loop 205 ---

lw x2, 896(x3)
lw x9, 1000(x3)
lw x7, 388(x3)
or x6, x7, x1
lw x7, 952(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sw x5, 180(x3)

# --- Closing Loop 204 (Depth: 4) ---
addi x6, x6, 1
beq x6, x7, loop_end_204  # Conditional break from loop
bge x6, x8, loop_end_204 # Main loop exit condition
j loop_start_204 # Jump back to loop start
loop_end_204: # --- Resuming code after Loop 204 ---

lw x1, 296(x3)
sw x5, 96(x3)

# --- Starting Loop 208 (Depth: 4, break at 1, max 9) ---
addi x1, x0, 9
addi x8, x0, 1
addi x6, x0, 0
loop_start_208: # Loop body start

# --- Starting Loop 209 (Depth: 5, break at 1, max 2) ---
addi x8, x0, 2
addi x2, x0, 1
addi x4, x0, 0
loop_start_209: # Loop body start
lw x5, 408(x3)

# --- Closing Loop 209 (Depth: 5) ---
addi x4, x4, 1
beq x4, x2, loop_end_209  # Conditional break from loop
bge x4, x8, loop_end_209 # Main loop exit condition
j loop_start_209 # Jump back to loop start
loop_end_209: # --- Resuming code after Loop 209 ---


# --- Starting Loop 210 (Depth: 5, break at 3, max 6) ---
addi x4, x0, 6
addi x2, x0, 3
addi x9, x0, 0
loop_start_210: # Loop body start
lw x4, 384(x3)

# --- Closing Loop 210 (Depth: 5) ---
addi x9, x9, 1
beq x9, x2, loop_end_210  # Conditional break from loop
bge x9, x4, loop_end_210 # Main loop exit condition
j loop_start_210 # Jump back to loop start
loop_end_210: # --- Resuming code after Loop 210 ---

xor x6, x4, x1
sub x2, x9, x7
bne x0, x0, 8 # Never branch
nop # Executed instruction
lw x9, 816(x3)

# --- Closing Loop 208 (Depth: 4) ---
addi x6, x6, 1
beq x6, x8, loop_end_208  # Conditional break from loop
bge x6, x1, loop_end_208 # Main loop exit condition
j loop_start_208 # Jump back to loop start
loop_end_208: # --- Resuming code after Loop 208 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 202 (Depth: 3) ---
addi x7, x7, 1
beq x7, x6, loop_end_202  # Conditional break from loop
bge x7, x8, loop_end_202 # Main loop exit condition
j loop_start_202 # Jump back to loop start
loop_end_202: # --- Resuming code after Loop 202 ---

sw x8, 756(x3)
sw x2, 880(x3)
sw x7, 784(x3)

# --- Starting Loop 211 (Depth: 3, break at 4, max 5) ---
addi x6, x0, 5
addi x4, x0, 4
addi x9, x0, 0
loop_start_211: # Loop body start
sw x5, 272(x3)
sw x2, 904(x3)
sub x6, x1, x4

# --- Starting Loop 212 (Depth: 4, break at 3, max 6) ---
addi x9, x0, 6
addi x2, x0, 3
addi x4, x0, 0
loop_start_212: # Loop body start
sw x4, 396(x3)

# --- Closing Loop 212 (Depth: 4) ---
addi x4, x4, 1
beq x4, x2, loop_end_212  # Conditional break from loop
bge x4, x9, loop_end_212 # Main loop exit condition
j loop_start_212 # Jump back to loop start
loop_end_212: # --- Resuming code after Loop 212 ---

lw x2, 796(x3)
sw x2, 904(x3)
and x7, x9, x2

# --- Closing Loop 211 (Depth: 3) ---
addi x9, x9, 1
beq x9, x4, loop_end_211  # Conditional break from loop
bge x9, x6, loop_end_211 # Main loop exit condition
j loop_start_211 # Jump back to loop start
loop_end_211: # --- Resuming code after Loop 211 ---


# --- Starting Loop 213 (Depth: 3, break at 2, max 4) ---
addi x1, x0, 4
addi x6, x0, 2
addi x8, x0, 0
loop_start_213: # Loop body start
lw x6, 948(x3)
srl x6, x9, x2
sw x2, 624(x3)
sw x1, 608(x3)

# --- Closing Loop 213 (Depth: 3) ---
addi x8, x8, 1
beq x8, x6, loop_end_213  # Conditional break from loop
bge x8, x1, loop_end_213 # Main loop exit condition
j loop_start_213 # Jump back to loop start
loop_end_213: # --- Resuming code after Loop 213 ---


# --- Starting Loop 214 (Depth: 3, break at 2, max 10) ---
addi x9, x0, 10
addi x2, x0, 2
addi x7, x0, 0
loop_start_214: # Loop body start
lw x1, 28(x3)
sw x2, 968(x3)
sll x7, x5, x6

# --- Starting Loop 215 (Depth: 4, break at 1, max 10) ---
addi x5, x0, 10
addi x4, x0, 1
addi x2, x0, 0
loop_start_215: # Loop body start
lw x5, 536(x3)
sll x4, x5, x1

# --- Closing Loop 215 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_end_215  # Conditional break from loop
bge x2, x5, loop_end_215 # Main loop exit condition
j loop_start_215 # Jump back to loop start
loop_end_215: # --- Resuming code after Loop 215 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x1, 352(x3)
sub x4, x5, x2
sw x2, 248(x3)

# --- Starting Loop 216 (Depth: 4, break at 5, max 6) ---
addi x5, x0, 6
addi x7, x0, 5
addi x9, x0, 0
loop_start_216: # Loop body start

# --- Starting Loop 217 (Depth: 5, break at 3, max 6) ---
addi x7, x0, 6
addi x1, x0, 3
addi x6, x0, 0
loop_start_217: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
or x2, x1, x5
lw x5, 868(x3)
lw x7, 392(x3)

# --- Closing Loop 217 (Depth: 5) ---
addi x6, x6, 1
beq x6, x1, loop_end_217  # Conditional break from loop
bge x6, x7, loop_end_217 # Main loop exit condition
j loop_start_217 # Jump back to loop start
loop_end_217: # --- Resuming code after Loop 217 ---

sw x8, 56(x3)
sw x6, 556(x3)
add x4, x6, x5
xor x4, x4, x2
lw x9, 180(x3)

# --- Closing Loop 216 (Depth: 4) ---
addi x9, x9, 1
beq x9, x7, loop_end_216  # Conditional break from loop
bge x9, x5, loop_end_216 # Main loop exit condition
j loop_start_216 # Jump back to loop start
loop_end_216: # --- Resuming code after Loop 216 ---

lw x5, 28(x3)
xor x9, x2, x6
add x2, x1, x5
sw x4, 860(x3)
or x7, x9, x5

# --- Starting Loop 218 (Depth: 4, break at 5, max 7) ---
addi x8, x0, 7
addi x2, x0, 5
addi x9, x0, 0
loop_start_218: # Loop body start
sw x1, 864(x3)

# --- Closing Loop 218 (Depth: 4) ---
addi x9, x9, 1
beq x9, x2, loop_end_218  # Conditional break from loop
bge x9, x8, loop_end_218 # Main loop exit condition
j loop_start_218 # Jump back to loop start
loop_end_218: # --- Resuming code after Loop 218 ---


# --- Closing Loop 214 (Depth: 3) ---
addi x7, x7, 1
beq x7, x2, loop_end_214  # Conditional break from loop
bge x7, x9, loop_end_214 # Main loop exit condition
j loop_start_214 # Jump back to loop start
loop_end_214: # --- Resuming code after Loop 214 ---

lw x6, 60(x3)

# --- Closing Loop 201 (Depth: 2) ---
addi x1, x1, 1
beq x1, x5, loop_end_201  # Conditional break from loop
bge x1, x6, loop_end_201 # Main loop exit condition
j loop_start_201 # Jump back to loop start
loop_end_201: # --- Resuming code after Loop 201 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
sll x6, x6, x5

# --- Starting Loop 219 (Depth: 2, break at 1, max 8) ---
addi x7, x0, 8
addi x8, x0, 1
addi x5, x0, 0
loop_start_219: # Loop body start
sw x6, 700(x3)

# --- Starting Loop 220 (Depth: 3, break at 1, max 7) ---
addi x1, x0, 7
addi x7, x0, 1
addi x9, x0, 0
loop_start_220: # Loop body start
add x5, x2, x7
sll x9, x2, x1
sub x5, x9, x4

# --- Starting Loop 221 (Depth: 4, break at 5, max 6) ---
addi x1, x0, 6
addi x7, x0, 5
addi x6, x0, 0
loop_start_221: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 221 (Depth: 4) ---
addi x6, x6, 1
beq x6, x7, loop_end_221  # Conditional break from loop
bge x6, x1, loop_end_221 # Main loop exit condition
j loop_start_221 # Jump back to loop start
loop_end_221: # --- Resuming code after Loop 221 ---

sw x8, 816(x3)

# --- Starting Loop 222 (Depth: 4, break at 4, max 7) ---
addi x8, x0, 7
addi x7, x0, 4
addi x9, x0, 0
loop_start_222: # Loop body start
lw x4, 572(x3)
lw x2, 116(x3)
sw x7, 348(x3)
lw x9, 556(x3)

# --- Closing Loop 222 (Depth: 4) ---
addi x9, x9, 1
beq x9, x7, loop_end_222  # Conditional break from loop
bge x9, x8, loop_end_222 # Main loop exit condition
j loop_start_222 # Jump back to loop start
loop_end_222: # --- Resuming code after Loop 222 ---

lw x2, 500(x3)
lw x7, 464(x3)
sll x7, x4, x8
sw x2, 916(x3)

# --- Closing Loop 220 (Depth: 3) ---
addi x9, x9, 1
beq x9, x7, loop_end_220  # Conditional break from loop
bge x9, x1, loop_end_220 # Main loop exit condition
j loop_start_220 # Jump back to loop start
loop_end_220: # --- Resuming code after Loop 220 ---

lw x5, 732(x3)
sll x9, x2, x1
sw x9, 116(x3)
sw x4, 336(x3)

# --- Starting Loop 223 (Depth: 3, break at 3, max 8) ---
addi x6, x0, 8
addi x7, x0, 3
addi x2, x0, 0
loop_start_223: # Loop body start
or x1, x2, x7
sll x8, x1, x1
sw x6, 920(x3)
lw x8, 656(x3)
lw x1, 936(x3)
xor x1, x1, x6
sub x4, x1, x1

# --- Closing Loop 223 (Depth: 3) ---
addi x2, x2, 1
beq x2, x7, loop_end_223  # Conditional break from loop
bge x2, x6, loop_end_223 # Main loop exit condition
j loop_start_223 # Jump back to loop start
loop_end_223: # --- Resuming code after Loop 223 ---

bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x4, 8(x3)
sw x6, 952(x3)
srl x7, x1, x8
sw x2, 984(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Closing Loop 219 (Depth: 2) ---
addi x5, x5, 1
beq x5, x8, loop_end_219  # Conditional break from loop
bge x5, x7, loop_end_219 # Main loop exit condition
j loop_start_219 # Jump back to loop start
loop_end_219: # --- Resuming code after Loop 219 ---


# --- Closing Loop 185 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_end_185  # Conditional break from loop
bge x1, x7, loop_end_185 # Main loop exit condition
j loop_start_185 # Jump back to loop start
loop_end_185: # --- Resuming code after Loop 185 ---


# --- Starting Loop 224 (Depth: 1, break at 5, max 8) ---
addi x2, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_224: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 225 (Depth: 2, break at 2, max 6) ---
addi x2, x0, 6
addi x7, x0, 2
addi x6, x0, 0
loop_start_225: # Loop body start
sub x9, x6, x8
sw x7, 928(x3)

# --- Starting Loop 226 (Depth: 3, break at 4, max 5) ---
addi x2, x0, 5
addi x8, x0, 4
addi x7, x0, 0
loop_start_226: # Loop body start
bne x0, x0, 8 # Never branch
nop # Executed instruction
sw x5, 428(x3)
lw x1, 544(x3)
sw x2, 876(x3)
lw x7, 824(x3)
lw x8, 8(x3)
lw x1, 140(x3)
lw x5, 524(x3)

# --- Starting Loop 227 (Depth: 4, break at 3, max 7) ---
addi x7, x0, 7
addi x1, x0, 3
addi x8, x0, 0
loop_start_227: # Loop body start
lw x7, 16(x3)
sw x7, 280(x3)

# --- Starting Loop 228 (Depth: 5, break at 5, max 10) ---
addi x1, x0, 10
addi x8, x0, 5
addi x4, x0, 0
loop_start_228: # Loop body start
lw x5, 252(x3)
lw x5, 860(x3)

# --- Closing Loop 228 (Depth: 5) ---
addi x4, x4, 1
beq x4, x8, loop_end_228  # Conditional break from loop
bge x4, x1, loop_end_228 # Main loop exit condition
j loop_start_228 # Jump back to loop start
loop_end_228: # --- Resuming code after Loop 228 ---

lw x4, 124(x3)
sub x7, x4, x1
sw x7, 324(x3)

# --- Starting Loop 229 (Depth: 5, break at 2, max 3) ---
addi x9, x0, 3
addi x1, x0, 2
addi x2, x0, 0
loop_start_229: # Loop body start
lw x8, 104(x3)

# --- Starting Loop 230 (Depth: 6, break at 4, max 6) ---
addi x2, x0, 6
addi x9, x0, 4
addi x6, x0, 0
loop_start_230: # Loop body start
lw x8, 20(x3)
sw x8, 168(x3)

# --- Closing Loop 230 (Depth: 6) ---
addi x6, x6, 1
beq x6, x9, loop_end_230  # Conditional break from loop
bge x6, x2, loop_end_230 # Main loop exit condition
j loop_start_230 # Jump back to loop start
loop_end_230: # --- Resuming code after Loop 230 ---

sub x2, x8, x4

# --- Starting Loop 231 (Depth: 6, break at 3, max 10) ---
addi x8, x0, 10
addi x1, x0, 3
addi x6, x0, 0
loop_start_231: # Loop body start
sub x5, x6, x8
lw x7, 932(x3)

# --- Closing Loop 231 (Depth: 6) ---
addi x6, x6, 1
beq x6, x1, loop_end_231  # Conditional break from loop
bge x6, x8, loop_end_231 # Main loop exit condition
j loop_start_231 # Jump back to loop start
loop_end_231: # --- Resuming code after Loop 231 ---

lw x7, 0(x3)

# --- Closing Loop 229 (Depth: 5) ---
addi x2, x2, 1
beq x2, x1, loop_end_229  # Conditional break from loop
bge x2, x9, loop_end_229 # Main loop exit condition
j loop_start_229 # Jump back to loop start
loop_end_229: # --- Resuming code after Loop 229 ---

lw x8, 428(x3)
sw x1, 140(x3)
lw x5, 760(x3)
sw x5, 960(x3)
sw x1, 708(x3)
sub x5, x9, x4
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x8, 152(x3)

# --- Closing Loop 227 (Depth: 4) ---
addi x8, x8, 1
beq x8, x1, loop_end_227  # Conditional break from loop
bge x8, x7, loop_end_227 # Main loop exit condition
j loop_start_227 # Jump back to loop start
loop_end_227: # --- Resuming code after Loop 227 ---

or x9, x2, x1
lw x4, 36(x3)
sw x4, 260(x3)

# --- Starting Loop 232 (Depth: 4, break at 3, max 8) ---
addi x9, x0, 8
addi x6, x0, 3
addi x4, x0, 0
loop_start_232: # Loop body start
add x6, x4, x7

# --- Closing Loop 232 (Depth: 4) ---
addi x4, x4, 1
beq x4, x6, loop_end_232  # Conditional break from loop
bge x4, x9, loop_end_232 # Main loop exit condition
j loop_start_232 # Jump back to loop start
loop_end_232: # --- Resuming code after Loop 232 ---


# --- Starting Loop 233 (Depth: 4, break at 2, max 10) ---
addi x2, x0, 10
addi x4, x0, 2
addi x7, x0, 0
loop_start_233: # Loop body start
sw x9, 516(x3)
sw x6, 984(x3)
lw x2, 516(x3)
sw x4, 892(x3)
or x7, x4, x5
sw x7, 964(x3)
srl x1, x9, x4
sw x1, 684(x3)
lw x8, 88(x3)
or x1, x6, x9

# --- Closing Loop 233 (Depth: 4) ---
addi x7, x7, 1
beq x7, x4, loop_end_233  # Conditional break from loop
bge x7, x2, loop_end_233 # Main loop exit condition
j loop_start_233 # Jump back to loop start
loop_end_233: # --- Resuming code after Loop 233 ---

sw x2, 848(x3)

# --- Starting Loop 234 (Depth: 4, break at 1, max 9) ---
addi x1, x0, 9
addi x2, x0, 1
addi x8, x0, 0
loop_start_234: # Loop body start

# --- Closing Loop 234 (Depth: 4) ---
addi x8, x8, 1
beq x8, x2, loop_end_234  # Conditional break from loop
bge x8, x1, loop_end_234 # Main loop exit condition
j loop_start_234 # Jump back to loop start
loop_end_234: # --- Resuming code after Loop 234 ---

lw x5, 124(x3)
srl x1, x5, x5
sw x1, 172(x3)

# --- Closing Loop 226 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_end_226  # Conditional break from loop
bge x7, x2, loop_end_226 # Main loop exit condition
j loop_start_226 # Jump back to loop start
loop_end_226: # --- Resuming code after Loop 226 ---

lw x5, 580(x3)
sw x9, 560(x3)
and x6, x8, x7
sw x6, 184(x3)

# --- Closing Loop 225 (Depth: 2) ---
addi x6, x6, 1
beq x6, x7, loop_end_225  # Conditional break from loop
bge x6, x2, loop_end_225 # Main loop exit condition
j loop_start_225 # Jump back to loop start
loop_end_225: # --- Resuming code after Loop 225 ---


# --- Starting Loop 235 (Depth: 2, break at 4, max 6) ---
addi x9, x0, 6
addi x7, x0, 4
addi x6, x0, 0
loop_start_235: # Loop body start

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 235
addi x6, x6, 1
beq x6, x7, loop_end_235
bge x6, x9, loop_end_235
j loop_start_235
loop_end_235: # Loop exit

# Closing remaining Loop 224
addi x4, x4, 1
beq x4, x6, loop_end_224
bge x4, x2, loop_end_224
j loop_start_224
loop_end_224: # Loop exit

# Program exit
li a7, 93 # ecall: exit
ecall
