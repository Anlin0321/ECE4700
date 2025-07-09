# Initialize memory base register x3
lui x3, 9
addi x3, x3, 0

lw x5, 648(x3)
sw x1, 28(x3)

# --- Starting Loop 1 (Depth: 1, break at 3, max 9) ---
addi x1, x0, 9
addi x8, x0, 3
addi x9, x0, 0
loop_start_1:
sw x9, 404(x3)
or x2, x6, x8
or x6, x4, x1
lw x8, 188(x3)
sw x8, 624(x3)
srl x6, x9, x1
lw x4, 736(x3)

# --- Closing Loop 1 (Depth: 1) ---
addi x9, x9, 1
beq x9, x8, loop_exit_1  # Conditional break from loop
blt x9, x1, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---


# --- Starting Loop 2 (Depth: 1, break at 3, max 5) ---
addi x1, x0, 5
addi x7, x0, 3
addi x8, x0, 0
loop_start_2:
lw x1, 528(x3)

# --- Closing Loop 2 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_exit_2  # Conditional break from loop
blt x8, x1, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---

add x2, x7, x7

# --- Starting Loop 3 (Depth: 1, break at 4, max 9) ---
addi x6, x0, 9
addi x7, x0, 4
addi x8, x0, 0
loop_start_3:

# --- Starting Loop 4 (Depth: 2, break at 4, max 10) ---
addi x6, x0, 10
addi x5, x0, 4
addi x2, x0, 0
loop_start_4:

# --- Closing Loop 4 (Depth: 2) ---
addi x2, x2, 1
beq x2, x5, loop_exit_4  # Conditional break from loop
blt x2, x6, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---


# --- Starting Loop 5 (Depth: 2, break at 3, max 6) ---
addi x7, x0, 6
addi x1, x0, 3
addi x5, x0, 0
loop_start_5:
lw x5, 0(x3)
sw x8, 276(x3)
sw x9, 956(x3)

# --- Closing Loop 5 (Depth: 2) ---
addi x5, x5, 1
beq x5, x1, loop_exit_5  # Conditional break from loop
blt x5, x7, loop_start_5 # Branch back to loop start
loop_exit_5: # Define loop exit label
# --- Resuming code after Loop 5 ---

lw x1, 868(x3)

# --- Closing Loop 3 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_exit_3  # Conditional break from loop
blt x8, x6, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---

lw x5, 16(x3)

# --- Starting Loop 6 (Depth: 1, break at 1, max 2) ---
addi x8, x0, 2
addi x1, x0, 1
addi x6, x0, 0
loop_start_6:
sw x6, 416(x3)

# --- Starting Loop 7 (Depth: 2, break at 3, max 8) ---
addi x4, x0, 8
addi x7, x0, 3
addi x5, x0, 0
loop_start_7:

# --- Starting Loop 8 (Depth: 3, break at 1, max 4) ---
addi x7, x0, 4
addi x2, x0, 1
addi x4, x0, 0
loop_start_8:
sw x2, 500(x3)
lw x8, 492(x3)
lw x2, 956(x3)
bne x0, x0, skip_nottaken_1 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_1:
lw x2, 192(x3)

# --- Closing Loop 8 (Depth: 3) ---
addi x4, x4, 1
beq x4, x2, loop_exit_8  # Conditional break from loop
blt x4, x7, loop_start_8 # Branch back to loop start
loop_exit_8: # Define loop exit label
# --- Resuming code after Loop 8 ---


# --- Starting Loop 9 (Depth: 3, break at 5, max 7) ---
addi x6, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_9:
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
loop_start_10:
sw x6, 64(x3)

# --- Closing Loop 10 (Depth: 4) ---
addi x7, x7, 1
beq x7, x8, loop_exit_10  # Conditional break from loop
blt x7, x1, loop_start_10 # Branch back to loop start
loop_exit_10: # Define loop exit label
# --- Resuming code after Loop 10 ---


# --- Closing Loop 9 (Depth: 3) ---
addi x5, x5, 1
beq x5, x4, loop_exit_9  # Conditional break from loop
blt x5, x6, loop_start_9 # Branch back to loop start
loop_exit_9: # Define loop exit label
# --- Resuming code after Loop 9 ---


# --- Starting Loop 11 (Depth: 3, break at 4, max 9) ---
addi x5, x0, 9
addi x4, x0, 4
addi x6, x0, 0
loop_start_11:
sw x6, 304(x3)
add x8, x4, x1
sw x8, 180(x3)

# --- Starting Loop 12 (Depth: 4, break at 1, max 7) ---
addi x8, x0, 7
addi x2, x0, 1
addi x6, x0, 0
loop_start_12:
lw x8, 668(x3)
and x4, x8, x9
srl x7, x8, x9
sw x7, 156(x3)
srl x9, x8, x6
lw x4, 252(x3)
sw x7, 932(x3)
xor x9, x1, x6
lw x9, 932(x3)
lw x8, 484(x3)
and x9, x2, x2
sub x6, x9, x2

# --- Closing Loop 12 (Depth: 4) ---
addi x6, x6, 1
beq x6, x2, loop_exit_12  # Conditional break from loop
blt x6, x8, loop_start_12 # Branch back to loop start
loop_exit_12: # Define loop exit label
# --- Resuming code after Loop 12 ---

sll x4, x6, x7
sw x4, 828(x3)
sw x5, 776(x3)

# --- Closing Loop 11 (Depth: 3) ---
addi x6, x6, 1
beq x6, x4, loop_exit_11  # Conditional break from loop
blt x6, x5, loop_start_11 # Branch back to loop start
loop_exit_11: # Define loop exit label
# --- Resuming code after Loop 11 ---


# --- Starting Loop 13 (Depth: 3, break at 4, max 8) ---
addi x5, x0, 8
addi x8, x0, 4
addi x9, x0, 0
loop_start_13:
lw x7, 24(x3)

# --- Starting Loop 14 (Depth: 4, break at 2, max 10) ---
addi x9, x0, 10
addi x6, x0, 2
addi x1, x0, 0
loop_start_14:
lw x2, 652(x3)
sw x2, 444(x3)
sw x2, 844(x3)
sw x7, 984(x3)
sw x6, 420(x3)

# --- Closing Loop 14 (Depth: 4) ---
addi x1, x1, 1
beq x1, x6, loop_exit_14  # Conditional break from loop
blt x1, x9, loop_start_14 # Branch back to loop start
loop_exit_14: # Define loop exit label
# --- Resuming code after Loop 14 ---

or x5, x8, x6
lw x2, 924(x3)

# --- Closing Loop 13 (Depth: 3) ---
addi x9, x9, 1
beq x9, x8, loop_exit_13  # Conditional break from loop
blt x9, x5, loop_start_13 # Branch back to loop start
loop_exit_13: # Define loop exit label
# --- Resuming code after Loop 13 ---

lw x1, 676(x3)
beq x0, x0, skip_taken_2 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_2:

# --- Starting Loop 15 (Depth: 3, break at 5, max 9) ---
addi x8, x0, 9
addi x6, x0, 5
addi x7, x0, 0
loop_start_15:
bne x0, x0, skip_nottaken_3 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_3:
lw x5, 660(x3)

# --- Starting Loop 16 (Depth: 4, break at 1, max 3) ---
addi x9, x0, 3
addi x2, x0, 1
addi x4, x0, 0
loop_start_16:
sub x8, x2, x1

# --- Starting Loop 17 (Depth: 5, break at 2, max 9) ---
addi x4, x0, 9
addi x5, x0, 2
addi x6, x0, 0
loop_start_17:
lw x4, 500(x3)
xor x4, x6, x8
sw x4, 624(x3)
sw x4, 876(x3)

# --- Closing Loop 17 (Depth: 5) ---
addi x6, x6, 1
beq x6, x5, loop_exit_17  # Conditional break from loop
blt x6, x4, loop_start_17 # Branch back to loop start
loop_exit_17: # Define loop exit label
# --- Resuming code after Loop 17 ---

lw x6, 684(x3)
sw x1, 212(x3)

# --- Closing Loop 16 (Depth: 4) ---
addi x4, x4, 1
beq x4, x2, loop_exit_16  # Conditional break from loop
blt x4, x9, loop_start_16 # Branch back to loop start
loop_exit_16: # Define loop exit label
# --- Resuming code after Loop 16 ---

srl x5, x2, x4

# --- Closing Loop 15 (Depth: 3) ---
addi x7, x7, 1
beq x7, x6, loop_exit_15  # Conditional break from loop
blt x7, x8, loop_start_15 # Branch back to loop start
loop_exit_15: # Define loop exit label
# --- Resuming code after Loop 15 ---

lw x7, 672(x3)

# --- Starting Loop 18 (Depth: 3, break at 2, max 5) ---
addi x2, x0, 5
addi x5, x0, 2
addi x8, x0, 0
loop_start_18:
sll x4, x8, x8
sw x9, 756(x3)

# --- Starting Loop 19 (Depth: 4, break at 4, max 5) ---
addi x4, x0, 5
addi x2, x0, 4
addi x6, x0, 0
loop_start_19:
lw x7, 236(x3)
sll x6, x8, x9
sw x6, 44(x3)
lw x1, 196(x3)
sw x1, 988(x3)

# --- Closing Loop 19 (Depth: 4) ---
addi x6, x6, 1
beq x6, x2, loop_exit_19  # Conditional break from loop
blt x6, x4, loop_start_19 # Branch back to loop start
loop_exit_19: # Define loop exit label
# --- Resuming code after Loop 19 ---

bne x0, x0, skip_nottaken_4 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_4:

# --- Starting Loop 20 (Depth: 4, break at 3, max 9) ---
addi x2, x0, 9
addi x1, x0, 3
addi x4, x0, 0
loop_start_20:
srl x5, x4, x6

# --- Starting Loop 21 (Depth: 5, break at 2, max 8) ---
addi x8, x0, 8
addi x6, x0, 2
addi x7, x0, 0
loop_start_21:
add x9, x5, x8
sub x6, x9, x2

# --- Closing Loop 21 (Depth: 5) ---
addi x7, x7, 1
beq x7, x6, loop_exit_21  # Conditional break from loop
blt x7, x8, loop_start_21 # Branch back to loop start
loop_exit_21: # Define loop exit label
# --- Resuming code after Loop 21 ---


# --- Closing Loop 20 (Depth: 4) ---
addi x4, x4, 1
beq x4, x1, loop_exit_20  # Conditional break from loop
blt x4, x2, loop_start_20 # Branch back to loop start
loop_exit_20: # Define loop exit label
# --- Resuming code after Loop 20 ---

sw x9, 856(x3)
sw x4, 720(x3)

# --- Closing Loop 18 (Depth: 3) ---
addi x8, x8, 1
beq x8, x5, loop_exit_18  # Conditional break from loop
blt x8, x2, loop_start_18 # Branch back to loop start
loop_exit_18: # Define loop exit label
# --- Resuming code after Loop 18 ---


# --- Closing Loop 7 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_exit_7  # Conditional break from loop
blt x5, x4, loop_start_7 # Branch back to loop start
loop_exit_7: # Define loop exit label
# --- Resuming code after Loop 7 ---

xor x4, x9, x1
add x2, x4, x4

# --- Starting Loop 22 (Depth: 2, break at 4, max 7) ---
addi x6, x0, 7
addi x8, x0, 4
addi x9, x0, 0
loop_start_22:
add x5, x7, x4
lw x9, 884(x3)
bne x0, x0, skip_nottaken_5 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_5:
lw x9, 420(x3)
sw x8, 712(x3)
sw x6, 348(x3)
lw x7, 468(x3)
add x2, x7, x6

# --- Starting Loop 23 (Depth: 3, break at 4, max 6) ---
addi x5, x0, 6
addi x6, x0, 4
addi x9, x0, 0
loop_start_23:
lw x5, 760(x3)
sll x4, x5, x1

# --- Starting Loop 24 (Depth: 4, break at 1, max 7) ---
addi x9, x0, 7
addi x5, x0, 1
addi x7, x0, 0
loop_start_24:
sw x8, 804(x3)
lw x7, 136(x3)
and x9, x4, x4
sw x9, 4(x3)
lw x4, 136(x3)
lw x4, 296(x3)
sw x4, 736(x3)

# --- Closing Loop 24 (Depth: 4) ---
addi x7, x7, 1
beq x7, x5, loop_exit_24  # Conditional break from loop
blt x7, x9, loop_start_24 # Branch back to loop start
loop_exit_24: # Define loop exit label
# --- Resuming code after Loop 24 ---

sll x9, x7, x1
add x1, x9, x4

# --- Starting Loop 25 (Depth: 4, break at 3, max 5) ---
addi x9, x0, 5
addi x5, x0, 3
addi x2, x0, 0
loop_start_25:
sub x6, x2, x8
srl x7, x2, x8
sw x7, 500(x3)
sw x5, 844(x3)

# --- Starting Loop 26 (Depth: 5, break at 3, max 5) ---
addi x2, x0, 5
addi x4, x0, 3
addi x9, x0, 0
loop_start_26:
sw x9, 644(x3)
or x9, x4, x7

# --- Closing Loop 26 (Depth: 5) ---
addi x9, x9, 1
beq x9, x4, loop_exit_26  # Conditional break from loop
blt x9, x2, loop_start_26 # Branch back to loop start
loop_exit_26: # Define loop exit label
# --- Resuming code after Loop 26 ---

lw x8, 124(x3)
srl x6, x8, x2
sw x1, 512(x3)
and x8, x1, x1
sw x5, 304(x3)
bne x0, x0, skip_nottaken_6 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_6:

# --- Closing Loop 25 (Depth: 4) ---
addi x2, x2, 1
beq x2, x5, loop_exit_25  # Conditional break from loop
blt x2, x9, loop_start_25 # Branch back to loop start
loop_exit_25: # Define loop exit label
# --- Resuming code after Loop 25 ---

sw x2, 8(x3)
sw x2, 536(x3)
lw x5, 960(x3)
sw x6, 360(x3)
lw x4, 200(x3)
sw x4, 736(x3)
lw x5, 536(x3)
sw x5, 252(x3)
beq x0, x0, skip_taken_7 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_7:

# --- Starting Loop 27 (Depth: 4, break at 2, max 4) ---
addi x1, x0, 4
addi x8, x0, 2
addi x9, x0, 0
loop_start_27:

# --- Closing Loop 27 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_exit_27  # Conditional break from loop
blt x9, x1, loop_start_27 # Branch back to loop start
loop_exit_27: # Define loop exit label
# --- Resuming code after Loop 27 ---

lw x8, 312(x3)
and x1, x6, x4
xor x8, x1, x9
lw x5, 356(x3)
sw x1, 544(x3)
beq x0, x0, skip_taken_8 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_8:
lw x6, 592(x3)
sw x4, 816(x3)

# --- Closing Loop 23 (Depth: 3) ---
addi x9, x9, 1
beq x9, x6, loop_exit_23  # Conditional break from loop
blt x9, x5, loop_start_23 # Branch back to loop start
loop_exit_23: # Define loop exit label
# --- Resuming code after Loop 23 ---

or x5, x8, x8
beq x0, x0, skip_taken_9 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_9:

# --- Starting Loop 28 (Depth: 3, break at 5, max 8) ---
addi x2, x0, 8
addi x9, x0, 5
addi x8, x0, 0
loop_start_28:

# --- Starting Loop 29 (Depth: 4, break at 2, max 5) ---
addi x6, x0, 5
addi x1, x0, 2
addi x2, x0, 0
loop_start_29:
lw x5, 156(x3)
sub x4, x2, x2
sw x1, 980(x3)
beq x0, x0, skip_taken_10 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_10:
sw x2, 728(x3)
lw x1, 336(x3)
sw x1, 88(x3)
srl x9, x6, x1
sll x9, x4, x1
add x4, x9, x2

# --- Closing Loop 29 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_exit_29  # Conditional break from loop
blt x2, x6, loop_start_29 # Branch back to loop start
loop_exit_29: # Define loop exit label
# --- Resuming code after Loop 29 ---

lw x4, 512(x3)

# --- Starting Loop 30 (Depth: 4, break at 1, max 4) ---
addi x5, x0, 4
addi x8, x0, 1
addi x9, x0, 0
loop_start_30:
sw x4, 484(x3)
lw x5, 780(x3)
lw x7, 316(x3)
sw x1, 648(x3)
sw x2, 84(x3)
xor x4, x7, x7

# --- Closing Loop 30 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_exit_30  # Conditional break from loop
blt x9, x5, loop_start_30 # Branch back to loop start
loop_exit_30: # Define loop exit label
# --- Resuming code after Loop 30 ---


# --- Starting Loop 31 (Depth: 4, break at 5, max 6) ---
addi x6, x0, 6
addi x5, x0, 5
addi x2, x0, 0
loop_start_31:
or x2, x2, x1
sw x2, 472(x3)
xor x8, x1, x6
sw x8, 488(x3)

# --- Starting Loop 32 (Depth: 5, break at 1, max 4) ---
addi x7, x0, 4
addi x8, x0, 1
addi x4, x0, 0
loop_start_32:
bne x0, x0, skip_nottaken_11 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_11:
bne x0, x0, skip_nottaken_12 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_12:

# --- Closing Loop 32 (Depth: 5) ---
addi x4, x4, 1
beq x4, x8, loop_exit_32  # Conditional break from loop
blt x4, x7, loop_start_32 # Branch back to loop start
loop_exit_32: # Define loop exit label
# --- Resuming code after Loop 32 ---

sw x4, 692(x3)
lw x1, 4(x3)

# --- Starting Loop 33 (Depth: 5, break at 4, max 7) ---
addi x4, x0, 7
addi x9, x0, 4
addi x7, x0, 0
loop_start_33:
or x4, x5, x8

# --- Closing Loop 33 (Depth: 5) ---
addi x7, x7, 1
beq x7, x9, loop_exit_33  # Conditional break from loop
blt x7, x4, loop_start_33 # Branch back to loop start
loop_exit_33: # Define loop exit label
# --- Resuming code after Loop 33 ---


# --- Starting Loop 34 (Depth: 5, break at 4, max 5) ---
addi x1, x0, 5
addi x9, x0, 4
addi x8, x0, 0
loop_start_34:
bne x0, x0, skip_nottaken_13 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_13:
srl x5, x8, x7
sw x9, 136(x3)
beq x0, x0, skip_taken_14 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_14:

# --- Closing Loop 34 (Depth: 5) ---
addi x8, x8, 1
beq x8, x9, loop_exit_34  # Conditional break from loop
blt x8, x1, loop_start_34 # Branch back to loop start
loop_exit_34: # Define loop exit label
# --- Resuming code after Loop 34 ---


# --- Closing Loop 31 (Depth: 4) ---
addi x2, x2, 1
beq x2, x5, loop_exit_31  # Conditional break from loop
blt x2, x6, loop_start_31 # Branch back to loop start
loop_exit_31: # Define loop exit label
# --- Resuming code after Loop 31 ---

beq x0, x0, skip_taken_15 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_15:
sw x5, 452(x3)
bne x0, x0, skip_nottaken_16 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_16:
sw x9, 392(x3)
beq x0, x0, skip_taken_17 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_17:
xor x1, x9, x4
sll x7, x1, x5
xor x8, x7, x4
lw x6, 820(x3)

# --- Starting Loop 35 (Depth: 4, break at 1, max 9) ---
addi x5, x0, 9
addi x2, x0, 1
addi x7, x0, 0
loop_start_35:

# --- Closing Loop 35 (Depth: 4) ---
addi x7, x7, 1
beq x7, x2, loop_exit_35  # Conditional break from loop
blt x7, x5, loop_start_35 # Branch back to loop start
loop_exit_35: # Define loop exit label
# --- Resuming code after Loop 35 ---

sw x4, 60(x3)
sw x2, 592(x3)
lw x8, 60(x3)
sw x8, 980(x3)

# --- Closing Loop 28 (Depth: 3) ---
addi x8, x8, 1
beq x8, x9, loop_exit_28  # Conditional break from loop
blt x8, x2, loop_start_28 # Branch back to loop start
loop_exit_28: # Define loop exit label
# --- Resuming code after Loop 28 ---

sll x6, x7, x7

# --- Starting Loop 36 (Depth: 3, break at 5, max 10) ---
addi x2, x0, 10
addi x1, x0, 5
addi x9, x0, 0
loop_start_36:
sw x6, 392(x3)
beq x0, x0, skip_taken_18 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_18:
sw x9, 76(x3)
lw x6, 116(x3)
sw x6, 620(x3)

# --- Starting Loop 37 (Depth: 4, break at 5, max 7) ---
addi x7, x0, 7
addi x5, x0, 5
addi x9, x0, 0
loop_start_37:
sub x9, x4, x6
bne x0, x0, skip_nottaken_19 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_19:
sll x8, x9, x4
sw x1, 916(x3)
add x7, x2, x2
sw x8, 948(x3)
lw x7, 916(x3)
lw x2, 240(x3)
srl x6, x9, x8

# --- Starting Loop 38 (Depth: 5, break at 5, max 10) ---
addi x5, x0, 10
addi x2, x0, 5
addi x7, x0, 0
loop_start_38:
beq x0, x0, skip_taken_20 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_20:
sw x7, 972(x3)
sw x1, 404(x3)
sub x8, x2, x7
lw x9, 120(x3)

# --- Closing Loop 38 (Depth: 5) ---
addi x7, x7, 1
beq x7, x2, loop_exit_38  # Conditional break from loop
blt x7, x5, loop_start_38 # Branch back to loop start
loop_exit_38: # Define loop exit label
# --- Resuming code after Loop 38 ---

lw x9, 376(x3)

# --- Closing Loop 37 (Depth: 4) ---
addi x9, x9, 1
beq x9, x5, loop_exit_37  # Conditional break from loop
blt x9, x7, loop_start_37 # Branch back to loop start
loop_exit_37: # Define loop exit label
# --- Resuming code after Loop 37 ---

sw x6, 4(x3)

# --- Closing Loop 36 (Depth: 3) ---
addi x9, x9, 1
beq x9, x1, loop_exit_36  # Conditional break from loop
blt x9, x2, loop_start_36 # Branch back to loop start
loop_exit_36: # Define loop exit label
# --- Resuming code after Loop 36 ---

lw x5, 224(x3)
srl x8, x5, x1

# --- Starting Loop 39 (Depth: 3, break at 2, max 5) ---
addi x1, x0, 5
addi x7, x0, 2
addi x5, x0, 0
loop_start_39:
beq x0, x0, skip_taken_21 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_21:

# --- Closing Loop 39 (Depth: 3) ---
addi x5, x5, 1
beq x5, x7, loop_exit_39  # Conditional break from loop
blt x5, x1, loop_start_39 # Branch back to loop start
loop_exit_39: # Define loop exit label
# --- Resuming code after Loop 39 ---


# --- Closing Loop 22 (Depth: 2) ---
addi x9, x9, 1
beq x9, x8, loop_exit_22  # Conditional break from loop
blt x9, x6, loop_start_22 # Branch back to loop start
loop_exit_22: # Define loop exit label
# --- Resuming code after Loop 22 ---

and x6, x5, x2

# --- Closing Loop 6 (Depth: 1) ---
addi x6, x6, 1
beq x6, x1, loop_exit_6  # Conditional break from loop
blt x6, x8, loop_start_6 # Branch back to loop start
loop_exit_6: # Define loop exit label
# --- Resuming code after Loop 6 ---


# --- Starting Loop 40 (Depth: 1, break at 1, max 2) ---
addi x8, x0, 2
addi x7, x0, 1
addi x4, x0, 0
loop_start_40:

# --- Closing Loop 40 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_exit_40  # Conditional break from loop
blt x4, x8, loop_start_40 # Branch back to loop start
loop_exit_40: # Define loop exit label
# --- Resuming code after Loop 40 ---


# --- Starting Loop 41 (Depth: 1, break at 2, max 8) ---
addi x1, x0, 8
addi x7, x0, 2
addi x9, x0, 0
loop_start_41:

# --- Starting Loop 42 (Depth: 2, break at 3, max 6) ---
addi x4, x0, 6
addi x1, x0, 3
addi x6, x0, 0
loop_start_42:
lw x2, 420(x3)
lw x6, 804(x3)
xor x4, x6, x9

# --- Closing Loop 42 (Depth: 2) ---
addi x6, x6, 1
beq x6, x1, loop_exit_42  # Conditional break from loop
blt x6, x4, loop_start_42 # Branch back to loop start
loop_exit_42: # Define loop exit label
# --- Resuming code after Loop 42 ---

srl x6, x5, x2

# --- Starting Loop 43 (Depth: 2, break at 5, max 10) ---
addi x9, x0, 10
addi x2, x0, 5
addi x8, x0, 0
loop_start_43:
lw x7, 428(x3)
bne x0, x0, skip_nottaken_22 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_22:
add x8, x9, x9

# --- Closing Loop 43 (Depth: 2) ---
addi x8, x8, 1
beq x8, x2, loop_exit_43  # Conditional break from loop
blt x8, x9, loop_start_43 # Branch back to loop start
loop_exit_43: # Define loop exit label
# --- Resuming code after Loop 43 ---

srl x1, x8, x6

# --- Starting Loop 44 (Depth: 2, break at 5, max 7) ---
addi x9, x0, 7
addi x2, x0, 5
addi x5, x0, 0
loop_start_44:
sw x5, 716(x3)

# --- Starting Loop 45 (Depth: 3, break at 3, max 7) ---
addi x2, x0, 7
addi x6, x0, 3
addi x1, x0, 0
loop_start_45:
sw x9, 252(x3)

# --- Starting Loop 46 (Depth: 4, break at 5, max 8) ---
addi x1, x0, 8
addi x5, x0, 5
addi x2, x0, 0
loop_start_46:
xor x1, x2, x6
sw x1, 936(x3)
add x4, x5, x8
beq x0, x0, skip_taken_23 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_23:
sw x1, 116(x3)
lw x6, 160(x3)
sll x8, x6, x6
lw x4, 988(x3)

# --- Closing Loop 46 (Depth: 4) ---
addi x2, x2, 1
beq x2, x5, loop_exit_46  # Conditional break from loop
blt x2, x1, loop_start_46 # Branch back to loop start
loop_exit_46: # Define loop exit label
# --- Resuming code after Loop 46 ---

sw x2, 76(x3)
lw x8, 76(x3)

# --- Closing Loop 45 (Depth: 3) ---
addi x1, x1, 1
beq x1, x6, loop_exit_45  # Conditional break from loop
blt x1, x2, loop_start_45 # Branch back to loop start
loop_exit_45: # Define loop exit label
# --- Resuming code after Loop 45 ---

lw x9, 152(x3)
xor x1, x2, x7

# --- Closing Loop 44 (Depth: 2) ---
addi x5, x5, 1
beq x5, x2, loop_exit_44  # Conditional break from loop
blt x5, x9, loop_start_44 # Branch back to loop start
loop_exit_44: # Define loop exit label
# --- Resuming code after Loop 44 ---

bne x0, x0, skip_nottaken_24 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_24:

# --- Starting Loop 47 (Depth: 2, break at 2, max 5) ---
addi x5, x0, 5
addi x6, x0, 2
addi x2, x0, 0
loop_start_47:

# --- Closing Loop 47 (Depth: 2) ---
addi x2, x2, 1
beq x2, x6, loop_exit_47  # Conditional break from loop
blt x2, x5, loop_start_47 # Branch back to loop start
loop_exit_47: # Define loop exit label
# --- Resuming code after Loop 47 ---

and x5, x7, x6
bne x0, x0, skip_nottaken_25 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_25:
lw x4, 976(x3)
xor x6, x4, x5
bne x0, x0, skip_nottaken_26 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_26:
sw x6, 920(x3)

# --- Closing Loop 41 (Depth: 1) ---
addi x9, x9, 1
beq x9, x7, loop_exit_41  # Conditional break from loop
blt x9, x1, loop_start_41 # Branch back to loop start
loop_exit_41: # Define loop exit label
# --- Resuming code after Loop 41 ---


# --- Starting Loop 48 (Depth: 1, break at 3, max 10) ---
addi x4, x0, 10
addi x5, x0, 3
addi x2, x0, 0
loop_start_48:
lw x7, 216(x3)

# --- Starting Loop 49 (Depth: 2, break at 4, max 8) ---
addi x8, x0, 8
addi x2, x0, 4
addi x1, x0, 0
loop_start_49:
sw x7, 492(x3)
lw x8, 184(x3)
sw x8, 864(x3)

# --- Closing Loop 49 (Depth: 2) ---
addi x1, x1, 1
beq x1, x2, loop_exit_49  # Conditional break from loop
blt x1, x8, loop_start_49 # Branch back to loop start
loop_exit_49: # Define loop exit label
# --- Resuming code after Loop 49 ---

and x5, x6, x6
beq x0, x0, skip_taken_27 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_27:
lw x1, 376(x3)

# --- Starting Loop 50 (Depth: 2, break at 2, max 5) ---
addi x6, x0, 5
addi x8, x0, 2
addi x2, x0, 0
loop_start_50:
or x5, x4, x7

# --- Closing Loop 50 (Depth: 2) ---
addi x2, x2, 1
beq x2, x8, loop_exit_50  # Conditional break from loop
blt x2, x6, loop_start_50 # Branch back to loop start
loop_exit_50: # Define loop exit label
# --- Resuming code after Loop 50 ---

lw x9, 600(x3)

# --- Starting Loop 51 (Depth: 2, break at 1, max 7) ---
addi x8, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_51:

# --- Starting Loop 52 (Depth: 3, break at 2, max 6) ---
addi x8, x0, 6
addi x5, x0, 2
addi x1, x0, 0
loop_start_52:
sw x1, 724(x3)
bne x0, x0, skip_nottaken_28 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_28:
bne x0, x0, skip_nottaken_29 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_29:
bne x0, x0, skip_nottaken_30 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_30:
bne x0, x0, skip_nottaken_31 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_31:
beq x0, x0, skip_taken_32 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_32:
sub x1, x9, x8
sw x9, 528(x3)

# --- Closing Loop 52 (Depth: 3) ---
addi x1, x1, 1
beq x1, x5, loop_exit_52  # Conditional break from loop
blt x1, x8, loop_start_52 # Branch back to loop start
loop_exit_52: # Define loop exit label
# --- Resuming code after Loop 52 ---

srl x6, x4, x1
lw x8, 960(x3)

# --- Starting Loop 53 (Depth: 3, break at 3, max 9) ---
addi x1, x0, 9
addi x6, x0, 3
addi x7, x0, 0
loop_start_53:
add x6, x7, x9
sw x7, 16(x3)
sw x2, 268(x3)
sw x1, 184(x3)
srl x6, x9, x1
beq x0, x0, skip_taken_33 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_33:
lw x4, 596(x3)
beq x0, x0, skip_taken_34 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_34:

# --- Starting Loop 54 (Depth: 4, break at 5, max 7) ---
addi x8, x0, 7
addi x7, x0, 5
addi x2, x0, 0
loop_start_54:
and x8, x2, x1
and x5, x8, x9
lw x7, 424(x3)
lw x2, 920(x3)
sw x4, 940(x3)
lw x8, 68(x3)
lw x9, 936(x3)

# --- Closing Loop 54 (Depth: 4) ---
addi x2, x2, 1
beq x2, x7, loop_exit_54  # Conditional break from loop
blt x2, x8, loop_start_54 # Branch back to loop start
loop_exit_54: # Define loop exit label
# --- Resuming code after Loop 54 ---


# --- Starting Loop 55 (Depth: 4, break at 1, max 3) ---
addi x2, x0, 3
addi x8, x0, 1
addi x6, x0, 0
loop_start_55:
sw x6, 788(x3)
lw x1, 620(x3)
lw x4, 140(x3)
lw x8, 564(x3)
srl x8, x5, x9
lw x2, 560(x3)
sub x5, x2, x2

# --- Closing Loop 55 (Depth: 4) ---
addi x6, x6, 1
beq x6, x8, loop_exit_55  # Conditional break from loop
blt x6, x2, loop_start_55 # Branch back to loop start
loop_exit_55: # Define loop exit label
# --- Resuming code after Loop 55 ---

lw x8, 316(x3)

# --- Starting Loop 56 (Depth: 4, break at 2, max 4) ---
addi x5, x0, 4
addi x1, x0, 2
addi x4, x0, 0
loop_start_56:
lw x5, 564(x3)

# --- Closing Loop 56 (Depth: 4) ---
addi x4, x4, 1
beq x4, x1, loop_exit_56  # Conditional break from loop
blt x4, x5, loop_start_56 # Branch back to loop start
loop_exit_56: # Define loop exit label
# --- Resuming code after Loop 56 ---

lw x4, 276(x3)
and x1, x5, x5
bne x0, x0, skip_nottaken_35 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_35:
and x9, x5, x6
bne x0, x0, skip_nottaken_36 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_36:
lw x2, 416(x3)
sub x6, x5, x9
add x7, x1, x1
lw x1, 848(x3)

# --- Closing Loop 53 (Depth: 3) ---
addi x7, x7, 1
beq x7, x6, loop_exit_53  # Conditional break from loop
blt x7, x1, loop_start_53 # Branch back to loop start
loop_exit_53: # Define loop exit label
# --- Resuming code after Loop 53 ---

sw x8, 552(x3)
srl x6, x1, x7

# --- Closing Loop 51 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_51  # Conditional break from loop
blt x6, x8, loop_start_51 # Branch back to loop start
loop_exit_51: # Define loop exit label
# --- Resuming code after Loop 51 ---


# --- Starting Loop 57 (Depth: 2, break at 3, max 6) ---
addi x4, x0, 6
addi x9, x0, 3
addi x2, x0, 0
loop_start_57:
xor x2, x1, x7

# --- Starting Loop 58 (Depth: 3, break at 2, max 3) ---
addi x8, x0, 3
addi x1, x0, 2
addi x6, x0, 0
loop_start_58:
lw x9, 344(x3)
xor x2, x9, x6
srl x9, x2, x2
sw x5, 800(x3)
lw x2, 1000(x3)
sw x4, 672(x3)
sub x9, x6, x1
lw x6, 316(x3)
sub x9, x4, x2
srl x8, x7, x2
bne x0, x0, skip_nottaken_37 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_37:

# --- Closing Loop 58 (Depth: 3) ---
addi x6, x6, 1
beq x6, x1, loop_exit_58  # Conditional break from loop
blt x6, x8, loop_start_58 # Branch back to loop start
loop_exit_58: # Define loop exit label
# --- Resuming code after Loop 58 ---

sw x8, 280(x3)
lw x6, 48(x3)

# --- Closing Loop 57 (Depth: 2) ---
addi x2, x2, 1
beq x2, x9, loop_exit_57  # Conditional break from loop
blt x2, x4, loop_start_57 # Branch back to loop start
loop_exit_57: # Define loop exit label
# --- Resuming code after Loop 57 ---


# --- Closing Loop 48 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_exit_48  # Conditional break from loop
blt x2, x4, loop_start_48 # Branch back to loop start
loop_exit_48: # Define loop exit label
# --- Resuming code after Loop 48 ---


# --- Starting Loop 59 (Depth: 1, break at 4, max 5) ---
addi x8, x0, 5
addi x2, x0, 4
addi x9, x0, 0
loop_start_59:
lw x1, 204(x3)
add x4, x1, x8

# --- Starting Loop 60 (Depth: 2, break at 3, max 7) ---
addi x2, x0, 7
addi x6, x0, 3
addi x5, x0, 0
loop_start_60:
lw x2, 620(x3)
xor x7, x2, x8

# --- Starting Loop 61 (Depth: 3, break at 5, max 8) ---
addi x6, x0, 8
addi x8, x0, 5
addi x4, x0, 0
loop_start_61:

# --- Starting Loop 62 (Depth: 4, break at 5, max 8) ---
addi x1, x0, 8
addi x9, x0, 5
addi x8, x0, 0
loop_start_62:

# --- Starting Loop 63 (Depth: 5, break at 5, max 10) ---
addi x7, x0, 10
addi x4, x0, 5
addi x2, x0, 0
loop_start_63:
sw x2, 28(x3)
sw x6, 632(x3)

# --- Closing Loop 63 (Depth: 5) ---
addi x2, x2, 1
beq x2, x4, loop_exit_63  # Conditional break from loop
blt x2, x7, loop_start_63 # Branch back to loop start
loop_exit_63: # Define loop exit label
# --- Resuming code after Loop 63 ---

sll x6, x1, x9
xor x4, x6, x5
sw x9, 832(x3)
lw x5, 88(x3)
lw x2, 556(x3)
sw x2, 724(x3)
sw x2, 632(x3)
lw x9, 812(x3)
lw x8, 68(x3)
bne x0, x0, skip_nottaken_38 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_38:
sw x8, 172(x3)

# --- Starting Loop 64 (Depth: 5, break at 2, max 3) ---
addi x9, x0, 3
addi x5, x0, 2
addi x2, x0, 0
loop_start_64:
lw x8, 972(x3)

# --- Closing Loop 64 (Depth: 5) ---
addi x2, x2, 1
beq x2, x5, loop_exit_64  # Conditional break from loop
blt x2, x9, loop_start_64 # Branch back to loop start
loop_exit_64: # Define loop exit label
# --- Resuming code after Loop 64 ---

lw x6, 260(x3)
sw x6, 380(x3)
or x6, x1, x7

# --- Closing Loop 62 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_exit_62  # Conditional break from loop
blt x8, x1, loop_start_62 # Branch back to loop start
loop_exit_62: # Define loop exit label
# --- Resuming code after Loop 62 ---


# --- Closing Loop 61 (Depth: 3) ---
addi x4, x4, 1
beq x4, x8, loop_exit_61  # Conditional break from loop
blt x4, x6, loop_start_61 # Branch back to loop start
loop_exit_61: # Define loop exit label
# --- Resuming code after Loop 61 ---


# --- Closing Loop 60 (Depth: 2) ---
addi x5, x5, 1
beq x5, x6, loop_exit_60  # Conditional break from loop
blt x5, x2, loop_start_60 # Branch back to loop start
loop_exit_60: # Define loop exit label
# --- Resuming code after Loop 60 ---


# --- Closing Loop 59 (Depth: 1) ---
addi x9, x9, 1
beq x9, x2, loop_exit_59  # Conditional break from loop
blt x9, x8, loop_start_59 # Branch back to loop start
loop_exit_59: # Define loop exit label
# --- Resuming code after Loop 59 ---

and x8, x6, x2
and x9, x8, x2
sll x8, x6, x6
sw x8, 976(x3)
beq x0, x0, skip_taken_39 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_39:

# --- Starting Loop 65 (Depth: 1, break at 2, max 6) ---
addi x2, x0, 6
addi x8, x0, 2
addi x1, x0, 0
loop_start_65:
xor x9, x1, x1

# --- Starting Loop 66 (Depth: 2, break at 4, max 10) ---
addi x5, x0, 10
addi x2, x0, 4
addi x8, x0, 0
loop_start_66:
sw x5, 912(x3)
sw x7, 756(x3)
lw x7, 148(x3)
lw x5, 356(x3)
sw x1, 976(x3)
sw x7, 408(x3)

# --- Starting Loop 67 (Depth: 3, break at 4, max 5) ---
addi x2, x0, 5
addi x7, x0, 4
addi x8, x0, 0
loop_start_67:
add x8, x5, x7
lw x1, 396(x3)
add x7, x5, x6
sll x1, x4, x4
sw x1, 316(x3)
xor x2, x8, x6
sw x1, 60(x3)

# --- Starting Loop 68 (Depth: 4, break at 2, max 5) ---
addi x2, x0, 5
addi x4, x0, 2
addi x9, x0, 0
loop_start_68:

# --- Closing Loop 68 (Depth: 4) ---
addi x9, x9, 1
beq x9, x4, loop_exit_68  # Conditional break from loop
blt x9, x2, loop_start_68 # Branch back to loop start
loop_exit_68: # Define loop exit label
# --- Resuming code after Loop 68 ---

or x9, x8, x4
lw x7, 660(x3)

# --- Starting Loop 69 (Depth: 4, break at 2, max 7) ---
addi x4, x0, 7
addi x5, x0, 2
addi x6, x0, 0
loop_start_69:
sw x1, 264(x3)

# --- Starting Loop 70 (Depth: 5, break at 5, max 8) ---
addi x1, x0, 8
addi x7, x0, 5
addi x6, x0, 0
loop_start_70:

# --- Closing Loop 70 (Depth: 5) ---
addi x6, x6, 1
beq x6, x7, loop_exit_70  # Conditional break from loop
blt x6, x1, loop_start_70 # Branch back to loop start
loop_exit_70: # Define loop exit label
# --- Resuming code after Loop 70 ---

sw x6, 360(x3)
sw x4, 0(x3)
beq x0, x0, skip_taken_40 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_40:
and x5, x1, x1
sll x2, x5, x9
lw x8, 680(x3)

# --- Closing Loop 69 (Depth: 4) ---
addi x6, x6, 1
beq x6, x5, loop_exit_69  # Conditional break from loop
blt x6, x4, loop_start_69 # Branch back to loop start
loop_exit_69: # Define loop exit label
# --- Resuming code after Loop 69 ---


# --- Starting Loop 71 (Depth: 4, break at 1, max 7) ---
addi x9, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_71:
sw x6, 144(x3)

# --- Starting Loop 72 (Depth: 5, break at 2, max 4) ---
addi x7, x0, 4
addi x5, x0, 2
addi x8, x0, 0
loop_start_72:

# --- Closing Loop 72 (Depth: 5) ---
addi x8, x8, 1
beq x8, x5, loop_exit_72  # Conditional break from loop
blt x8, x7, loop_start_72 # Branch back to loop start
loop_exit_72: # Define loop exit label
# --- Resuming code after Loop 72 ---

add x6, x8, x7
lw x1, 116(x3)
sw x6, 964(x3)
sw x9, 216(x3)
and x4, x9, x2
srl x4, x4, x2
or x7, x6, x5
lw x2, 692(x3)
sw x2, 704(x3)
sw x7, 448(x3)
lw x8, 504(x3)

# --- Closing Loop 71 (Depth: 4) ---
addi x6, x6, 1
beq x6, x4, loop_exit_71  # Conditional break from loop
blt x6, x9, loop_start_71 # Branch back to loop start
loop_exit_71: # Define loop exit label
# --- Resuming code after Loop 71 ---


# --- Starting Loop 73 (Depth: 4, break at 5, max 8) ---
addi x2, x0, 8
addi x4, x0, 5
addi x9, x0, 0
loop_start_73:
sw x9, 836(x3)
lw x2, 872(x3)

# --- Starting Loop 74 (Depth: 5, break at 2, max 8) ---
addi x4, x0, 8
addi x7, x0, 2
addi x8, x0, 0
loop_start_74:
sw x2, 160(x3)
sw x1, 236(x3)
sw x8, 984(x3)
add x2, x1, x4
lw x8, 536(x3)
sw x2, 904(x3)
lw x9, 532(x3)
sw x9, 48(x3)
lw x6, 552(x3)
lw x2, 516(x3)
sw x2, 36(x3)

# --- Closing Loop 74 (Depth: 5) ---
addi x8, x8, 1
beq x8, x7, loop_exit_74  # Conditional break from loop
blt x8, x4, loop_start_74 # Branch back to loop start
loop_exit_74: # Define loop exit label
# --- Resuming code after Loop 74 ---


# --- Starting Loop 75 (Depth: 5, break at 3, max 5) ---
addi x8, x0, 5
addi x9, x0, 3
addi x4, x0, 0
loop_start_75:
lw x8, 792(x3)
sw x2, 312(x3)
lw x1, 488(x3)

# --- Closing Loop 75 (Depth: 5) ---
addi x4, x4, 1
beq x4, x9, loop_exit_75  # Conditional break from loop
blt x4, x8, loop_start_75 # Branch back to loop start
loop_exit_75: # Define loop exit label
# --- Resuming code after Loop 75 ---

add x6, x1, x4
add x5, x8, x4
xor x4, x5, x8
beq x0, x0, skip_taken_41 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_41:
sw x5, 296(x3)
sw x5, 564(x3)
sw x8, 828(x3)
sw x4, 256(x3)
sw x8, 480(x3)
lw x2, 388(x3)

# --- Closing Loop 73 (Depth: 4) ---
addi x9, x9, 1
beq x9, x4, loop_exit_73  # Conditional break from loop
blt x9, x2, loop_start_73 # Branch back to loop start
loop_exit_73: # Define loop exit label
# --- Resuming code after Loop 73 ---

sw x4, 796(x3)
sub x5, x2, x1
bne x0, x0, skip_nottaken_42 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_42:
sw x5, 952(x3)
xor x6, x9, x2
bne x0, x0, skip_nottaken_43 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_43:

# --- Closing Loop 67 (Depth: 3) ---
addi x8, x8, 1
beq x8, x7, loop_exit_67  # Conditional break from loop
blt x8, x2, loop_start_67 # Branch back to loop start
loop_exit_67: # Define loop exit label
# --- Resuming code after Loop 67 ---


# --- Closing Loop 66 (Depth: 2) ---
addi x8, x8, 1
beq x8, x2, loop_exit_66  # Conditional break from loop
blt x8, x5, loop_start_66 # Branch back to loop start
loop_exit_66: # Define loop exit label
# --- Resuming code after Loop 66 ---

beq x0, x0, skip_taken_44 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_44:

# --- Starting Loop 76 (Depth: 2, break at 4, max 6) ---
addi x1, x0, 6
addi x8, x0, 4
addi x5, x0, 0
loop_start_76:
or x9, x5, x5
lw x2, 604(x3)
sw x6, 896(x3)
sub x1, x5, x8

# --- Starting Loop 77 (Depth: 3, break at 4, max 6) ---
addi x6, x0, 6
addi x5, x0, 4
addi x9, x0, 0
loop_start_77:
lw x6, 464(x3)
sub x2, x1, x9
bne x0, x0, skip_nottaken_45 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_45:

# --- Starting Loop 78 (Depth: 4, break at 1, max 7) ---
addi x5, x0, 7
addi x9, x0, 1
addi x8, x0, 0
loop_start_78:
lw x2, 960(x3)
sw x4, 392(x3)
lw x4, 772(x3)

# --- Closing Loop 78 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_exit_78  # Conditional break from loop
blt x8, x5, loop_start_78 # Branch back to loop start
loop_exit_78: # Define loop exit label
# --- Resuming code after Loop 78 ---

or x7, x1, x8
sll x4, x7, x1
sw x8, 996(x3)
or x9, x4, x6

# --- Closing Loop 77 (Depth: 3) ---
addi x9, x9, 1
beq x9, x5, loop_exit_77  # Conditional break from loop
blt x9, x6, loop_start_77 # Branch back to loop start
loop_exit_77: # Define loop exit label
# --- Resuming code after Loop 77 ---

lw x7, 724(x3)
sw x7, 116(x3)
bne x0, x0, skip_nottaken_46 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_46:
add x6, x1, x1
add x7, x4, x5
beq x0, x0, skip_taken_47 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_47:

# --- Closing Loop 76 (Depth: 2) ---
addi x5, x5, 1
beq x5, x8, loop_exit_76  # Conditional break from loop
blt x5, x1, loop_start_76 # Branch back to loop start
loop_exit_76: # Define loop exit label
# --- Resuming code after Loop 76 ---


# --- Starting Loop 79 (Depth: 2, break at 3, max 4) ---
addi x2, x0, 4
addi x4, x0, 3
addi x9, x0, 0
loop_start_79:

# --- Starting Loop 80 (Depth: 3, break at 2, max 5) ---
addi x1, x0, 5
addi x4, x0, 2
addi x8, x0, 0
loop_start_80:
sw x8, 712(x3)
sw x7, 424(x3)
sll x2, x8, x6
sw x1, 464(x3)
lw x5, 756(x3)
bne x0, x0, skip_nottaken_48 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_48:
sw x5, 296(x3)
beq x0, x0, skip_taken_49 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_49:
bne x0, x0, skip_nottaken_50 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_50:
bne x0, x0, skip_nottaken_51 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_51:
sw x6, 960(x3)
lw x1, 884(x3)
sw x2, 548(x3)

# --- Closing Loop 80 (Depth: 3) ---
addi x8, x8, 1
beq x8, x4, loop_exit_80  # Conditional break from loop
blt x8, x1, loop_start_80 # Branch back to loop start
loop_exit_80: # Define loop exit label
# --- Resuming code after Loop 80 ---

bne x0, x0, skip_nottaken_52 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_52:

# --- Closing Loop 79 (Depth: 2) ---
addi x9, x9, 1
beq x9, x4, loop_exit_79  # Conditional break from loop
blt x9, x2, loop_start_79 # Branch back to loop start
loop_exit_79: # Define loop exit label
# --- Resuming code after Loop 79 ---

sw x5, 400(x3)
add x4, x7, x1
sw x4, 304(x3)

# --- Starting Loop 81 (Depth: 2, break at 2, max 9) ---
addi x2, x0, 9
addi x4, x0, 2
addi x8, x0, 0
loop_start_81:
sub x9, x8, x1

# --- Closing Loop 81 (Depth: 2) ---
addi x8, x8, 1
beq x8, x4, loop_exit_81  # Conditional break from loop
blt x8, x2, loop_start_81 # Branch back to loop start
loop_exit_81: # Define loop exit label
# --- Resuming code after Loop 81 ---

sub x1, x9, x2

# --- Starting Loop 82 (Depth: 2, break at 2, max 4) ---
addi x5, x0, 4
addi x2, x0, 2
addi x9, x0, 0
loop_start_82:

# --- Closing Loop 82 (Depth: 2) ---
addi x9, x9, 1
beq x9, x2, loop_exit_82  # Conditional break from loop
blt x9, x5, loop_start_82 # Branch back to loop start
loop_exit_82: # Define loop exit label
# --- Resuming code after Loop 82 ---


# --- Starting Loop 83 (Depth: 2, break at 5, max 8) ---
addi x8, x0, 8
addi x7, x0, 5
addi x6, x0, 0
loop_start_83:

# --- Starting Loop 84 (Depth: 3, break at 2, max 5) ---
addi x4, x0, 5
addi x7, x0, 2
addi x1, x0, 0
loop_start_84:
and x5, x2, x7
lw x8, 512(x3)

# --- Closing Loop 84 (Depth: 3) ---
addi x1, x1, 1
beq x1, x7, loop_exit_84  # Conditional break from loop
blt x1, x4, loop_start_84 # Branch back to loop start
loop_exit_84: # Define loop exit label
# --- Resuming code after Loop 84 ---

sw x8, 588(x3)
and x9, x4, x7
or x1, x9, x2

# --- Closing Loop 83 (Depth: 2) ---
addi x6, x6, 1
beq x6, x7, loop_exit_83  # Conditional break from loop
blt x6, x8, loop_start_83 # Branch back to loop start
loop_exit_83: # Define loop exit label
# --- Resuming code after Loop 83 ---


# --- Starting Loop 85 (Depth: 2, break at 4, max 6) ---
addi x4, x0, 6
addi x6, x0, 4
addi x5, x0, 0
loop_start_85:
sw x4, 820(x3)
lw x1, 956(x3)

# --- Closing Loop 85 (Depth: 2) ---
addi x5, x5, 1
beq x5, x6, loop_exit_85  # Conditional break from loop
blt x5, x4, loop_start_85 # Branch back to loop start
loop_exit_85: # Define loop exit label
# --- Resuming code after Loop 85 ---

srl x7, x4, x6
lw x9, 36(x3)
srl x7, x9, x5
add x2, x1, x5

# --- Starting Loop 86 (Depth: 2, break at 2, max 10) ---
addi x8, x0, 10
addi x6, x0, 2
addi x4, x0, 0
loop_start_86:

# --- Closing Loop 86 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_exit_86  # Conditional break from loop
blt x4, x8, loop_start_86 # Branch back to loop start
loop_exit_86: # Define loop exit label
# --- Resuming code after Loop 86 ---

lw x1, 720(x3)

# --- Closing Loop 65 (Depth: 1) ---
addi x1, x1, 1
beq x1, x8, loop_exit_65  # Conditional break from loop
blt x1, x2, loop_start_65 # Branch back to loop start
loop_exit_65: # Define loop exit label
# --- Resuming code after Loop 65 ---


# --- Starting Loop 87 (Depth: 1, break at 1, max 10) ---
addi x2, x0, 10
addi x7, x0, 1
addi x9, x0, 0
loop_start_87:

# --- Starting Loop 88 (Depth: 2, break at 2, max 6) ---
addi x1, x0, 6
addi x8, x0, 2
addi x6, x0, 0
loop_start_88:

# --- Starting Loop 89 (Depth: 3, break at 1, max 8) ---
addi x5, x0, 8
addi x1, x0, 1
addi x2, x0, 0
loop_start_89:
lw x5, 696(x3)
sub x8, x5, x2
sw x8, 536(x3)
lw x9, 172(x3)
lw x4, 804(x3)

# --- Starting Loop 90 (Depth: 4, break at 2, max 7) ---
addi x7, x0, 7
addi x8, x0, 2
addi x5, x0, 0
loop_start_90:
lw x4, 796(x3)
sw x8, 772(x3)
bne x0, x0, skip_nottaken_53 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_53:
and x2, x6, x5
xor x7, x2, x4
lw x5, 336(x3)

# --- Closing Loop 90 (Depth: 4) ---
addi x5, x5, 1
beq x5, x8, loop_exit_90  # Conditional break from loop
blt x5, x7, loop_start_90 # Branch back to loop start
loop_exit_90: # Define loop exit label
# --- Resuming code after Loop 90 ---

sll x5, x5, x9
and x9, x8, x8
lw x6, 832(x3)
sw x6, 340(x3)

# --- Closing Loop 89 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_exit_89  # Conditional break from loop
blt x2, x5, loop_start_89 # Branch back to loop start
loop_exit_89: # Define loop exit label
# --- Resuming code after Loop 89 ---


# --- Starting Loop 91 (Depth: 3, break at 1, max 6) ---
addi x1, x0, 6
addi x4, x0, 1
addi x2, x0, 0
loop_start_91:
sw x2, 464(x3)
sw x8, 916(x3)
sw x6, 156(x3)
sw x1, 716(x3)

# --- Closing Loop 91 (Depth: 3) ---
addi x2, x2, 1
beq x2, x4, loop_exit_91  # Conditional break from loop
blt x2, x1, loop_start_91 # Branch back to loop start
loop_exit_91: # Define loop exit label
# --- Resuming code after Loop 91 ---

bne x0, x0, skip_nottaken_54 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_54:
sw x9, 84(x3)

# --- Starting Loop 92 (Depth: 3, break at 2, max 9) ---
addi x7, x0, 9
addi x6, x0, 2
addi x4, x0, 0
loop_start_92:
sub x4, x7, x5

# --- Starting Loop 93 (Depth: 4, break at 5, max 8) ---
addi x1, x0, 8
addi x5, x0, 5
addi x2, x0, 0
loop_start_93:
and x8, x6, x1
or x5, x6, x1

# --- Closing Loop 93 (Depth: 4) ---
addi x2, x2, 1
beq x2, x5, loop_exit_93  # Conditional break from loop
blt x2, x1, loop_start_93 # Branch back to loop start
loop_exit_93: # Define loop exit label
# --- Resuming code after Loop 93 ---


# --- Starting Loop 94 (Depth: 4, break at 4, max 6) ---
addi x7, x0, 6
addi x2, x0, 4
addi x1, x0, 0
loop_start_94:

# --- Closing Loop 94 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_exit_94  # Conditional break from loop
blt x1, x7, loop_start_94 # Branch back to loop start
loop_exit_94: # Define loop exit label
# --- Resuming code after Loop 94 ---

lw x7, 844(x3)
lw x2, 680(x3)
sw x2, 768(x3)
sw x9, 480(x3)

# --- Closing Loop 92 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_exit_92  # Conditional break from loop
blt x4, x7, loop_start_92 # Branch back to loop start
loop_exit_92: # Define loop exit label
# --- Resuming code after Loop 92 ---

lw x9, 292(x3)
beq x0, x0, skip_taken_55 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_55:

# --- Starting Loop 95 (Depth: 3, break at 3, max 10) ---
addi x1, x0, 10
addi x4, x0, 3
addi x8, x0, 0
loop_start_95:
sw x4, 192(x3)
sub x6, x8, x1
sw x4, 788(x3)
sw x1, 996(x3)
lw x5, 868(x3)

# --- Closing Loop 95 (Depth: 3) ---
addi x8, x8, 1
beq x8, x4, loop_exit_95  # Conditional break from loop
blt x8, x1, loop_start_95 # Branch back to loop start
loop_exit_95: # Define loop exit label
# --- Resuming code after Loop 95 ---

sw x5, 540(x3)

# --- Starting Loop 96 (Depth: 3, break at 1, max 8) ---
addi x9, x0, 8
addi x7, x0, 1
addi x4, x0, 0
loop_start_96:
and x4, x7, x9
sw x4, 936(x3)
srl x4, x6, x6

# --- Starting Loop 97 (Depth: 4, break at 4, max 6) ---
addi x7, x0, 6
addi x8, x0, 4
addi x1, x0, 0
loop_start_97:
lw x8, 776(x3)
lw x6, 64(x3)
lw x9, 672(x3)

# --- Closing Loop 97 (Depth: 4) ---
addi x1, x1, 1
beq x1, x8, loop_exit_97  # Conditional break from loop
blt x1, x7, loop_start_97 # Branch back to loop start
loop_exit_97: # Define loop exit label
# --- Resuming code after Loop 97 ---

lw x1, 520(x3)
lw x9, 72(x3)

# --- Starting Loop 98 (Depth: 4, break at 2, max 7) ---
addi x4, x0, 7
addi x8, x0, 2
addi x5, x0, 0
loop_start_98:
sub x5, x6, x7
sub x8, x5, x2

# --- Starting Loop 99 (Depth: 5, break at 2, max 9) ---
addi x9, x0, 9
addi x5, x0, 2
addi x1, x0, 0
loop_start_99:
sw x1, 404(x3)
sw x2, 440(x3)
sw x5, 652(x3)
sll x7, x1, x1
sw x7, 656(x3)

# --- Closing Loop 99 (Depth: 5) ---
addi x1, x1, 1
beq x1, x5, loop_exit_99  # Conditional break from loop
blt x1, x9, loop_start_99 # Branch back to loop start
loop_exit_99: # Define loop exit label
# --- Resuming code after Loop 99 ---

bne x0, x0, skip_nottaken_56 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_56:
sw x7, 916(x3)
sll x1, x7, x4
sw x1, 188(x3)
lw x6, 60(x3)
lw x2, 816(x3)
beq x0, x0, skip_taken_57 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_57:
bne x0, x0, skip_nottaken_58 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_58:
sw x2, 596(x3)
lw x6, 332(x3)
and x2, x5, x8

# --- Closing Loop 98 (Depth: 4) ---
addi x5, x5, 1
beq x5, x8, loop_exit_98  # Conditional break from loop
blt x5, x4, loop_start_98 # Branch back to loop start
loop_exit_98: # Define loop exit label
# --- Resuming code after Loop 98 ---

beq x0, x0, skip_taken_59 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_59:

# --- Closing Loop 96 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_exit_96  # Conditional break from loop
blt x4, x9, loop_start_96 # Branch back to loop start
loop_exit_96: # Define loop exit label
# --- Resuming code after Loop 96 ---


# --- Starting Loop 100 (Depth: 3, break at 3, max 4) ---
addi x4, x0, 4
addi x7, x0, 3
addi x6, x0, 0
loop_start_100:

# --- Closing Loop 100 (Depth: 3) ---
addi x6, x6, 1
beq x6, x7, loop_exit_100  # Conditional break from loop
blt x6, x4, loop_start_100 # Branch back to loop start
loop_exit_100: # Define loop exit label
# --- Resuming code after Loop 100 ---

sw x4, 124(x3)
sw x1, 832(x3)
lw x4, 596(x3)

# --- Starting Loop 101 (Depth: 3, break at 4, max 10) ---
addi x6, x0, 10
addi x5, x0, 4
addi x2, x0, 0
loop_start_101:

# --- Closing Loop 101 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_exit_101  # Conditional break from loop
blt x2, x6, loop_start_101 # Branch back to loop start
loop_exit_101: # Define loop exit label
# --- Resuming code after Loop 101 ---


# --- Closing Loop 88 (Depth: 2) ---
addi x6, x6, 1
beq x6, x8, loop_exit_88  # Conditional break from loop
blt x6, x1, loop_start_88 # Branch back to loop start
loop_exit_88: # Define loop exit label
# --- Resuming code after Loop 88 ---

sub x7, x6, x9
xor x9, x7, x6
xor x7, x9, x2

# --- Starting Loop 102 (Depth: 2, break at 4, max 10) ---
addi x8, x0, 10
addi x5, x0, 4
addi x6, x0, 0
loop_start_102:
sub x5, x6, x6

# --- Starting Loop 103 (Depth: 3, break at 1, max 10) ---
addi x8, x0, 10
addi x9, x0, 1
addi x2, x0, 0
loop_start_103:
beq x0, x0, skip_taken_60 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_60:
lw x9, 208(x3)

# --- Closing Loop 103 (Depth: 3) ---
addi x2, x2, 1
beq x2, x9, loop_exit_103  # Conditional break from loop
blt x2, x8, loop_start_103 # Branch back to loop start
loop_exit_103: # Define loop exit label
# --- Resuming code after Loop 103 ---


# --- Starting Loop 104 (Depth: 3, break at 1, max 9) ---
addi x5, x0, 9
addi x8, x0, 1
addi x4, x0, 0
loop_start_104:
lw x5, 636(x3)
lw x6, 736(x3)
sw x6, 832(x3)
xor x8, x4, x9
bne x0, x0, skip_nottaken_61 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_61:
sw x8, 336(x3)
lw x7, 784(x3)
lw x8, 792(x3)

# --- Starting Loop 105 (Depth: 4, break at 1, max 8) ---
addi x9, x0, 8
addi x1, x0, 1
addi x2, x0, 0
loop_start_105:
sw x2, 664(x3)
sub x7, x1, x6
sll x5, x8, x8

# --- Closing Loop 105 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_exit_105  # Conditional break from loop
blt x2, x9, loop_start_105 # Branch back to loop start
loop_exit_105: # Define loop exit label
# --- Resuming code after Loop 105 ---

and x7, x8, x8

# --- Closing Loop 104 (Depth: 3) ---
addi x4, x4, 1
beq x4, x8, loop_exit_104  # Conditional break from loop
blt x4, x5, loop_start_104 # Branch back to loop start
loop_exit_104: # Define loop exit label
# --- Resuming code after Loop 104 ---

sw x7, 864(x3)
lw x9, 592(x3)
lw x2, 576(x3)
xor x4, x2, x5

# --- Starting Loop 106 (Depth: 3, break at 1, max 9) ---
addi x7, x0, 9
addi x8, x0, 1
addi x5, x0, 0
loop_start_106:

# --- Closing Loop 106 (Depth: 3) ---
addi x5, x5, 1
beq x5, x8, loop_exit_106  # Conditional break from loop
blt x5, x7, loop_start_106 # Branch back to loop start
loop_exit_106: # Define loop exit label
# --- Resuming code after Loop 106 ---

lw x5, 16(x3)
lw x8, 508(x3)
sw x8, 484(x3)
add x6, x1, x4
sw x2, 776(x3)
bne x0, x0, skip_nottaken_62 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_62:

# --- Closing Loop 102 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_exit_102  # Conditional break from loop
blt x6, x8, loop_start_102 # Branch back to loop start
loop_exit_102: # Define loop exit label
# --- Resuming code after Loop 102 ---

or x7, x8, x2
lw x6, 912(x3)
beq x0, x0, skip_taken_63 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_63:
sw x6, 592(x3)
lw x4, 652(x3)

# --- Starting Loop 107 (Depth: 2, break at 3, max 9) ---
addi x1, x0, 9
addi x9, x0, 3
addi x7, x0, 0
loop_start_107:
or x6, x9, x8

# --- Starting Loop 108 (Depth: 3, break at 1, max 3) ---
addi x1, x0, 3
addi x9, x0, 1
addi x5, x0, 0
loop_start_108:
lw x1, 500(x3)

# --- Closing Loop 108 (Depth: 3) ---
addi x5, x5, 1
beq x5, x9, loop_exit_108  # Conditional break from loop
blt x5, x1, loop_start_108 # Branch back to loop start
loop_exit_108: # Define loop exit label
# --- Resuming code after Loop 108 ---

sw x1, 400(x3)

# --- Closing Loop 107 (Depth: 2) ---
addi x7, x7, 1
beq x7, x9, loop_exit_107  # Conditional break from loop
blt x7, x1, loop_start_107 # Branch back to loop start
loop_exit_107: # Define loop exit label
# --- Resuming code after Loop 107 ---

sw x2, 160(x3)
sw x8, 356(x3)
lw x2, 516(x3)

# --- Starting Loop 109 (Depth: 2, break at 2, max 9) ---
addi x8, x0, 9
addi x6, x0, 2
addi x1, x0, 0
loop_start_109:
lw x6, 256(x3)

# --- Starting Loop 110 (Depth: 3, break at 5, max 9) ---
addi x4, x0, 9
addi x2, x0, 5
addi x5, x0, 0
loop_start_110:
sw x5, 972(x3)
and x8, x2, x7
lw x2, 312(x3)
sw x2, 800(x3)
add x8, x9, x9
sw x6, 408(x3)
beq x0, x0, skip_taken_64 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_64:
add x4, x7, x1
xor x9, x7, x7

# --- Closing Loop 110 (Depth: 3) ---
addi x5, x5, 1
beq x5, x2, loop_exit_110  # Conditional break from loop
blt x5, x4, loop_start_110 # Branch back to loop start
loop_exit_110: # Define loop exit label
# --- Resuming code after Loop 110 ---

sw x9, 420(x3)

# --- Closing Loop 109 (Depth: 2) ---
addi x1, x1, 1
beq x1, x6, loop_exit_109  # Conditional break from loop
blt x1, x8, loop_start_109 # Branch back to loop start
loop_exit_109: # Define loop exit label
# --- Resuming code after Loop 109 ---


# --- Starting Loop 111 (Depth: 2, break at 3, max 9) ---
addi x4, x0, 9
addi x9, x0, 3
addi x1, x0, 0
loop_start_111:
sw x1, 172(x3)

# --- Starting Loop 112 (Depth: 3, break at 3, max 4) ---
addi x8, x0, 4
addi x6, x0, 3
addi x7, x0, 0
loop_start_112:

# --- Starting Loop 113 (Depth: 4, break at 3, max 4) ---
addi x9, x0, 4
addi x1, x0, 3
addi x5, x0, 0
loop_start_113:

# --- Closing Loop 113 (Depth: 4) ---
addi x5, x5, 1
beq x5, x1, loop_exit_113  # Conditional break from loop
blt x5, x9, loop_start_113 # Branch back to loop start
loop_exit_113: # Define loop exit label
# --- Resuming code after Loop 113 ---


# --- Closing Loop 112 (Depth: 3) ---
addi x7, x7, 1
beq x7, x6, loop_exit_112  # Conditional break from loop
blt x7, x8, loop_start_112 # Branch back to loop start
loop_exit_112: # Define loop exit label
# --- Resuming code after Loop 112 ---

srl x4, x5, x9
lw x6, 72(x3)

# --- Starting Loop 114 (Depth: 3, break at 5, max 10) ---
addi x7, x0, 10
addi x1, x0, 5
addi x5, x0, 0
loop_start_114:
sw x5, 1000(x3)

# --- Closing Loop 114 (Depth: 3) ---
addi x5, x5, 1
beq x5, x1, loop_exit_114  # Conditional break from loop
blt x5, x7, loop_start_114 # Branch back to loop start
loop_exit_114: # Define loop exit label
# --- Resuming code after Loop 114 ---


# --- Closing Loop 111 (Depth: 2) ---
addi x1, x1, 1
beq x1, x9, loop_exit_111  # Conditional break from loop
blt x1, x4, loop_start_111 # Branch back to loop start
loop_exit_111: # Define loop exit label
# --- Resuming code after Loop 111 ---


# --- Starting Loop 115 (Depth: 2, break at 3, max 8) ---
addi x6, x0, 8
addi x7, x0, 3
addi x2, x0, 0
loop_start_115:
lw x5, 768(x3)

# --- Starting Loop 116 (Depth: 3, break at 3, max 8) ---
addi x4, x0, 8
addi x2, x0, 3
addi x6, x0, 0
loop_start_116:

# --- Closing Loop 116 (Depth: 3) ---
addi x6, x6, 1
beq x6, x2, loop_exit_116  # Conditional break from loop
blt x6, x4, loop_start_116 # Branch back to loop start
loop_exit_116: # Define loop exit label
# --- Resuming code after Loop 116 ---


# --- Starting Loop 117 (Depth: 3, break at 5, max 7) ---
addi x1, x0, 7
addi x7, x0, 5
addi x5, x0, 0
loop_start_117:

# --- Closing Loop 117 (Depth: 3) ---
addi x5, x5, 1
beq x5, x7, loop_exit_117  # Conditional break from loop
blt x5, x1, loop_start_117 # Branch back to loop start
loop_exit_117: # Define loop exit label
# --- Resuming code after Loop 117 ---

sw x8, 352(x3)
lw x4, 820(x3)
xor x8, x1, x5
lw x9, 700(x3)
sw x4, 480(x3)
sub x2, x5, x1
sw x8, 440(x3)

# --- Closing Loop 115 (Depth: 2) ---
addi x2, x2, 1
beq x2, x7, loop_exit_115  # Conditional break from loop
blt x2, x6, loop_start_115 # Branch back to loop start
loop_exit_115: # Define loop exit label
# --- Resuming code after Loop 115 ---


# --- Starting Loop 118 (Depth: 2, break at 3, max 4) ---
addi x4, x0, 4
addi x1, x0, 3
addi x7, x0, 0
loop_start_118:

# --- Starting Loop 119 (Depth: 3, break at 4, max 5) ---
addi x8, x0, 5
addi x4, x0, 4
addi x1, x0, 0
loop_start_119:

# --- Starting Loop 120 (Depth: 4, break at 5, max 6) ---
addi x8, x0, 6
addi x6, x0, 5
addi x5, x0, 0
loop_start_120:
lw x4, 988(x3)
bne x0, x0, skip_nottaken_65 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_65:

# --- Closing Loop 120 (Depth: 4) ---
addi x5, x5, 1
beq x5, x6, loop_exit_120  # Conditional break from loop
blt x5, x8, loop_start_120 # Branch back to loop start
loop_exit_120: # Define loop exit label
# --- Resuming code after Loop 120 ---


# --- Starting Loop 121 (Depth: 4, break at 1, max 5) ---
addi x6, x0, 5
addi x2, x0, 1
addi x5, x0, 0
loop_start_121:

# --- Starting Loop 122 (Depth: 5, break at 5, max 6) ---
addi x2, x0, 6
addi x4, x0, 5
addi x9, x0, 0
loop_start_122:
bne x0, x0, skip_nottaken_66 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_66:
lw x5, 620(x3)
lw x8, 280(x3)

# --- Closing Loop 122 (Depth: 5) ---
addi x9, x9, 1
beq x9, x4, loop_exit_122  # Conditional break from loop
blt x9, x2, loop_start_122 # Branch back to loop start
loop_exit_122: # Define loop exit label
# --- Resuming code after Loop 122 ---

lw x5, 792(x3)

# --- Closing Loop 121 (Depth: 4) ---
addi x5, x5, 1
beq x5, x2, loop_exit_121  # Conditional break from loop
blt x5, x6, loop_start_121 # Branch back to loop start
loop_exit_121: # Define loop exit label
# --- Resuming code after Loop 121 ---

bne x0, x0, skip_nottaken_67 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_67:
add x1, x8, x9
sll x7, x1, x9
srl x6, x7, x1
lw x5, 68(x3)
sub x4, x5, x7

# --- Closing Loop 119 (Depth: 3) ---
addi x1, x1, 1
beq x1, x4, loop_exit_119  # Conditional break from loop
blt x1, x8, loop_start_119 # Branch back to loop start
loop_exit_119: # Define loop exit label
# --- Resuming code after Loop 119 ---


# --- Closing Loop 118 (Depth: 2) ---
addi x7, x7, 1
beq x7, x1, loop_exit_118  # Conditional break from loop
blt x7, x4, loop_start_118 # Branch back to loop start
loop_exit_118: # Define loop exit label
# --- Resuming code after Loop 118 ---

sw x4, 884(x3)
sub x7, x9, x1

# --- Starting Loop 123 (Depth: 2, break at 2, max 7) ---
addi x1, x0, 7
addi x4, x0, 2
addi x5, x0, 0
loop_start_123:

# --- Closing Loop 123 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_exit_123  # Conditional break from loop
blt x5, x1, loop_start_123 # Branch back to loop start
loop_exit_123: # Define loop exit label
# --- Resuming code after Loop 123 ---

and x2, x5, x4
srl x6, x2, x1

# --- Starting Loop 124 (Depth: 2, break at 2, max 9) ---
addi x2, x0, 9
addi x5, x0, 2
addi x8, x0, 0
loop_start_124:

# --- Starting Loop 125 (Depth: 3, break at 5, max 7) ---
addi x6, x0, 7
addi x5, x0, 5
addi x2, x0, 0
loop_start_125:
beq x0, x0, skip_taken_68 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_68:
lw x7, 996(x3)
sw x7, 872(x3)
sub x1, x2, x4
lw x8, 80(x3)

# --- Closing Loop 125 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_exit_125  # Conditional break from loop
blt x2, x6, loop_start_125 # Branch back to loop start
loop_exit_125: # Define loop exit label
# --- Resuming code after Loop 125 ---

sw x1, 768(x3)
lw x6, 88(x3)
sw x6, 608(x3)
beq x0, x0, skip_taken_69 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_69:
lw x5, 296(x3)
sw x7, 88(x3)
sw x5, 152(x3)
sub x8, x5, x5
sw x8, 532(x3)
sw x5, 948(x3)
sll x9, x1, x8
or x9, x4, x8

# --- Starting Loop 126 (Depth: 3, break at 4, max 9) ---
addi x5, x0, 9
addi x8, x0, 4
addi x4, x0, 0
loop_start_126:
lw x6, 816(x3)

# --- Closing Loop 126 (Depth: 3) ---
addi x4, x4, 1
beq x4, x8, loop_exit_126  # Conditional break from loop
blt x4, x5, loop_start_126 # Branch back to loop start
loop_exit_126: # Define loop exit label
# --- Resuming code after Loop 126 ---

lw x6, 376(x3)

# --- Starting Loop 127 (Depth: 3, break at 3, max 10) ---
addi x1, x0, 10
addi x5, x0, 3
addi x8, x0, 0
loop_start_127:

# --- Closing Loop 127 (Depth: 3) ---
addi x8, x8, 1
beq x8, x5, loop_exit_127  # Conditional break from loop
blt x8, x1, loop_start_127 # Branch back to loop start
loop_exit_127: # Define loop exit label
# --- Resuming code after Loop 127 ---


# --- Closing Loop 124 (Depth: 2) ---
addi x8, x8, 1
beq x8, x5, loop_exit_124  # Conditional break from loop
blt x8, x2, loop_start_124 # Branch back to loop start
loop_exit_124: # Define loop exit label
# --- Resuming code after Loop 124 ---

lw x4, 184(x3)
add x7, x9, x1
sw x1, 204(x3)

# --- Starting Loop 128 (Depth: 2, break at 3, max 7) ---
addi x2, x0, 7
addi x4, x0, 3
addi x5, x0, 0
loop_start_128:
or x8, x7, x4
beq x0, x0, skip_taken_70 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_70:
beq x0, x0, skip_taken_71 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_71:
sll x4, x1, x1
lw x8, 308(x3)
bne x0, x0, skip_nottaken_72 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_72:
and x4, x8, x8
add x1, x4, x4

# --- Starting Loop 129 (Depth: 3, break at 1, max 2) ---
addi x2, x0, 2
addi x9, x0, 1
addi x5, x0, 0
loop_start_129:
lw x7, 544(x3)
lw x9, 436(x3)
beq x0, x0, skip_taken_73 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_73:
lw x2, 484(x3)
xor x8, x2, x5
sw x2, 808(x3)
lw x5, 980(x3)

# --- Starting Loop 130 (Depth: 4, break at 5, max 9) ---
addi x6, x0, 9
addi x8, x0, 5
addi x9, x0, 0
loop_start_130:

# --- Closing Loop 130 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_exit_130  # Conditional break from loop
blt x9, x6, loop_start_130 # Branch back to loop start
loop_exit_130: # Define loop exit label
# --- Resuming code after Loop 130 ---

xor x7, x1, x8

# --- Closing Loop 129 (Depth: 3) ---
addi x5, x5, 1
beq x5, x9, loop_exit_129  # Conditional break from loop
blt x5, x2, loop_start_129 # Branch back to loop start
loop_exit_129: # Define loop exit label
# --- Resuming code after Loop 129 ---


# --- Starting Loop 131 (Depth: 3, break at 1, max 5) ---
addi x8, x0, 5
addi x5, x0, 1
addi x4, x0, 0
loop_start_131:
xor x9, x4, x6
and x7, x5, x4
sll x6, x9, x9
sw x6, 828(x3)
sll x7, x8, x8
beq x0, x0, skip_taken_74 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_74:
sw x5, 64(x3)
lw x9, 368(x3)

# --- Starting Loop 132 (Depth: 4, break at 3, max 9) ---
addi x6, x0, 9
addi x1, x0, 3
addi x4, x0, 0
loop_start_132:
srl x9, x4, x7
sw x5, 728(x3)

# --- Closing Loop 132 (Depth: 4) ---
addi x4, x4, 1
beq x4, x1, loop_exit_132  # Conditional break from loop
blt x4, x6, loop_start_132 # Branch back to loop start
loop_exit_132: # Define loop exit label
# --- Resuming code after Loop 132 ---

sub x5, x9, x2

# --- Starting Loop 133 (Depth: 4, break at 3, max 10) ---
addi x7, x0, 10
addi x8, x0, 3
addi x1, x0, 0
loop_start_133:
lw x7, 572(x3)
sll x2, x1, x5
sw x6, 144(x3)
sw x2, 496(x3)
lw x5, 208(x3)
lw x7, 484(x3)
lw x7, 44(x3)
sw x7, 764(x3)
sll x5, x9, x2

# --- Closing Loop 133 (Depth: 4) ---
addi x1, x1, 1
beq x1, x8, loop_exit_133  # Conditional break from loop
blt x1, x7, loop_start_133 # Branch back to loop start
loop_exit_133: # Define loop exit label
# --- Resuming code after Loop 133 ---

bne x0, x0, skip_nottaken_75 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_75:
sw x4, 500(x3)
bne x0, x0, skip_nottaken_76 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_76:

# --- Starting Loop 134 (Depth: 4, break at 2, max 3) ---
addi x6, x0, 3
addi x7, x0, 2
addi x8, x0, 0
loop_start_134:

# --- Closing Loop 134 (Depth: 4) ---
addi x8, x8, 1
beq x8, x7, loop_exit_134  # Conditional break from loop
blt x8, x6, loop_start_134 # Branch back to loop start
loop_exit_134: # Define loop exit label
# --- Resuming code after Loop 134 ---

lw x9, 956(x3)
sw x2, 412(x3)

# --- Closing Loop 131 (Depth: 3) ---
addi x4, x4, 1
beq x4, x5, loop_exit_131  # Conditional break from loop
blt x4, x8, loop_start_131 # Branch back to loop start
loop_exit_131: # Define loop exit label
# --- Resuming code after Loop 131 ---

lw x5, 632(x3)
lw x7, 408(x3)
sw x7, 40(x3)
lw x4, 616(x3)

# --- Starting Loop 135 (Depth: 3, break at 1, max 3) ---
addi x5, x0, 3
addi x6, x0, 1
addi x2, x0, 0
loop_start_135:
lw x4, 660(x3)

# --- Starting Loop 136 (Depth: 4, break at 5, max 7) ---
addi x1, x0, 7
addi x8, x0, 5
addi x9, x0, 0
loop_start_136:
lw x9, 188(x3)
lw x8, 912(x3)
sw x4, 80(x3)
or x6, x1, x2

# --- Closing Loop 136 (Depth: 4) ---
addi x9, x9, 1
beq x9, x8, loop_exit_136  # Conditional break from loop
blt x9, x1, loop_start_136 # Branch back to loop start
loop_exit_136: # Define loop exit label
# --- Resuming code after Loop 136 ---


# --- Starting Loop 137 (Depth: 4, break at 1, max 5) ---
addi x8, x0, 5
addi x7, x0, 1
addi x4, x0, 0
loop_start_137:

# --- Closing Loop 137 (Depth: 4) ---
addi x4, x4, 1
beq x4, x7, loop_exit_137  # Conditional break from loop
blt x4, x8, loop_start_137 # Branch back to loop start
loop_exit_137: # Define loop exit label
# --- Resuming code after Loop 137 ---


# --- Starting Loop 138 (Depth: 4, break at 1, max 2) ---
addi x6, x0, 2
addi x2, x0, 1
addi x1, x0, 0
loop_start_138:

# --- Closing Loop 138 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_exit_138  # Conditional break from loop
blt x1, x6, loop_start_138 # Branch back to loop start
loop_exit_138: # Define loop exit label
# --- Resuming code after Loop 138 ---

lw x5, 176(x3)

# --- Closing Loop 135 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_exit_135  # Conditional break from loop
blt x2, x5, loop_start_135 # Branch back to loop start
loop_exit_135: # Define loop exit label
# --- Resuming code after Loop 135 ---


# --- Starting Loop 139 (Depth: 3, break at 3, max 8) ---
addi x4, x0, 8
addi x9, x0, 3
addi x1, x0, 0
loop_start_139:

# --- Starting Loop 140 (Depth: 4, break at 3, max 5) ---
addi x6, x0, 5
addi x4, x0, 3
addi x2, x0, 0
loop_start_140:
lw x8, 852(x3)
lw x8, 996(x3)
sw x8, 384(x3)
lw x9, 720(x3)
sub x7, x2, x4

# --- Starting Loop 141 (Depth: 5, break at 4, max 7) ---
addi x6, x0, 7
addi x2, x0, 4
addi x8, x0, 0
loop_start_141:
sw x8, 52(x3)
or x2, x9, x4
lw x4, 496(x3)
or x7, x1, x5
sw x5, 8(x3)
srl x4, x6, x5
and x6, x4, x4
srl x1, x6, x9

# --- Closing Loop 141 (Depth: 5) ---
addi x8, x8, 1
beq x8, x2, loop_exit_141  # Conditional break from loop
blt x8, x6, loop_start_141 # Branch back to loop start
loop_exit_141: # Define loop exit label
# --- Resuming code after Loop 141 ---

sw x9, 300(x3)
lw x9, 384(x3)
and x4, x9, x9
lw x5, 804(x3)
sub x2, x5, x4
lw x2, 692(x3)
sw x1, 956(x3)
sw x6, 32(x3)
sw x7, 380(x3)

# --- Closing Loop 140 (Depth: 4) ---
addi x2, x2, 1
beq x2, x4, loop_exit_140  # Conditional break from loop
blt x2, x6, loop_start_140 # Branch back to loop start
loop_exit_140: # Define loop exit label
# --- Resuming code after Loop 140 ---

add x1, x8, x8

# --- Closing Loop 139 (Depth: 3) ---
addi x1, x1, 1
beq x1, x9, loop_exit_139  # Conditional break from loop
blt x1, x4, loop_start_139 # Branch back to loop start
loop_exit_139: # Define loop exit label
# --- Resuming code after Loop 139 ---


# --- Closing Loop 128 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_exit_128  # Conditional break from loop
blt x5, x2, loop_start_128 # Branch back to loop start
loop_exit_128: # Define loop exit label
# --- Resuming code after Loop 128 ---

add x5, x2, x8

# --- Closing Loop 87 (Depth: 1) ---
addi x9, x9, 1
beq x9, x7, loop_exit_87  # Conditional break from loop
blt x9, x2, loop_start_87 # Branch back to loop start
loop_exit_87: # Define loop exit label
# --- Resuming code after Loop 87 ---

sub x8, x1, x2

# --- Starting Loop 142 (Depth: 1, break at 1, max 3) ---
addi x7, x0, 3
addi x1, x0, 1
addi x9, x0, 0
loop_start_142:

# --- Starting Loop 143 (Depth: 2, break at 1, max 2) ---
addi x6, x0, 2
addi x4, x0, 1
addi x8, x0, 0
loop_start_143:
sw x7, 524(x3)

# --- Closing Loop 143 (Depth: 2) ---
addi x8, x8, 1
beq x8, x4, loop_exit_143  # Conditional break from loop
blt x8, x6, loop_start_143 # Branch back to loop start
loop_exit_143: # Define loop exit label
# --- Resuming code after Loop 143 ---

xor x6, x7, x1
bne x0, x0, skip_nottaken_77 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_77:
lw x4, 644(x3)
lw x9, 0(x3)

# --- Closing Loop 142 (Depth: 1) ---
addi x9, x9, 1
beq x9, x1, loop_exit_142  # Conditional break from loop
blt x9, x7, loop_start_142 # Branch back to loop start
loop_exit_142: # Define loop exit label
# --- Resuming code after Loop 142 ---

srl x2, x9, x8
add x9, x2, x4

# --- Starting Loop 144 (Depth: 1, break at 5, max 10) ---
addi x1, x0, 10
addi x8, x0, 5
addi x2, x0, 0
loop_start_144:
or x8, x1, x5

# --- Starting Loop 145 (Depth: 2, break at 5, max 6) ---
addi x7, x0, 6
addi x1, x0, 5
addi x6, x0, 0
loop_start_145:
bne x0, x0, skip_nottaken_78 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_78:

# --- Starting Loop 146 (Depth: 3, break at 2, max 9) ---
addi x8, x0, 9
addi x5, x0, 2
addi x9, x0, 0
loop_start_146:
beq x0, x0, skip_taken_79 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_79:
lw x1, 304(x3)
xor x7, x9, x6

# --- Closing Loop 146 (Depth: 3) ---
addi x9, x9, 1
beq x9, x5, loop_exit_146  # Conditional break from loop
blt x9, x8, loop_start_146 # Branch back to loop start
loop_exit_146: # Define loop exit label
# --- Resuming code after Loop 146 ---

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
loop_start_147:
sw x2, 992(x3)
srl x6, x4, x4
sub x8, x6, x5
lw x9, 604(x3)

# --- Closing Loop 147 (Depth: 3) ---
addi x2, x2, 1
beq x2, x8, loop_exit_147  # Conditional break from loop
blt x2, x7, loop_start_147 # Branch back to loop start
loop_exit_147: # Define loop exit label
# --- Resuming code after Loop 147 ---

sll x2, x8, x6
lw x9, 436(x3)
and x1, x7, x6
sw x4, 324(x3)
lw x1, 736(x3)
lw x5, 948(x3)
beq x0, x0, skip_taken_80 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_80:
sll x4, x1, x1

# --- Closing Loop 145 (Depth: 2) ---
addi x6, x6, 1
beq x6, x1, loop_exit_145  # Conditional break from loop
blt x6, x7, loop_start_145 # Branch back to loop start
loop_exit_145: # Define loop exit label
# --- Resuming code after Loop 145 ---


# --- Starting Loop 148 (Depth: 2, break at 3, max 9) ---
addi x7, x0, 9
addi x5, x0, 3
addi x1, x0, 0
loop_start_148:

# --- Starting Loop 149 (Depth: 3, break at 2, max 4) ---
addi x2, x0, 4
addi x4, x0, 2
addi x7, x0, 0
loop_start_149:
srl x4, x7, x5
or x5, x4, x7
and x1, x4, x7
add x2, x9, x4
lw x7, 864(x3)

# --- Starting Loop 150 (Depth: 4, break at 4, max 5) ---
addi x4, x0, 5
addi x9, x0, 4
addi x2, x0, 0
loop_start_150:
srl x9, x7, x7
lw x4, 96(x3)
sw x4, 896(x3)
add x6, x8, x5
srl x1, x6, x2
bne x0, x0, skip_nottaken_81 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_81:
sw x1, 708(x3)
sll x5, x2, x4

# --- Closing Loop 150 (Depth: 4) ---
addi x2, x2, 1
beq x2, x9, loop_exit_150  # Conditional break from loop
blt x2, x4, loop_start_150 # Branch back to loop start
loop_exit_150: # Define loop exit label
# --- Resuming code after Loop 150 ---


# --- Closing Loop 149 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_exit_149  # Conditional break from loop
blt x7, x2, loop_start_149 # Branch back to loop start
loop_exit_149: # Define loop exit label
# --- Resuming code after Loop 149 ---


# --- Closing Loop 148 (Depth: 2) ---
addi x1, x1, 1
beq x1, x5, loop_exit_148  # Conditional break from loop
blt x1, x7, loop_start_148 # Branch back to loop start
loop_exit_148: # Define loop exit label
# --- Resuming code after Loop 148 ---


# --- Starting Loop 151 (Depth: 2, break at 5, max 9) ---
addi x4, x0, 9
addi x2, x0, 5
addi x8, x0, 0
loop_start_151:

# --- Starting Loop 152 (Depth: 3, break at 2, max 5) ---
addi x6, x0, 5
addi x7, x0, 2
addi x4, x0, 0
loop_start_152:

# --- Closing Loop 152 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_exit_152  # Conditional break from loop
blt x4, x6, loop_start_152 # Branch back to loop start
loop_exit_152: # Define loop exit label
# --- Resuming code after Loop 152 ---

or x4, x4, x9
lw x6, 468(x3)
lw x7, 840(x3)
sll x5, x7, x9

# --- Starting Loop 153 (Depth: 3, break at 1, max 4) ---
addi x6, x0, 4
addi x7, x0, 1
addi x2, x0, 0
loop_start_153:
srl x8, x2, x6

# --- Closing Loop 153 (Depth: 3) ---
addi x2, x2, 1
beq x2, x7, loop_exit_153  # Conditional break from loop
blt x2, x6, loop_start_153 # Branch back to loop start
loop_exit_153: # Define loop exit label
# --- Resuming code after Loop 153 ---


# --- Starting Loop 154 (Depth: 3, break at 5, max 10) ---
addi x1, x0, 10
addi x7, x0, 5
addi x4, x0, 0
loop_start_154:

# --- Starting Loop 155 (Depth: 4, break at 2, max 5) ---
addi x5, x0, 5
addi x2, x0, 2
addi x1, x0, 0
loop_start_155:
sw x1, 248(x3)
bne x0, x0, skip_nottaken_82 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_82:
beq x0, x0, skip_taken_83 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_83:
sw x5, 24(x3)
lw x1, 332(x3)
or x7, x1, x1
lw x8, 120(x3)
lw x2, 56(x3)

# --- Closing Loop 155 (Depth: 4) ---
addi x1, x1, 1
beq x1, x2, loop_exit_155  # Conditional break from loop
blt x1, x5, loop_start_155 # Branch back to loop start
loop_exit_155: # Define loop exit label
# --- Resuming code after Loop 155 ---

srl x6, x2, x2
or x7, x2, x1

# --- Starting Loop 156 (Depth: 4, break at 3, max 6) ---
addi x8, x0, 6
addi x6, x0, 3
addi x4, x0, 0
loop_start_156:
sw x4, 600(x3)

# --- Closing Loop 156 (Depth: 4) ---
addi x4, x4, 1
beq x4, x6, loop_exit_156  # Conditional break from loop
blt x4, x8, loop_start_156 # Branch back to loop start
loop_exit_156: # Define loop exit label
# --- Resuming code after Loop 156 ---


# --- Starting Loop 157 (Depth: 4, break at 5, max 7) ---
addi x7, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_157:
srl x2, x5, x5
sub x7, x2, x8
sw x5, 936(x3)
srl x9, x7, x4
or x7, x9, x4
beq x0, x0, skip_taken_84 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_84:
beq x0, x0, skip_taken_85 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_85:
sll x9, x8, x5
srl x4, x8, x8

# --- Closing Loop 157 (Depth: 4) ---
addi x5, x5, 1
beq x5, x4, loop_exit_157  # Conditional break from loop
blt x5, x7, loop_start_157 # Branch back to loop start
loop_exit_157: # Define loop exit label
# --- Resuming code after Loop 157 ---

sw x2, 24(x3)
sw x5, 524(x3)

# --- Closing Loop 154 (Depth: 3) ---
addi x4, x4, 1
beq x4, x7, loop_exit_154  # Conditional break from loop
blt x4, x1, loop_start_154 # Branch back to loop start
loop_exit_154: # Define loop exit label
# --- Resuming code after Loop 154 ---


# --- Closing Loop 151 (Depth: 2) ---
addi x8, x8, 1
beq x8, x2, loop_exit_151  # Conditional break from loop
blt x8, x4, loop_start_151 # Branch back to loop start
loop_exit_151: # Define loop exit label
# --- Resuming code after Loop 151 ---


# --- Starting Loop 158 (Depth: 2, break at 1, max 5) ---
addi x1, x0, 5
addi x4, x0, 1
addi x8, x0, 0
loop_start_158:
lw x6, 584(x3)

# --- Starting Loop 159 (Depth: 3, break at 2, max 4) ---
addi x2, x0, 4
addi x5, x0, 2
addi x1, x0, 0
loop_start_159:
sll x9, x2, x2
sw x9, 4(x3)
srl x2, x9, x4
lw x8, 292(x3)
lw x9, 252(x3)
lw x8, 556(x3)
sw x5, 740(x3)
sll x2, x4, x4
xor x4, x2, x5

# --- Closing Loop 159 (Depth: 3) ---
addi x1, x1, 1
beq x1, x5, loop_exit_159  # Conditional break from loop
blt x1, x2, loop_start_159 # Branch back to loop start
loop_exit_159: # Define loop exit label
# --- Resuming code after Loop 159 ---

lw x5, 108(x3)
lw x9, 544(x3)

# --- Starting Loop 160 (Depth: 3, break at 5, max 8) ---
addi x7, x0, 8
addi x8, x0, 5
addi x6, x0, 0
loop_start_160:
sw x5, 848(x3)
beq x0, x0, skip_taken_86 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_86:
lw x5, 480(x3)
lw x4, 392(x3)
srl x1, x4, x8
lw x9, 396(x3)
and x4, x6, x1
add x1, x2, x9
beq x0, x0, skip_taken_87 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_87:
and x1, x8, x2
sw x4, 564(x3)
lw x6, 680(x3)
sw x2, 368(x3)
beq x0, x0, skip_taken_88 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_88:
sw x9, 80(x3)
lw x2, 652(x3)
beq x0, x0, skip_taken_89 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_89:

# --- Closing Loop 160 (Depth: 3) ---
addi x6, x6, 1
beq x6, x8, loop_exit_160  # Conditional break from loop
blt x6, x7, loop_start_160 # Branch back to loop start
loop_exit_160: # Define loop exit label
# --- Resuming code after Loop 160 ---

lw x1, 248(x3)
sw x1, 68(x3)
sw x2, 828(x3)
beq x0, x0, skip_taken_90 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_90:

# --- Starting Loop 161 (Depth: 3, break at 1, max 7) ---
addi x2, x0, 7
addi x4, x0, 1
addi x1, x0, 0
loop_start_161:

# --- Starting Loop 162 (Depth: 4, break at 2, max 5) ---
addi x8, x0, 5
addi x5, x0, 2
addi x7, x0, 0
loop_start_162:
add x6, x4, x2
sw x6, 768(x3)

# --- Starting Loop 163 (Depth: 5, break at 1, max 3) ---
addi x2, x0, 3
addi x4, x0, 1
addi x6, x0, 0
loop_start_163:
sll x1, x8, x2
srl x2, x1, x9
lw x6, 936(x3)

# --- Closing Loop 163 (Depth: 5) ---
addi x6, x6, 1
beq x6, x4, loop_exit_163  # Conditional break from loop
blt x6, x2, loop_start_163 # Branch back to loop start
loop_exit_163: # Define loop exit label
# --- Resuming code after Loop 163 ---

sw x8, 520(x3)

# --- Closing Loop 162 (Depth: 4) ---
addi x7, x7, 1
beq x7, x5, loop_exit_162  # Conditional break from loop
blt x7, x8, loop_start_162 # Branch back to loop start
loop_exit_162: # Define loop exit label
# --- Resuming code after Loop 162 ---

sw x5, 356(x3)
sw x4, 384(x3)
sub x9, x8, x8

# --- Starting Loop 164 (Depth: 4, break at 5, max 10) ---
addi x2, x0, 10
addi x7, x0, 5
addi x4, x0, 0
loop_start_164:
lw x8, 316(x3)
lw x2, 756(x3)
lw x9, 912(x3)
beq x0, x0, skip_taken_91 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_91:
and x2, x6, x7
sw x2, 360(x3)
sw x6, 92(x3)

# --- Closing Loop 164 (Depth: 4) ---
addi x4, x4, 1
beq x4, x7, loop_exit_164  # Conditional break from loop
blt x4, x2, loop_start_164 # Branch back to loop start
loop_exit_164: # Define loop exit label
# --- Resuming code after Loop 164 ---

sw x5, 500(x3)

# --- Starting Loop 165 (Depth: 4, break at 2, max 4) ---
addi x4, x0, 4
addi x1, x0, 2
addi x9, x0, 0
loop_start_165:
and x2, x9, x7
sw x2, 112(x3)
and x9, x8, x7
sw x9, 724(x3)

# --- Closing Loop 165 (Depth: 4) ---
addi x9, x9, 1
beq x9, x1, loop_exit_165  # Conditional break from loop
blt x9, x4, loop_start_165 # Branch back to loop start
loop_exit_165: # Define loop exit label
# --- Resuming code after Loop 165 ---

lw x9, 532(x3)
sw x9, 228(x3)
or x9, x4, x1
sw x6, 284(x3)
sw x6, 160(x3)
srl x7, x4, x8
lw x9, 644(x3)
or x7, x9, x1

# --- Starting Loop 166 (Depth: 4, break at 2, max 10) ---
addi x1, x0, 10
addi x8, x0, 2
addi x5, x0, 0
loop_start_166:

# --- Closing Loop 166 (Depth: 4) ---
addi x5, x5, 1
beq x5, x8, loop_exit_166  # Conditional break from loop
blt x5, x1, loop_start_166 # Branch back to loop start
loop_exit_166: # Define loop exit label
# --- Resuming code after Loop 166 ---

lw x9, 312(x3)
lw x7, 288(x3)
sll x9, x5, x5
lw x1, 472(x3)
and x5, x4, x2

# --- Closing Loop 161 (Depth: 3) ---
addi x1, x1, 1
beq x1, x4, loop_exit_161  # Conditional break from loop
blt x1, x2, loop_start_161 # Branch back to loop start
loop_exit_161: # Define loop exit label
# --- Resuming code after Loop 161 ---

sw x5, 888(x3)
sub x7, x4, x8
lw x8, 88(x3)

# --- Closing Loop 158 (Depth: 2) ---
addi x8, x8, 1
beq x8, x4, loop_exit_158  # Conditional break from loop
blt x8, x1, loop_start_158 # Branch back to loop start
loop_exit_158: # Define loop exit label
# --- Resuming code after Loop 158 ---


# --- Starting Loop 167 (Depth: 2, break at 1, max 8) ---
addi x6, x0, 8
addi x7, x0, 1
addi x5, x0, 0
loop_start_167:

# --- Closing Loop 167 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_exit_167  # Conditional break from loop
blt x5, x6, loop_start_167 # Branch back to loop start
loop_exit_167: # Define loop exit label
# --- Resuming code after Loop 167 ---


# --- Starting Loop 168 (Depth: 2, break at 2, max 8) ---
addi x4, x0, 8
addi x6, x0, 2
addi x9, x0, 0
loop_start_168:
beq x0, x0, skip_taken_92 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_92:

# --- Starting Loop 169 (Depth: 3, break at 2, max 3) ---
addi x2, x0, 3
addi x4, x0, 2
addi x6, x0, 0
loop_start_169:
lw x1, 860(x3)
add x2, x4, x4
or x8, x2, x6
sw x2, 476(x3)

# --- Closing Loop 169 (Depth: 3) ---
addi x6, x6, 1
beq x6, x4, loop_exit_169  # Conditional break from loop
blt x6, x2, loop_start_169 # Branch back to loop start
loop_exit_169: # Define loop exit label
# --- Resuming code after Loop 169 ---

beq x0, x0, skip_taken_93 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_93:
bne x0, x0, skip_nottaken_94 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_94:
sw x1, 136(x3)
lw x7, 216(x3)

# --- Closing Loop 168 (Depth: 2) ---
addi x9, x9, 1
beq x9, x6, loop_exit_168  # Conditional break from loop
blt x9, x4, loop_start_168 # Branch back to loop start
loop_exit_168: # Define loop exit label
# --- Resuming code after Loop 168 ---

sw x7, 992(x3)
sw x5, 852(x3)

# --- Closing Loop 144 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_exit_144  # Conditional break from loop
blt x2, x1, loop_start_144 # Branch back to loop start
loop_exit_144: # Define loop exit label
# --- Resuming code after Loop 144 ---

beq x0, x0, skip_taken_95 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_95:
sll x2, x1, x8
lw x9, 228(x3)

# --- Starting Loop 170 (Depth: 1, break at 3, max 4) ---
addi x6, x0, 4
addi x7, x0, 3
addi x8, x0, 0
loop_start_170:
add x7, x8, x8

# --- Starting Loop 171 (Depth: 2, break at 2, max 9) ---
addi x4, x0, 9
addi x8, x0, 2
addi x6, x0, 0
loop_start_171:
sub x4, x8, x5

# --- Closing Loop 171 (Depth: 2) ---
addi x6, x6, 1
beq x6, x8, loop_exit_171  # Conditional break from loop
blt x6, x4, loop_start_171 # Branch back to loop start
loop_exit_171: # Define loop exit label
# --- Resuming code after Loop 171 ---

or x2, x4, x1
add x7, x6, x4
lw x1, 156(x3)

# --- Starting Loop 172 (Depth: 2, break at 2, max 4) ---
addi x7, x0, 4
addi x8, x0, 2
addi x6, x0, 0
loop_start_172:

# --- Starting Loop 173 (Depth: 3, break at 5, max 7) ---
addi x2, x0, 7
addi x8, x0, 5
addi x7, x0, 0
loop_start_173:
lw x7, 136(x3)
lw x6, 824(x3)
beq x0, x0, skip_taken_96 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_96:
or x2, x6, x4
beq x0, x0, skip_taken_97 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_97:
sw x8, 76(x3)
sw x8, 292(x3)

# --- Closing Loop 173 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_exit_173  # Conditional break from loop
blt x7, x2, loop_start_173 # Branch back to loop start
loop_exit_173: # Define loop exit label
# --- Resuming code after Loop 173 ---

beq x0, x0, skip_taken_98 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_98:

# --- Starting Loop 174 (Depth: 3, break at 1, max 6) ---
addi x7, x0, 6
addi x6, x0, 1
addi x8, x0, 0
loop_start_174:
lw x9, 964(x3)
lw x7, 840(x3)
and x5, x7, x1
add x8, x7, x1
xor x5, x8, x8
lw x9, 752(x3)

# --- Closing Loop 174 (Depth: 3) ---
addi x8, x8, 1
beq x8, x6, loop_exit_174  # Conditional break from loop
blt x8, x7, loop_start_174 # Branch back to loop start
loop_exit_174: # Define loop exit label
# --- Resuming code after Loop 174 ---

sw x8, 608(x3)
add x2, x1, x8
or x8, x7, x1
lw x9, 216(x3)
sw x1, 900(x3)
sw x7, 780(x3)
add x9, x6, x7
srl x2, x1, x6

# --- Closing Loop 172 (Depth: 2) ---
addi x6, x6, 1
beq x6, x8, loop_exit_172  # Conditional break from loop
blt x6, x7, loop_start_172 # Branch back to loop start
loop_exit_172: # Define loop exit label
# --- Resuming code after Loop 172 ---


# --- Starting Loop 175 (Depth: 2, break at 2, max 6) ---
addi x5, x0, 6
addi x4, x0, 2
addi x7, x0, 0
loop_start_175:
sw x7, 752(x3)
add x9, x7, x5

# --- Closing Loop 175 (Depth: 2) ---
addi x7, x7, 1
beq x7, x4, loop_exit_175  # Conditional break from loop
blt x7, x5, loop_start_175 # Branch back to loop start
loop_exit_175: # Define loop exit label
# --- Resuming code after Loop 175 ---

xor x7, x9, x5
lw x5, 904(x3)
lw x5, 84(x3)
sw x5, 372(x3)
and x9, x4, x5

# --- Starting Loop 176 (Depth: 2, break at 1, max 7) ---
addi x7, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_176:
and x9, x2, x4
beq x0, x0, skip_taken_99 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_99:
lw x2, 584(x3)

# --- Closing Loop 176 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_176  # Conditional break from loop
blt x6, x7, loop_start_176 # Branch back to loop start
loop_exit_176: # Define loop exit label
# --- Resuming code after Loop 176 ---


# --- Starting Loop 177 (Depth: 2, break at 3, max 5) ---
addi x7, x0, 5
addi x4, x0, 3
addi x6, x0, 0
loop_start_177:

# --- Closing Loop 177 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_177  # Conditional break from loop
blt x6, x7, loop_start_177 # Branch back to loop start
loop_exit_177: # Define loop exit label
# --- Resuming code after Loop 177 ---

lw x8, 108(x3)

# --- Closing Loop 170 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_exit_170  # Conditional break from loop
blt x8, x6, loop_start_170 # Branch back to loop start
loop_exit_170: # Define loop exit label
# --- Resuming code after Loop 170 ---


# --- Starting Loop 178 (Depth: 1, break at 5, max 8) ---
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_178:
srl x4, x2, x5
sll x7, x6, x8

# --- Starting Loop 179 (Depth: 2, break at 3, max 7) ---
addi x4, x0, 7
addi x1, x0, 3
addi x2, x0, 0
loop_start_179:
add x1, x2, x7
sw x1, 40(x3)
lw x9, 416(x3)

# --- Closing Loop 179 (Depth: 2) ---
addi x2, x2, 1
beq x2, x1, loop_exit_179  # Conditional break from loop
blt x2, x4, loop_start_179 # Branch back to loop start
loop_exit_179: # Define loop exit label
# --- Resuming code after Loop 179 ---


# --- Starting Loop 180 (Depth: 2, break at 4, max 5) ---
addi x8, x0, 5
addi x7, x0, 4
addi x5, x0, 0
loop_start_180:
srl x5, x9, x7
add x4, x5, x8
bne x0, x0, skip_nottaken_100 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_100:

# --- Starting Loop 181 (Depth: 3, break at 1, max 7) ---
addi x2, x0, 7
addi x1, x0, 1
addi x9, x0, 0
loop_start_181:
add x5, x8, x1
and x5, x5, x1
srl x4, x5, x9

# --- Closing Loop 181 (Depth: 3) ---
addi x9, x9, 1
beq x9, x1, loop_exit_181  # Conditional break from loop
blt x9, x2, loop_start_181 # Branch back to loop start
loop_exit_181: # Define loop exit label
# --- Resuming code after Loop 181 ---

xor x4, x4, x8

# --- Starting Loop 182 (Depth: 3, break at 5, max 10) ---
addi x5, x0, 10
addi x9, x0, 5
addi x8, x0, 0
loop_start_182:
lw x4, 580(x3)

# --- Starting Loop 183 (Depth: 4, break at 1, max 3) ---
addi x2, x0, 3
addi x9, x0, 1
addi x8, x0, 0
loop_start_183:
sw x1, 248(x3)

# --- Closing Loop 183 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_exit_183  # Conditional break from loop
blt x8, x2, loop_start_183 # Branch back to loop start
loop_exit_183: # Define loop exit label
# --- Resuming code after Loop 183 ---

and x2, x6, x1
sw x2, 108(x3)
lw x2, 100(x3)

# --- Starting Loop 184 (Depth: 4, break at 5, max 10) ---
addi x1, x0, 10
addi x7, x0, 5
addi x8, x0, 0
loop_start_184:
lw x7, 704(x3)
sw x7, 464(x3)
lw x6, 220(x3)
sw x6, 36(x3)
sw x1, 452(x3)

# --- Starting Loop 185 (Depth: 5, break at 2, max 9) ---
addi x1, x0, 9
addi x9, x0, 2
addi x7, x0, 0
loop_start_185:
sw x7, 320(x3)

# --- Closing Loop 185 (Depth: 5) ---
addi x7, x7, 1
beq x7, x9, loop_exit_185  # Conditional break from loop
blt x7, x1, loop_start_185 # Branch back to loop start
loop_exit_185: # Define loop exit label
# --- Resuming code after Loop 185 ---

lw x7, 388(x3)
sw x7, 636(x3)

# --- Closing Loop 184 (Depth: 4) ---
addi x8, x8, 1
beq x8, x7, loop_exit_184  # Conditional break from loop
blt x8, x1, loop_start_184 # Branch back to loop start
loop_exit_184: # Define loop exit label
# --- Resuming code after Loop 184 ---

lw x1, 368(x3)

# --- Starting Loop 186 (Depth: 4, break at 3, max 7) ---
addi x6, x0, 7
addi x4, x0, 3
addi x8, x0, 0
loop_start_186:
lw x8, 948(x3)
srl x8, x2, x4
sub x5, x8, x4
lw x9, 284(x3)
add x5, x6, x8
sw x2, 664(x3)
sw x8, 204(x3)
beq x0, x0, skip_taken_101 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_101:
lw x6, 172(x3)
srl x1, x6, x6
sw x1, 456(x3)
or x9, x2, x1
lw x5, 240(x3)
lw x4, 876(x3)
lw x7, 260(x3)
sw x1, 336(x3)

# --- Starting Loop 187 (Depth: 5, break at 1, max 3) ---
addi x1, x0, 3
addi x5, x0, 1
addi x4, x0, 0
loop_start_187:
xor x6, x4, x4
lw x5, 428(x3)
sub x1, x5, x6
bne x0, x0, skip_nottaken_102 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_102:
sw x1, 688(x3)

# --- Closing Loop 187 (Depth: 5) ---
addi x4, x4, 1
beq x4, x5, loop_exit_187  # Conditional break from loop
blt x4, x1, loop_start_187 # Branch back to loop start
loop_exit_187: # Define loop exit label
# --- Resuming code after Loop 187 ---

sw x6, 908(x3)
lw x4, 308(x3)
lw x5, 964(x3)
lw x4, 8(x3)

# --- Closing Loop 186 (Depth: 4) ---
addi x8, x8, 1
beq x8, x4, loop_exit_186  # Conditional break from loop
blt x8, x6, loop_start_186 # Branch back to loop start
loop_exit_186: # Define loop exit label
# --- Resuming code after Loop 186 ---

sw x4, 96(x3)
xor x6, x4, x7

# --- Closing Loop 182 (Depth: 3) ---
addi x8, x8, 1
beq x8, x9, loop_exit_182  # Conditional break from loop
blt x8, x5, loop_start_182 # Branch back to loop start
loop_exit_182: # Define loop exit label
# --- Resuming code after Loop 182 ---

sw x6, 464(x3)

# --- Starting Loop 188 (Depth: 3, break at 5, max 10) ---
addi x7, x0, 10
addi x5, x0, 5
addi x4, x0, 0
loop_start_188:

# --- Closing Loop 188 (Depth: 3) ---
addi x4, x4, 1
beq x4, x5, loop_exit_188  # Conditional break from loop
blt x4, x7, loop_start_188 # Branch back to loop start
loop_exit_188: # Define loop exit label
# --- Resuming code after Loop 188 ---

sw x8, 728(x3)

# --- Starting Loop 189 (Depth: 3, break at 5, max 10) ---
addi x6, x0, 10
addi x9, x0, 5
addi x7, x0, 0
loop_start_189:
bne x0, x0, skip_nottaken_103 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_103:
and x8, x1, x6
lw x5, 252(x3)
sw x5, 148(x3)

# --- Closing Loop 189 (Depth: 3) ---
addi x7, x7, 1
beq x7, x9, loop_exit_189  # Conditional break from loop
blt x7, x6, loop_start_189 # Branch back to loop start
loop_exit_189: # Define loop exit label
# --- Resuming code after Loop 189 ---


# --- Starting Loop 190 (Depth: 3, break at 1, max 6) ---
addi x7, x0, 6
addi x8, x0, 1
addi x9, x0, 0
loop_start_190:
srl x8, x1, x7
or x4, x9, x7

# --- Closing Loop 190 (Depth: 3) ---
addi x9, x9, 1
beq x9, x8, loop_exit_190  # Conditional break from loop
blt x9, x7, loop_start_190 # Branch back to loop start
loop_exit_190: # Define loop exit label
# --- Resuming code after Loop 190 ---

lw x5, 232(x3)

# --- Closing Loop 180 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_exit_180  # Conditional break from loop
blt x5, x8, loop_start_180 # Branch back to loop start
loop_exit_180: # Define loop exit label
# --- Resuming code after Loop 180 ---

and x6, x5, x5
and x2, x6, x6

# --- Starting Loop 191 (Depth: 2, break at 2, max 5) ---
addi x5, x0, 5
addi x4, x0, 2
addi x8, x0, 0
loop_start_191:

# --- Closing Loop 191 (Depth: 2) ---
addi x8, x8, 1
beq x8, x4, loop_exit_191  # Conditional break from loop
blt x8, x5, loop_start_191 # Branch back to loop start
loop_exit_191: # Define loop exit label
# --- Resuming code after Loop 191 ---

and x1, x6, x9
sw x2, 960(x3)

# --- Starting Loop 192 (Depth: 2, break at 2, max 10) ---
addi x7, x0, 10
addi x6, x0, 2
addi x9, x0, 0
loop_start_192:

# --- Starting Loop 193 (Depth: 3, break at 2, max 3) ---
addi x1, x0, 3
addi x6, x0, 2
addi x5, x0, 0
loop_start_193:
xor x2, x5, x6
lw x6, 464(x3)
lw x9, 184(x3)
sll x9, x7, x7

# --- Starting Loop 194 (Depth: 4, break at 3, max 6) ---
addi x7, x0, 6
addi x8, x0, 3
addi x5, x0, 0
loop_start_194:
lw x2, 324(x3)
sw x1, 480(x3)
lw x1, 976(x3)
lw x7, 332(x3)
lw x9, 72(x3)
lw x2, 764(x3)
lw x7, 584(x3)

# --- Starting Loop 195 (Depth: 5, break at 1, max 5) ---
addi x2, x0, 5
addi x5, x0, 1
addi x6, x0, 0
loop_start_195:
sw x9, 928(x3)
lw x4, 920(x3)
sub x1, x4, x5
add x7, x1, x5
sw x7, 612(x3)
srl x5, x7, x4
sw x5, 512(x3)
lw x5, 472(x3)

# --- Closing Loop 195 (Depth: 5) ---
addi x6, x6, 1
beq x6, x5, loop_exit_195  # Conditional break from loop
blt x6, x2, loop_start_195 # Branch back to loop start
loop_exit_195: # Define loop exit label
# --- Resuming code after Loop 195 ---


# --- Closing Loop 194 (Depth: 4) ---
addi x5, x5, 1
beq x5, x8, loop_exit_194  # Conditional break from loop
blt x5, x7, loop_start_194 # Branch back to loop start
loop_exit_194: # Define loop exit label
# --- Resuming code after Loop 194 ---

lw x2, 896(x3)
sw x2, 632(x3)
lw x2, 384(x3)
lw x1, 616(x3)
sub x5, x6, x2
sub x9, x5, x7

# --- Starting Loop 196 (Depth: 4, break at 1, max 2) ---
addi x2, x0, 2
addi x1, x0, 1
addi x7, x0, 0
loop_start_196:
and x2, x5, x4
lw x7, 528(x3)
sw x7, 612(x3)
lw x4, 864(x3)
sw x9, 112(x3)
lw x4, 788(x3)
bne x0, x0, skip_nottaken_104 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_104:
sw x4, 196(x3)
lw x5, 452(x3)
sw x5, 832(x3)
xor x5, x1, x1

# --- Closing Loop 196 (Depth: 4) ---
addi x7, x7, 1
beq x7, x1, loop_exit_196  # Conditional break from loop
blt x7, x2, loop_start_196 # Branch back to loop start
loop_exit_196: # Define loop exit label
# --- Resuming code after Loop 196 ---

sw x5, 584(x3)
sw x7, 348(x3)

# --- Starting Loop 197 (Depth: 4, break at 2, max 9) ---
addi x8, x0, 9
addi x6, x0, 2
addi x7, x0, 0
loop_start_197:
beq x0, x0, skip_taken_105 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_105:
or x8, x7, x4
sll x6, x8, x7
xor x8, x6, x2
lw x1, 244(x3)
srl x4, x5, x8
lw x6, 936(x3)
sw x8, 936(x3)
lw x1, 592(x3)
lw x2, 704(x3)
lw x8, 704(x3)
srl x7, x8, x1
sw x1, 144(x3)
xor x1, x7, x9
sw x7, 352(x3)
sll x9, x1, x4
beq x0, x0, skip_taken_106 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_106:

# --- Closing Loop 197 (Depth: 4) ---
addi x7, x7, 1
beq x7, x6, loop_exit_197  # Conditional break from loop
blt x7, x8, loop_start_197 # Branch back to loop start
loop_exit_197: # Define loop exit label
# --- Resuming code after Loop 197 ---


# --- Starting Loop 198 (Depth: 4, break at 2, max 9) ---
addi x2, x0, 9
addi x7, x0, 2
addi x1, x0, 0
loop_start_198:
lw x9, 192(x3)
sw x9, 848(x3)
lw x8, 528(x3)
sw x8, 788(x3)

# --- Closing Loop 198 (Depth: 4) ---
addi x1, x1, 1
beq x1, x7, loop_exit_198  # Conditional break from loop
blt x1, x2, loop_start_198 # Branch back to loop start
loop_exit_198: # Define loop exit label
# --- Resuming code after Loop 198 ---


# --- Starting Loop 199 (Depth: 4, break at 1, max 2) ---
addi x8, x0, 2
addi x7, x0, 1
addi x6, x0, 0
loop_start_199:
sw x4, 60(x3)
lw x9, 204(x3)
add x9, x9, x8
lw x1, 940(x3)
bne x0, x0, skip_nottaken_107 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_107:
sw x6, 488(x3)
lw x2, 464(x3)
lw x4, 232(x3)
bne x0, x0, skip_nottaken_108 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_108:
bne x0, x0, skip_nottaken_109 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_109:
lw x7, 972(x3)
lw x8, 596(x3)
sw x8, 652(x3)
sw x6, 72(x3)
xor x5, x7, x1

# --- Closing Loop 199 (Depth: 4) ---
addi x6, x6, 1
beq x6, x7, loop_exit_199  # Conditional break from loop
blt x6, x8, loop_start_199 # Branch back to loop start
loop_exit_199: # Define loop exit label
# --- Resuming code after Loop 199 ---


# --- Starting Loop 200 (Depth: 4, break at 2, max 3) ---
addi x1, x0, 3
addi x8, x0, 2
addi x6, x0, 0
loop_start_200:
sll x5, x1, x4
sub x6, x2, x1
sw x6, 80(x3)

# --- Closing Loop 200 (Depth: 4) ---
addi x6, x6, 1
beq x6, x8, loop_exit_200  # Conditional break from loop
blt x6, x1, loop_start_200 # Branch back to loop start
loop_exit_200: # Define loop exit label
# --- Resuming code after Loop 200 ---

lw x8, 844(x3)

# --- Closing Loop 193 (Depth: 3) ---
addi x5, x5, 1
beq x5, x6, loop_exit_193  # Conditional break from loop
blt x5, x1, loop_start_193 # Branch back to loop start
loop_exit_193: # Define loop exit label
# --- Resuming code after Loop 193 ---


# --- Starting Loop 201 (Depth: 3, break at 2, max 4) ---
addi x4, x0, 4
addi x2, x0, 2
addi x9, x0, 0
loop_start_201:

# --- Closing Loop 201 (Depth: 3) ---
addi x9, x9, 1
beq x9, x2, loop_exit_201  # Conditional break from loop
blt x9, x4, loop_start_201 # Branch back to loop start
loop_exit_201: # Define loop exit label
# --- Resuming code after Loop 201 ---

lw x9, 1000(x3)

# --- Closing Loop 192 (Depth: 2) ---
addi x9, x9, 1
beq x9, x6, loop_exit_192  # Conditional break from loop
blt x9, x7, loop_start_192 # Branch back to loop start
loop_exit_192: # Define loop exit label
# --- Resuming code after Loop 192 ---


# --- Starting Loop 202 (Depth: 2, break at 1, max 5) ---
addi x8, x0, 5
addi x5, x0, 1
addi x6, x0, 0
loop_start_202:

# --- Starting Loop 203 (Depth: 3, break at 5, max 6) ---
addi x1, x0, 6
addi x8, x0, 5
addi x7, x0, 0
loop_start_203:

# --- Closing Loop 203 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_exit_203  # Conditional break from loop
blt x7, x1, loop_start_203 # Branch back to loop start
loop_exit_203: # Define loop exit label
# --- Resuming code after Loop 203 ---

add x8, x7, x7
or x1, x8, x8

# --- Closing Loop 202 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_exit_202  # Conditional break from loop
blt x6, x8, loop_start_202 # Branch back to loop start
loop_exit_202: # Define loop exit label
# --- Resuming code after Loop 202 ---


# --- Closing Loop 178 (Depth: 1) ---
addi x2, x2, 1
beq x2, x1, loop_exit_178  # Conditional break from loop
blt x2, x5, loop_start_178 # Branch back to loop start
loop_exit_178: # Define loop exit label
# --- Resuming code after Loop 178 ---


# --- Starting Loop 204 (Depth: 1, break at 5, max 6) ---
addi x6, x0, 6
addi x8, x0, 5
addi x5, x0, 0
loop_start_204:

# --- Closing Loop 204 (Depth: 1) ---
addi x5, x5, 1
beq x5, x8, loop_exit_204  # Conditional break from loop
blt x5, x6, loop_start_204 # Branch back to loop start
loop_exit_204: # Define loop exit label
# --- Resuming code after Loop 204 ---

sw x5, 624(x3)
sw x1, 368(x3)
beq x0, x0, skip_taken_110 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_110:

# --- Starting Loop 205 (Depth: 1, break at 5, max 9) ---
addi x4, x0, 9
addi x1, x0, 5
addi x5, x0, 0
loop_start_205:
sw x2, 896(x3)
lw x9, 1000(x3)
lw x7, 388(x3)
or x6, x7, x1
lw x7, 952(x3)

# --- Starting Loop 206 (Depth: 2, break at 1, max 9) ---
addi x5, x0, 9
addi x2, x0, 1
addi x1, x0, 0
loop_start_206:
and x1, x1, x5
sw x5, 96(x3)

# --- Starting Loop 207 (Depth: 3, break at 1, max 9) ---
addi x1, x0, 9
addi x8, x0, 1
addi x6, x0, 0
loop_start_207:

# --- Starting Loop 208 (Depth: 4, break at 1, max 2) ---
addi x8, x0, 2
addi x2, x0, 1
addi x4, x0, 0
loop_start_208:
lw x5, 408(x3)

# --- Closing Loop 208 (Depth: 4) ---
addi x4, x4, 1
beq x4, x2, loop_exit_208  # Conditional break from loop
blt x4, x8, loop_start_208 # Branch back to loop start
loop_exit_208: # Define loop exit label
# --- Resuming code after Loop 208 ---


# --- Starting Loop 209 (Depth: 4, break at 3, max 6) ---
addi x4, x0, 6
addi x2, x0, 3
addi x9, x0, 0
loop_start_209:
lw x4, 384(x3)

# --- Closing Loop 209 (Depth: 4) ---
addi x9, x9, 1
beq x9, x2, loop_exit_209  # Conditional break from loop
blt x9, x4, loop_start_209 # Branch back to loop start
loop_exit_209: # Define loop exit label
# --- Resuming code after Loop 209 ---


# --- Starting Loop 210 (Depth: 4, break at 4, max 9) ---
addi x2, x0, 9
addi x8, x0, 4
addi x1, x0, 0
loop_start_210:
and x2, x1, x9
and x1, x9, x8
beq x0, x0, skip_taken_111 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_111:
beq x0, x0, skip_taken_112 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_112:

# --- Closing Loop 210 (Depth: 4) ---
addi x1, x1, 1
beq x1, x8, loop_exit_210  # Conditional break from loop
blt x1, x2, loop_start_210 # Branch back to loop start
loop_exit_210: # Define loop exit label
# --- Resuming code after Loop 210 ---

sw x8, 756(x3)
sw x2, 880(x3)
sw x7, 784(x3)
lw x6, 276(x3)
lw x9, 252(x3)
lw x9, 72(x3)
sw x2, 244(x3)
beq x0, x0, skip_taken_113 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_113:
sw x8, 112(x3)
sub x6, x5, x2

# --- Closing Loop 207 (Depth: 3) ---
addi x6, x6, 1
beq x6, x8, loop_exit_207  # Conditional break from loop
blt x6, x1, loop_start_207 # Branch back to loop start
loop_exit_207: # Define loop exit label
# --- Resuming code after Loop 207 ---

sw x9, 396(x3)

# --- Closing Loop 206 (Depth: 2) ---
addi x1, x1, 1
beq x1, x2, loop_exit_206  # Conditional break from loop
blt x1, x5, loop_start_206 # Branch back to loop start
loop_exit_206: # Define loop exit label
# --- Resuming code after Loop 206 ---

lw x2, 796(x3)
sw x2, 904(x3)
and x7, x9, x2

# --- Closing Loop 205 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_exit_205  # Conditional break from loop
blt x5, x4, loop_start_205 # Branch back to loop start
loop_exit_205: # Define loop exit label
# --- Resuming code after Loop 205 ---


# --- Starting Loop 211 (Depth: 1, break at 2, max 8) ---
addi x4, x0, 8
addi x8, x0, 2
addi x1, x0, 0
loop_start_211:

# --- Starting Loop 212 (Depth: 2, break at 1, max 9) ---
addi x6, x0, 9
addi x8, x0, 1
addi x5, x0, 0
loop_start_212:

# --- Starting Loop 213 (Depth: 3, break at 3, max 10) ---
addi x2, x0, 10
addi x6, x0, 3
addi x4, x0, 0
loop_start_213:

# --- Starting Loop 214 (Depth: 4, break at 5, max 6) ---
addi x2, x0, 6
addi x6, x0, 5
addi x9, x0, 0
loop_start_214:
srl x2, x9, x1
sw x1, 644(x3)
srl x2, x7, x1
or x7, x9, x1
lw x8, 932(x3)
lw x5, 824(x3)
sw x2, 300(x3)
sw x1, 412(x3)
bne x0, x0, skip_nottaken_114 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_114:
sw x1, 352(x3)
sub x4, x5, x2
sw x2, 248(x3)
lw x5, 676(x3)
lw x6, 268(x3)
sw x6, 64(x3)
srl x9, x1, x1
beq x0, x0, skip_taken_115 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_115:
xor x5, x9, x1
lw x9, 448(x3)

# --- Closing Loop 214 (Depth: 4) ---
addi x9, x9, 1
beq x9, x6, loop_exit_214  # Conditional break from loop
blt x9, x2, loop_start_214 # Branch back to loop start
loop_exit_214: # Define loop exit label
# --- Resuming code after Loop 214 ---


# --- Closing Loop 213 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_exit_213  # Conditional break from loop
blt x4, x2, loop_start_213 # Branch back to loop start
loop_exit_213: # Define loop exit label
# --- Resuming code after Loop 213 ---

and x8, x9, x2
lw x7, 16(x3)
sw x7, 132(x3)

# --- Closing Loop 212 (Depth: 2) ---
addi x5, x5, 1
beq x5, x8, loop_exit_212  # Conditional break from loop
blt x5, x6, loop_start_212 # Branch back to loop start
loop_exit_212: # Define loop exit label
# --- Resuming code after Loop 212 ---

lw x9, 180(x3)

# --- Closing Loop 211 (Depth: 1) ---
addi x1, x1, 1
beq x1, x8, loop_exit_211  # Conditional break from loop
blt x1, x4, loop_start_211 # Branch back to loop start
loop_exit_211: # Define loop exit label
# --- Resuming code after Loop 211 ---

lw x8, 180(x3)
sub x5, x2, x7
lw x5, 488(x3)
lw x8, 44(x3)

# --- Starting Loop 215 (Depth: 1, break at 2, max 7) ---
addi x1, x0, 7
addi x7, x0, 2
addi x4, x0, 0
loop_start_215:
or x7, x4, x9

# --- Starting Loop 216 (Depth: 2, break at 2, max 6) ---
addi x8, x0, 6
addi x2, x0, 2
addi x9, x0, 0
loop_start_216:
sw x1, 864(x3)

# --- Closing Loop 216 (Depth: 2) ---
addi x9, x9, 1
beq x9, x2, loop_exit_216  # Conditional break from loop
blt x9, x8, loop_start_216 # Branch back to loop start
loop_exit_216: # Define loop exit label
# --- Resuming code after Loop 216 ---


# --- Closing Loop 215 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_exit_215  # Conditional break from loop
blt x4, x1, loop_start_215 # Branch back to loop start
loop_exit_215: # Define loop exit label
# --- Resuming code after Loop 215 ---

sw x2, 260(x3)

# --- Starting Loop 217 (Depth: 1, break at 3, max 5) ---
addi x9, x0, 5
addi x4, x0, 3
addi x2, x0, 0
loop_start_217:
bne x0, x0, skip_nottaken_116 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_116:
beq x0, x0, skip_taken_117 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_117:
sll x6, x2, x5

# --- Starting Loop 218 (Depth: 2, break at 1, max 8) ---
addi x7, x0, 8
addi x8, x0, 1
addi x5, x0, 0
loop_start_218:
sw x6, 700(x3)

# --- Starting Loop 219 (Depth: 3, break at 1, max 7) ---
addi x1, x0, 7
addi x7, x0, 1
addi x9, x0, 0
loop_start_219:
add x5, x2, x6
sll x9, x2, x1
sub x5, x9, x4

# --- Starting Loop 220 (Depth: 4, break at 5, max 6) ---
addi x1, x0, 6
addi x7, x0, 5
addi x6, x0, 0
loop_start_220:
bne x0, x0, skip_nottaken_118 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_118:

# --- Closing Loop 220 (Depth: 4) ---
addi x6, x6, 1
beq x6, x7, loop_exit_220  # Conditional break from loop
blt x6, x1, loop_start_220 # Branch back to loop start
loop_exit_220: # Define loop exit label
# --- Resuming code after Loop 220 ---

sw x8, 816(x3)

# --- Starting Loop 221 (Depth: 4, break at 4, max 7) ---
addi x8, x0, 7
addi x7, x0, 4
addi x9, x0, 0
loop_start_221:
lw x4, 572(x3)
lw x2, 116(x3)
sw x7, 348(x3)
lw x9, 556(x3)

# --- Closing Loop 221 (Depth: 4) ---
addi x9, x9, 1
beq x9, x7, loop_exit_221  # Conditional break from loop
blt x9, x8, loop_start_221 # Branch back to loop start
loop_exit_221: # Define loop exit label
# --- Resuming code after Loop 221 ---

lw x2, 500(x3)
lw x7, 464(x3)
sll x7, x4, x6
sw x2, 916(x3)

# --- Closing Loop 219 (Depth: 3) ---
addi x9, x9, 1
beq x9, x7, loop_exit_219  # Conditional break from loop
blt x9, x1, loop_start_219 # Branch back to loop start
loop_exit_219: # Define loop exit label
# --- Resuming code after Loop 219 ---

lw x5, 732(x3)
sll x9, x2, x1
sw x9, 116(x3)
sw x4, 336(x3)

# --- Starting Loop 222 (Depth: 3, break at 3, max 8) ---
addi x6, x0, 8
addi x7, x0, 3
addi x2, x0, 0
loop_start_222:
or x1, x2, x7
sll x8, x1, x1
sw x6, 920(x3)
lw x8, 656(x3)
lw x1, 936(x3)
xor x1, x1, x6
sub x4, x1, x1

# --- Closing Loop 222 (Depth: 3) ---
addi x2, x2, 1
beq x2, x7, loop_exit_222  # Conditional break from loop
blt x2, x6, loop_start_222 # Branch back to loop start
loop_exit_222: # Define loop exit label
# --- Resuming code after Loop 222 ---

bne x0, x0, skip_nottaken_119 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_119:
sw x4, 8(x3)
sw x6, 952(x3)
srl x7, x1, x6
sw x2, 984(x3)
beq x0, x0, skip_taken_120 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_120:
beq x0, x0, skip_taken_121 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_121:

# --- Closing Loop 218 (Depth: 2) ---
addi x5, x5, 1
beq x5, x8, loop_exit_218  # Conditional break from loop
blt x5, x7, loop_start_218 # Branch back to loop start
loop_exit_218: # Define loop exit label
# --- Resuming code after Loop 218 ---


# --- Closing Loop 217 (Depth: 1) ---
addi x2, x2, 1
beq x2, x4, loop_exit_217  # Conditional break from loop
blt x2, x9, loop_start_217 # Branch back to loop start
loop_exit_217: # Define loop exit label
# --- Resuming code after Loop 217 ---


# --- Starting Loop 223 (Depth: 1, break at 5, max 8) ---
addi x2, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_223:
beq x0, x0, skip_taken_122 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_122:

# --- Starting Loop 224 (Depth: 2, break at 2, max 6) ---
addi x2, x0, 6
addi x7, x0, 2
addi x6, x0, 0
loop_start_224:
sub x9, x6, x8
sw x7, 928(x3)

# --- Starting Loop 225 (Depth: 3, break at 4, max 5) ---
addi x2, x0, 5
addi x8, x0, 4
addi x7, x0, 0
loop_start_225:
bne x0, x0, skip_nottaken_123 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_123:
sw x5, 428(x3)
lw x1, 544(x3)
sw x2, 876(x3)
lw x7, 824(x3)
lw x8, 8(x3)
lw x1, 140(x3)
lw x5, 524(x3)

# --- Starting Loop 226 (Depth: 4, break at 3, max 7) ---
addi x7, x0, 7
addi x1, x0, 3
addi x8, x0, 0
loop_start_226:
lw x7, 16(x3)
sw x7, 280(x3)

# --- Starting Loop 227 (Depth: 5, break at 5, max 10) ---
addi x1, x0, 10
addi x8, x0, 5
addi x4, x0, 0
loop_start_227:
sw x8, 132(x3)
lw x6, 684(x3)
sw x6, 248(x3)

# --- Closing Loop 227 (Depth: 5) ---
addi x4, x4, 1
beq x4, x8, loop_exit_227  # Conditional break from loop
blt x4, x1, loop_start_227 # Branch back to loop start
loop_exit_227: # Define loop exit label
# --- Resuming code after Loop 227 ---

lw x4, 124(x3)
sub x7, x4, x1
sw x7, 324(x3)
lw x1, 476(x3)
sw x1, 424(x3)

# --- Closing Loop 226 (Depth: 4) ---
addi x8, x8, 1
beq x8, x1, loop_exit_226  # Conditional break from loop
blt x8, x7, loop_start_226 # Branch back to loop start
loop_exit_226: # Define loop exit label
# --- Resuming code after Loop 226 ---

sw x4, 772(x3)
xor x8, x1, x1
srl x5, x1, x4

# --- Closing Loop 225 (Depth: 3) ---
addi x7, x7, 1
beq x7, x8, loop_exit_225  # Conditional break from loop
blt x7, x2, loop_start_225 # Branch back to loop start
loop_exit_225: # Define loop exit label
# --- Resuming code after Loop 225 ---


# --- Starting Loop 228 (Depth: 3, break at 3, max 4) ---
addi x1, x0, 4
addi x6, x0, 3
addi x2, x0, 0
loop_start_228:

# --- Closing Loop 228 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_exit_228  # Conditional break from loop
blt x2, x1, loop_start_228 # Branch back to loop start
loop_exit_228: # Define loop exit label
# --- Resuming code after Loop 228 ---

lw x5, 164(x3)
add x7, x8, x6
sw x1, 172(x3)

# --- Closing Loop 224 (Depth: 2) ---
addi x6, x6, 1
beq x6, x7, loop_exit_224  # Conditional break from loop
blt x6, x2, loop_start_224 # Branch back to loop start
loop_exit_224: # Define loop exit label
# --- Resuming code after Loop 224 ---

lw x8, 428(x3)
sw x1, 140(x3)
lw x5, 760(x3)
sw x5, 960(x3)

# --- Starting Loop 229 (Depth: 2, break at 5, max 6) ---
addi x8, x0, 6
addi x5, x0, 5
addi x2, x0, 0
loop_start_229:

# --- Starting Loop 230 (Depth: 3, break at 2, max 8) ---
addi x9, x0, 8
addi x7, x0, 2
addi x6, x0, 0
loop_start_230:
lw x8, 152(x3)

# --- Closing Loop 230 (Depth: 3) ---
addi x6, x6, 1
beq x6, x7, loop_exit_230  # Conditional break from loop
blt x6, x9, loop_start_230 # Branch back to loop start
loop_exit_230: # Define loop exit label
# --- Resuming code after Loop 230 ---

or x9, x2, x1
lw x4, 36(x3)
sw x4, 260(x3)

# --- Starting Loop 231 (Depth: 3, break at 3, max 8) ---
addi x9, x0, 8
addi x6, x0, 3
addi x4, x0, 0
loop_start_231:
add x6, x4, x7

# --- Closing Loop 231 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_exit_231  # Conditional break from loop
blt x4, x9, loop_start_231 # Branch back to loop start
loop_exit_231: # Define loop exit label
# --- Resuming code after Loop 231 ---


# --- Starting Loop 232 (Depth: 3, break at 2, max 10) ---
addi x2, x0, 10
addi x4, x0, 2
addi x7, x0, 0
loop_start_232:
sw x9, 516(x3)
sw x6, 984(x3)
lw x2, 516(x3)
sw x4, 892(x3)
or x7, x4, x4
sw x7, 964(x3)
srl x1, x9, x4
sw x1, 684(x3)
lw x8, 88(x3)
or x1, x6, x9

# --- Closing Loop 232 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_exit_232  # Conditional break from loop
blt x7, x2, loop_start_232 # Branch back to loop start
loop_exit_232: # Define loop exit label
# --- Resuming code after Loop 232 ---

sw x2, 848(x3)

# --- Starting Loop 233 (Depth: 3, break at 1, max 9) ---
addi x1, x0, 9
addi x2, x0, 1
addi x8, x0, 0
loop_start_233:

# --- Closing Loop 233 (Depth: 3) ---
addi x8, x8, 1
beq x8, x2, loop_exit_233  # Conditional break from loop
blt x8, x1, loop_start_233 # Branch back to loop start
loop_exit_233: # Define loop exit label
# --- Resuming code after Loop 233 ---

lw x5, 124(x3)
srl x1, x5, x5
sw x1, 172(x3)

# --- Closing Loop 229 (Depth: 2) ---
addi x2, x2, 1
beq x2, x5, loop_exit_229  # Conditional break from loop
blt x2, x8, loop_start_229 # Branch back to loop start
loop_exit_229: # Define loop exit label
# --- Resuming code after Loop 229 ---

lw x5, 580(x3)
sw x9, 560(x3)
and x6, x8, x7
sw x6, 184(x3)

# --- Closing Loop 223 (Depth: 1) ---
addi x4, x4, 1
beq x4, x6, loop_exit_223  # Conditional break from loop
blt x4, x2, loop_start_223 # Branch back to loop start
loop_exit_223: # Define loop exit label
# --- Resuming code after Loop 223 ---

or x4, x6, x8

# --- Starting Loop 234 (Depth: 1, break at 1, max 3) ---
addi x5, x0, 3
addi x6, x0, 1
addi x7, x0, 0
loop_start_234:
add x7, x5, x9
sw x9, 636(x3)

# --- Starting Loop 235 (Depth: 2, break at 3, max 6) ---
addi x1, x0, 6
addi x8, x0, 3
addi x7, x0, 0
loop_start_235:

# --- Starting Loop 236 (Depth: 3, break at 2, max 9) ---
addi x2, x0, 9
addi x5, x0, 2
addi x6, x0, 0
loop_start_236:
lw x4, 664(x3)
sw x4, 88(x3)
lw x7, 1000(x3)

# --- Starting Loop 237 (Depth: 4, break at 3, max 4) ---
addi x2, x0, 4
addi x6, x0, 3
addi x1, x0, 0
loop_start_237:
bne x0, x0, skip_nottaken_124 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_124:

# --- Closing Loop 237 (Depth: 4) ---
addi x1, x1, 1
beq x1, x6, loop_exit_237  # Conditional break from loop
blt x1, x2, loop_start_237 # Branch back to loop start
loop_exit_237: # Define loop exit label
# --- Resuming code after Loop 237 ---

sw x6, 660(x3)
sw x9, 824(x3)
sub x8, x7, x7
and x8, x5, x9

# --- Closing Loop 236 (Depth: 3) ---
addi x6, x6, 1
beq x6, x5, loop_exit_236  # Conditional break from loop
blt x6, x2, loop_start_236 # Branch back to loop start
loop_exit_236: # Define loop exit label
# --- Resuming code after Loop 236 ---

lw x2, 216(x3)
lw x2, 440(x3)
lw x8, 756(x3)

# --- Starting Loop 238 (Depth: 3, break at 5, max 9) ---
addi x5, x0, 9
addi x7, x0, 5
addi x6, x0, 0
loop_start_238:
lw x7, 356(x3)
lw x1, 468(x3)
bne x0, x0, skip_nottaken_125 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_125:
xor x4, x8, x2
or x9, x4, x8
add x7, x9, x5

# --- Starting Loop 239 (Depth: 4, break at 4, max 5) ---
addi x6, x0, 5
addi x1, x0, 4
addi x2, x0, 0
loop_start_239:
sw x2, 52(x3)

# --- Closing Loop 239 (Depth: 4) ---
addi x2, x2, 1
beq x2, x1, loop_exit_239  # Conditional break from loop
blt x2, x6, loop_start_239 # Branch back to loop start
loop_exit_239: # Define loop exit label
# --- Resuming code after Loop 239 ---

sub x9, x6, x8

# --- Closing Loop 238 (Depth: 3) ---
addi x6, x6, 1
beq x6, x7, loop_exit_238  # Conditional break from loop
blt x6, x5, loop_start_238 # Branch back to loop start
loop_exit_238: # Define loop exit label
# --- Resuming code after Loop 238 ---

sw x7, 308(x3)

# --- Starting Loop 240 (Depth: 3, break at 4, max 6) ---
addi x2, x0, 6
addi x7, x0, 4
addi x8, x0, 0
loop_start_240:
sw x5, 672(x3)
lw x7, 400(x3)
bne x0, x0, skip_nottaken_126 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_126:

# --- Starting Loop 241 (Depth: 4, break at 1, max 10) ---
addi x2, x0, 10
addi x6, x0, 1
addi x5, x0, 0
loop_start_241:
sw x5, 192(x3)
sw x2, 88(x3)

# --- Closing Loop 241 (Depth: 4) ---
addi x5, x5, 1
beq x5, x6, loop_exit_241  # Conditional break from loop
blt x5, x2, loop_start_241 # Branch back to loop start
loop_exit_241: # Define loop exit label
# --- Resuming code after Loop 241 ---

sw x7, 76(x3)
sw x6, 440(x3)

# --- Starting Loop 242 (Depth: 4, break at 1, max 4) ---
addi x8, x0, 4
addi x7, x0, 1
addi x9, x0, 0
loop_start_242:
sw x5, 568(x3)
lw x9, 492(x3)
sw x5, 832(x3)
beq x0, x0, skip_taken_127 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_127:
lw x6, 24(x3)
sw x6, 148(x3)
lw x9, 108(x3)
sw x9, 444(x3)
sw x5, 988(x3)
lw x5, 664(x3)
lw x5, 904(x3)
sw x1, 12(x3)
srl x5, x8, x7
sw x5, 508(x3)
sw x5, 796(x3)
sw x8, 864(x3)
and x8, x1, x1
lw x5, 552(x3)
sw x7, 592(x3)
sll x7, x1, x5

# --- Closing Loop 242 (Depth: 4) ---
addi x9, x9, 1
beq x9, x7, loop_exit_242  # Conditional break from loop
blt x9, x8, loop_start_242 # Branch back to loop start
loop_exit_242: # Define loop exit label
# --- Resuming code after Loop 242 ---

sll x2, x7, x5
or x6, x9, x8
srl x2, x1, x1
add x4, x8, x5
bne x0, x0, skip_nottaken_128 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_128:
lw x7, 908(x3)
srl x8, x7, x7
bne x0, x0, skip_nottaken_129 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_129:

# --- Closing Loop 240 (Depth: 3) ---
addi x8, x8, 1
beq x8, x7, loop_exit_240  # Conditional break from loop
blt x8, x2, loop_start_240 # Branch back to loop start
loop_exit_240: # Define loop exit label
# --- Resuming code after Loop 240 ---


# --- Closing Loop 235 (Depth: 2) ---
addi x7, x7, 1
beq x7, x8, loop_exit_235  # Conditional break from loop
blt x7, x1, loop_start_235 # Branch back to loop start
loop_exit_235: # Define loop exit label
# --- Resuming code after Loop 235 ---

lw x5, 388(x3)

# --- Closing Loop 234 (Depth: 1) ---
addi x7, x7, 1
beq x7, x6, loop_exit_234  # Conditional break from loop
blt x7, x5, loop_start_234 # Branch back to loop start
loop_exit_234: # Define loop exit label
# --- Resuming code after Loop 234 ---


# --- Starting Loop 243 (Depth: 1, break at 4, max 8) ---
addi x6, x0, 8
addi x9, x0, 4
addi x2, x0, 0
loop_start_243:
sw x5, 48(x3)
sw x8, 676(x3)
bne x0, x0, skip_nottaken_130 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_130:
sw x7, 740(x3)

# --- Closing Loop 243 (Depth: 1) ---
addi x2, x2, 1
beq x2, x9, loop_exit_243  # Conditional break from loop
blt x2, x6, loop_start_243 # Branch back to loop start
loop_exit_243: # Define loop exit label
# --- Resuming code after Loop 243 ---


# --- Starting Loop 244 (Depth: 1, break at 4, max 7) ---
addi x9, x0, 7
addi x4, x0, 4
addi x5, x0, 0
loop_start_244:
sw x7, 988(x3)

# --- Closing Loop 244 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_244  # Conditional break from loop
blt x5, x9, loop_start_244 # Branch back to loop start
loop_exit_244: # Define loop exit label
# --- Resuming code after Loop 244 ---


# --- Starting Loop 245 (Depth: 1, break at 2, max 9) ---
addi x6, x0, 9
addi x1, x0, 2
addi x4, x0, 0
loop_start_245:

# --- Starting Loop 246 (Depth: 2, break at 5, max 10) ---
addi x9, x0, 10
addi x8, x0, 5
addi x1, x0, 0
loop_start_246:
sub x2, x1, x9
sw x9, 328(x3)
xor x5, x2, x4
bne x0, x0, skip_nottaken_131 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_131:
lw x8, 512(x3)
sw x2, 180(x3)
srl x5, x7, x4

# --- Closing Loop 246 (Depth: 2) ---
addi x1, x1, 1
beq x1, x8, loop_exit_246  # Conditional break from loop
blt x1, x9, loop_start_246 # Branch back to loop start
loop_exit_246: # Define loop exit label
# --- Resuming code after Loop 246 ---

beq x0, x0, skip_taken_132 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_132:
sw x5, 448(x3)
bne x0, x0, skip_nottaken_133 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_133:

# --- Closing Loop 245 (Depth: 1) ---
addi x4, x4, 1
beq x4, x1, loop_exit_245  # Conditional break from loop
blt x4, x6, loop_start_245 # Branch back to loop start
loop_exit_245: # Define loop exit label
# --- Resuming code after Loop 245 ---

add x1, x2, x5
sub x9, x1, x8
lw x6, 40(x3)

# --- Starting Loop 247 (Depth: 1, break at 5, max 10) ---
addi x7, x0, 10
addi x2, x0, 5
addi x1, x0, 0
loop_start_247:

# --- Starting Loop 248 (Depth: 2, break at 4, max 6) ---
addi x8, x0, 6
addi x2, x0, 4
addi x5, x0, 0
loop_start_248:
srl x2, x4, x7
sw x2, 840(x3)
sll x5, x4, x1
xor x7, x5, x8
lw x4, 900(x3)
lw x7, 568(x3)
or x5, x4, x6
lw x4, 212(x3)
sw x6, 68(x3)

# --- Closing Loop 248 (Depth: 2) ---
addi x5, x5, 1
beq x5, x2, loop_exit_248  # Conditional break from loop
blt x5, x8, loop_start_248 # Branch back to loop start
loop_exit_248: # Define loop exit label
# --- Resuming code after Loop 248 ---


# --- Starting Loop 249 (Depth: 2, break at 3, max 5) ---
addi x9, x0, 5
addi x4, x0, 3
addi x8, x0, 0
loop_start_249:
sw x8, 928(x3)
sw x8, 492(x3)
sw x8, 448(x3)

# --- Closing Loop 249 (Depth: 2) ---
addi x8, x8, 1
beq x8, x4, loop_exit_249  # Conditional break from loop
blt x8, x9, loop_start_249 # Branch back to loop start
loop_exit_249: # Define loop exit label
# --- Resuming code after Loop 249 ---

lw x7, 912(x3)
lw x8, 448(x3)
beq x0, x0, skip_taken_134 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_134:

# --- Starting Loop 250 (Depth: 2, break at 2, max 3) ---
addi x6, x0, 3
addi x5, x0, 2
addi x9, x0, 0
loop_start_250:
sub x5, x8, x8
sw x5, 200(x3)

# --- Starting Loop 251 (Depth: 3, break at 4, max 7) ---
addi x2, x0, 7
addi x8, x0, 4
addi x9, x0, 0
loop_start_251:
lw x5, 240(x3)
beq x0, x0, skip_taken_135 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_135:
or x7, x6, x2
sw x7, 124(x3)

# --- Closing Loop 251 (Depth: 3) ---
addi x9, x9, 1
beq x9, x8, loop_exit_251  # Conditional break from loop
blt x9, x2, loop_start_251 # Branch back to loop start
loop_exit_251: # Define loop exit label
# --- Resuming code after Loop 251 ---

lw x6, 496(x3)
sw x6, 592(x3)
lw x6, 612(x3)
sw x5, 336(x3)

# --- Closing Loop 250 (Depth: 2) ---
addi x9, x9, 1
beq x9, x5, loop_exit_250  # Conditional break from loop
blt x9, x6, loop_start_250 # Branch back to loop start
loop_exit_250: # Define loop exit label
# --- Resuming code after Loop 250 ---

sll x5, x9, x8

# --- Closing Loop 247 (Depth: 1) ---
addi x1, x1, 1
beq x1, x2, loop_exit_247  # Conditional break from loop
blt x1, x7, loop_start_247 # Branch back to loop start
loop_exit_247: # Define loop exit label
# --- Resuming code after Loop 247 ---


# --- Starting Loop 252 (Depth: 1, break at 4, max 9) ---
addi x6, x0, 9
addi x7, x0, 4
addi x8, x0, 0
loop_start_252:
xor x7, x8, x5
sw x7, 268(x3)

# --- Starting Loop 253 (Depth: 2, break at 4, max 9) ---
addi x4, x0, 9
addi x2, x0, 4
addi x6, x0, 0
loop_start_253:
lw x2, 808(x3)
sw x1, 984(x3)
lw x9, 256(x3)

# --- Starting Loop 254 (Depth: 3, break at 5, max 6) ---
addi x2, x0, 6
addi x1, x0, 5
addi x7, x0, 0
loop_start_254:
sw x7, 496(x3)
lw x2, 804(x3)
sll x9, x2, x6
or x1, x9, x7
lw x1, 640(x3)
beq x0, x0, skip_taken_136 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_136:
sw x4, 808(x3)
lw x4, 700(x3)
add x9, x4, x4
lw x6, 316(x3)

# --- Starting Loop 255 (Depth: 4, break at 3, max 7) ---
addi x7, x0, 7
addi x9, x0, 3
addi x8, x0, 0
loop_start_255:
add x8, x7, x4
or x5, x8, x6
srl x5, x8, x9
beq x0, x0, skip_taken_137 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_137:
and x1, x5, x6
lw x9, 276(x3)
srl x6, x9, x9
sw x6, 248(x3)
xor x4, x9, x5

# --- Closing Loop 255 (Depth: 4) ---
addi x8, x8, 1
beq x8, x9, loop_exit_255  # Conditional break from loop
blt x8, x7, loop_start_255 # Branch back to loop start
loop_exit_255: # Define loop exit label
# --- Resuming code after Loop 255 ---


# --- Starting Loop 256 (Depth: 4, break at 2, max 6) ---
addi x6, x0, 6
addi x7, x0, 2
addi x1, x0, 0
loop_start_256:

# --- Starting Loop 257 (Depth: 5, break at 5, max 6) ---
addi x8, x0, 6
addi x5, x0, 5
addi x4, x0, 0
loop_start_257:
lw x8, 312(x3)
lw x4, 16(x3)
sw x8, 228(x3)
sw x8, 812(x3)
lw x7, 480(x3)
lw x6, 988(x3)

# --- Closing Loop 257 (Depth: 5) ---
addi x4, x4, 1
beq x4, x5, loop_exit_257  # Conditional break from loop
blt x4, x8, loop_start_257 # Branch back to loop start
loop_exit_257: # Define loop exit label
# --- Resuming code after Loop 257 ---

lw x5, 304(x3)
or x9, x5, x6

# --- Closing Loop 256 (Depth: 4) ---
addi x1, x1, 1
beq x1, x7, loop_exit_256  # Conditional break from loop
blt x1, x6, loop_start_256 # Branch back to loop start
loop_exit_256: # Define loop exit label
# --- Resuming code after Loop 256 ---


# --- Closing Loop 254 (Depth: 3) ---
addi x7, x7, 1
beq x7, x1, loop_exit_254  # Conditional break from loop
blt x7, x2, loop_start_254 # Branch back to loop start
loop_exit_254: # Define loop exit label
# --- Resuming code after Loop 254 ---


# --- Starting Loop 258 (Depth: 3, break at 3, max 9) ---
addi x5, x0, 9
addi x7, x0, 3
addi x4, x0, 0
loop_start_258:

# --- Starting Loop 259 (Depth: 4, break at 3, max 10) ---
addi x6, x0, 10
addi x7, x0, 3
addi x9, x0, 0
loop_start_259:
xor x5, x9, x8
xor x1, x5, x6
and x7, x8, x5
lw x9, 692(x3)
lw x7, 864(x3)
sw x7, 304(x3)
lw x8, 212(x3)
sw x8, 44(x3)
srl x5, x9, x1

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 259
addi x9, x9, 1
beq x9, x7, loop_exit_259
blt x9, x6, loop_start_259
loop_exit_259:

# Closing remaining Loop 258
addi x4, x4, 1
beq x4, x7, loop_exit_258
blt x4, x5, loop_start_258
loop_exit_258:

# Closing remaining Loop 253
addi x6, x6, 1
beq x6, x2, loop_exit_253
blt x6, x4, loop_start_253
loop_exit_253:

# Closing remaining Loop 252
addi x8, x8, 1
beq x8, x7, loop_exit_252
blt x8, x6, loop_start_252
loop_exit_252:

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
