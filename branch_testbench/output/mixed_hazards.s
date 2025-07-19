# Initialize memory base register x3
lui x3, 3
addi x3, x3, 0

lw x5, 400(x3)
sw x5, 932(x3)

# --- Starting Loop 1 (Depth: 1, break at 2, max 4) ---
addi x2, x0, 4
addi x7, x0, 2
addi x4, x0, 0
loop_start_1:

# --- Closing Loop 1 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_exit_1  # Conditional break from loop
blt x4, x2, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---

bne x0, x0, skip_nottaken_1 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_1:
sw x4, 640(x3)
beq x0, x0, skip_taken_2 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_2:
bne x0, x0, skip_nottaken_3 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_3:
sw x1, 100(x3)

# --- Starting Loop 2 (Depth: 1, break at 1, max 4) ---
addi x6, x0, 4
addi x9, x0, 1
addi x5, x0, 0
loop_start_2:

# --- Closing Loop 2 (Depth: 1) ---
addi x5, x5, 1
beq x5, x9, loop_exit_2  # Conditional break from loop
blt x5, x6, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---

srl x2, x5, x1
lw x9, 644(x3)
beq x0, x0, skip_taken_4 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_4:
beq x0, x0, skip_taken_5 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_5:
beq x0, x0, skip_taken_6 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_6:
bne x0, x0, skip_nottaken_7 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_7:
beq x0, x0, skip_taken_8 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_8:

# --- Starting Loop 3 (Depth: 1, break at 2, max 6) ---
addi x2, x0, 6
addi x1, x0, 2
addi x5, x0, 0
loop_start_3:
and x5, x5, x8

# --- Closing Loop 3 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_exit_3  # Conditional break from loop
blt x5, x2, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---

beq x0, x0, skip_taken_9 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_9:
lw x9, 528(x3)
beq x0, x0, skip_taken_10 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_10:
bne x0, x0, skip_nottaken_11 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_11:

# --- Starting Loop 4 (Depth: 1, break at 4, max 8) ---
addi x5, x0, 8
addi x6, x0, 4
addi x1, x0, 0
loop_start_4:
sub x2, x9, x4
bne x0, x0, skip_nottaken_12 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_12:
beq x0, x0, skip_taken_13 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_13:
sll x2, x2, x8

# --- Closing Loop 4 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_exit_4  # Conditional break from loop
blt x1, x5, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---

bne x0, x0, skip_nottaken_14 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_14:
bne x0, x0, skip_nottaken_15 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_15:

# --- Starting Loop 5 (Depth: 1, break at 4, max 5) ---
addi x8, x0, 5
addi x6, x0, 4
addi x9, x0, 0
loop_start_5:

# --- Closing Loop 5 (Depth: 1) ---
addi x9, x9, 1
beq x9, x6, loop_exit_5  # Conditional break from loop
blt x9, x8, loop_start_5 # Branch back to loop start
loop_exit_5: # Define loop exit label
# --- Resuming code after Loop 5 ---

add x4, x9, x6

# --- Starting Loop 6 (Depth: 1, break at 3, max 7) ---
addi x9, x0, 7
addi x1, x0, 3
addi x7, x0, 0
loop_start_6:

# --- Closing Loop 6 (Depth: 1) ---
addi x7, x7, 1
beq x7, x1, loop_exit_6  # Conditional break from loop
blt x7, x9, loop_start_6 # Branch back to loop start
loop_exit_6: # Define loop exit label
# --- Resuming code after Loop 6 ---

bne x0, x0, skip_nottaken_16 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_16:
lw x1, 64(x3)

# --- Starting Loop 7 (Depth: 1, break at 5, max 9) ---
addi x2, x0, 9
addi x4, x0, 5
addi x9, x0, 0
loop_start_7:

# --- Starting Loop 8 (Depth: 2, break at 1, max 7) ---
addi x7, x0, 7
addi x5, x0, 1
addi x8, x0, 0
loop_start_8:
sw x5, 632(x3)
bne x0, x0, skip_nottaken_17 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_17:

# --- Closing Loop 8 (Depth: 2) ---
addi x8, x8, 1
beq x8, x5, loop_exit_8  # Conditional break from loop
blt x8, x7, loop_start_8 # Branch back to loop start
loop_exit_8: # Define loop exit label
# --- Resuming code after Loop 8 ---

and x5, x9, x2

# --- Starting Loop 9 (Depth: 2, break at 5, max 8) ---
addi x4, x0, 8
addi x2, x0, 5
addi x8, x0, 0
loop_start_9:
bne x0, x0, skip_nottaken_18 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_18:
lw x9, 184(x3)
beq x0, x0, skip_taken_19 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_19:
lw x1, 148(x3)
sll x5, x1, x8
bne x0, x0, skip_nottaken_20 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_20:
sw x5, 948(x3)
lw x7, 480(x3)
lw x1, 404(x3)
lw x8, 108(x3)
sll x4, x7, x1
beq x0, x0, skip_taken_21 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_21:
sw x4, 280(x3)

# --- Closing Loop 9 (Depth: 2) ---
addi x8, x8, 1
beq x8, x2, loop_exit_9  # Conditional break from loop
blt x8, x4, loop_start_9 # Branch back to loop start
loop_exit_9: # Define loop exit label
# --- Resuming code after Loop 9 ---


# --- Closing Loop 7 (Depth: 1) ---
addi x9, x9, 1
beq x9, x4, loop_exit_7  # Conditional break from loop
blt x9, x2, loop_start_7 # Branch back to loop start
loop_exit_7: # Define loop exit label
# --- Resuming code after Loop 7 ---


# --- Starting Loop 10 (Depth: 1, break at 5, max 9) ---
addi x4, x0, 9
addi x8, x0, 5
addi x2, x0, 0
loop_start_10:
bne x0, x0, skip_nottaken_22 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_22:

# --- Closing Loop 10 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_exit_10  # Conditional break from loop
blt x2, x4, loop_start_10 # Branch back to loop start
loop_exit_10: # Define loop exit label
# --- Resuming code after Loop 10 ---

sw x2, 780(x3)

# --- Starting Loop 11 (Depth: 1, break at 2, max 4) ---
addi x8, x0, 4
addi x6, x0, 2
addi x9, x0, 0
loop_start_11:
sub x7, x9, x8

# --- Closing Loop 11 (Depth: 1) ---
addi x9, x9, 1
beq x9, x6, loop_exit_11  # Conditional break from loop
blt x9, x8, loop_start_11 # Branch back to loop start
loop_exit_11: # Define loop exit label
# --- Resuming code after Loop 11 ---

beq x0, x0, skip_taken_23 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_23:

# --- Starting Loop 12 (Depth: 1, break at 2, max 9) ---
addi x5, x0, 9
addi x8, x0, 2
addi x6, x0, 0
loop_start_12:

# --- Closing Loop 12 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_exit_12  # Conditional break from loop
blt x6, x5, loop_start_12 # Branch back to loop start
loop_exit_12: # Define loop exit label
# --- Resuming code after Loop 12 ---

beq x0, x0, skip_taken_24 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_24:
sub x9, x6, x5

# --- Starting Loop 13 (Depth: 1, break at 5, max 8) ---
addi x4, x0, 8
addi x8, x0, 5
addi x5, x0, 0
loop_start_13:

# --- Closing Loop 13 (Depth: 1) ---
addi x5, x5, 1
beq x5, x8, loop_exit_13  # Conditional break from loop
blt x5, x4, loop_start_13 # Branch back to loop start
loop_exit_13: # Define loop exit label
# --- Resuming code after Loop 13 ---

lw x1, 588(x3)
beq x0, x0, skip_taken_25 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_25:

# --- Starting Loop 14 (Depth: 1, break at 3, max 6) ---
addi x5, x0, 6
addi x2, x0, 3
addi x7, x0, 0
loop_start_14:

# --- Closing Loop 14 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_exit_14  # Conditional break from loop
blt x7, x5, loop_start_14 # Branch back to loop start
loop_exit_14: # Define loop exit label
# --- Resuming code after Loop 14 ---

lw x8, 548(x3)
bne x0, x0, skip_nottaken_26 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_26:

# --- Starting Loop 15 (Depth: 1, break at 5, max 10) ---
addi x5, x0, 10
addi x6, x0, 5
addi x7, x0, 0
loop_start_15:

# --- Starting Loop 16 (Depth: 2, break at 4, max 10) ---
addi x1, x0, 10
addi x4, x0, 4
addi x5, x0, 0
loop_start_16:

# --- Closing Loop 16 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_exit_16  # Conditional break from loop
blt x5, x1, loop_start_16 # Branch back to loop start
loop_exit_16: # Define loop exit label
# --- Resuming code after Loop 16 ---

lw x7, 100(x3)

# --- Starting Loop 17 (Depth: 2, break at 3, max 4) ---
addi x1, x0, 4
addi x9, x0, 3
addi x8, x0, 0
loop_start_17:
lw x8, 480(x3)
sw x6, 40(x3)

# --- Closing Loop 17 (Depth: 2) ---
addi x8, x8, 1
beq x8, x9, loop_exit_17  # Conditional break from loop
blt x8, x1, loop_start_17 # Branch back to loop start
loop_exit_17: # Define loop exit label
# --- Resuming code after Loop 17 ---


# --- Closing Loop 15 (Depth: 1) ---
addi x7, x7, 1
beq x7, x6, loop_exit_15  # Conditional break from loop
blt x7, x5, loop_start_15 # Branch back to loop start
loop_exit_15: # Define loop exit label
# --- Resuming code after Loop 15 ---


# --- Starting Loop 18 (Depth: 1, break at 3, max 8) ---
addi x5, x0, 8
addi x8, x0, 3
addi x6, x0, 0
loop_start_18:
beq x0, x0, skip_taken_27 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_27:
lw x5, 496(x3)
sw x5, 788(x3)

# --- Closing Loop 18 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_exit_18  # Conditional break from loop
blt x6, x5, loop_start_18 # Branch back to loop start
loop_exit_18: # Define loop exit label
# --- Resuming code after Loop 18 ---

sw x2, 260(x3)
lw x2, 792(x3)
lw x2, 560(x3)
lw x2, 976(x3)
sw x9, 836(x3)
sw x1, 800(x3)
sw x4, 616(x3)
lw x6, 940(x3)
sll x2, x1, x8
bne x0, x0, skip_nottaken_28 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_28:
sw x9, 912(x3)

# --- Starting Loop 19 (Depth: 1, break at 2, max 10) ---
addi x4, x0, 10
addi x7, x0, 2
addi x8, x0, 0
loop_start_19:
lw x2, 256(x3)

# --- Closing Loop 19 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_exit_19  # Conditional break from loop
blt x8, x4, loop_start_19 # Branch back to loop start
loop_exit_19: # Define loop exit label
# --- Resuming code after Loop 19 ---

bne x0, x0, skip_nottaken_29 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_29:
sub x7, x2, x9
bne x0, x0, skip_nottaken_30 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_30:
sw x7, 364(x3)
beq x0, x0, skip_taken_31 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_31:
beq x0, x0, skip_taken_32 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_32:
sw x8, 828(x3)
beq x0, x0, skip_taken_33 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_33:

# --- Starting Loop 20 (Depth: 1, break at 2, max 7) ---
addi x4, x0, 7
addi x5, x0, 2
addi x6, x0, 0
loop_start_20:
bne x0, x0, skip_nottaken_34 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_34:
bne x0, x0, skip_nottaken_35 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_35:

# --- Closing Loop 20 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_exit_20  # Conditional break from loop
blt x6, x4, loop_start_20 # Branch back to loop start
loop_exit_20: # Define loop exit label
# --- Resuming code after Loop 20 ---

and x4, x8, x1
sw x4, 268(x3)
add x6, x2, x1
lw x7, 512(x3)
lw x8, 832(x3)
sw x5, 564(x3)
sll x8, x9, x5
beq x0, x0, skip_taken_36 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_36:
beq x0, x0, skip_taken_37 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_37:
sub x9, x8, x7
beq x0, x0, skip_taken_38 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_38:

# --- Starting Loop 21 (Depth: 1, break at 4, max 10) ---
addi x4, x0, 10
addi x2, x0, 4
addi x6, x0, 0
loop_start_21:

# --- Starting Loop 22 (Depth: 2, break at 5, max 7) ---
addi x9, x0, 7
addi x7, x0, 5
addi x8, x0, 0
loop_start_22:
bne x0, x0, skip_nottaken_39 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_39:
sw x8, 952(x3)
sw x8, 780(x3)

# --- Closing Loop 22 (Depth: 2) ---
addi x8, x8, 1
beq x8, x7, loop_exit_22  # Conditional break from loop
blt x8, x9, loop_start_22 # Branch back to loop start
loop_exit_22: # Define loop exit label
# --- Resuming code after Loop 22 ---

beq x0, x0, skip_taken_40 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_40:
bne x0, x0, skip_nottaken_41 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_41:
bne x0, x0, skip_nottaken_42 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_42:
beq x0, x0, skip_taken_43 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_43:

# --- Closing Loop 21 (Depth: 1) ---
addi x6, x6, 1
beq x6, x2, loop_exit_21  # Conditional break from loop
blt x6, x4, loop_start_21 # Branch back to loop start
loop_exit_21: # Define loop exit label
# --- Resuming code after Loop 21 ---

lw x4, 780(x3)
bne x0, x0, skip_nottaken_44 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_44:
sw x4, 344(x3)
beq x0, x0, skip_taken_45 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_45:
and x6, x2, x7
beq x0, x0, skip_taken_46 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_46:
xor x8, x6, x2
beq x0, x0, skip_taken_47 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_47:
lw x6, 480(x3)
beq x0, x0, skip_taken_48 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_48:
beq x0, x0, skip_taken_49 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_49:
lw x8, 592(x3)

# --- Starting Loop 23 (Depth: 1, break at 4, max 9) ---
addi x7, x0, 9
addi x4, x0, 4
addi x5, x0, 0
loop_start_23:

# --- Starting Loop 24 (Depth: 2, break at 1, max 7) ---
addi x6, x0, 7
addi x9, x0, 1
addi x2, x0, 0
loop_start_24:

# --- Closing Loop 24 (Depth: 2) ---
addi x2, x2, 1
beq x2, x9, loop_exit_24  # Conditional break from loop
blt x2, x6, loop_start_24 # Branch back to loop start
loop_exit_24: # Define loop exit label
# --- Resuming code after Loop 24 ---

add x2, x2, x7
xor x2, x2, x1
bne x0, x0, skip_nottaken_50 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_50:

# --- Closing Loop 23 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_23  # Conditional break from loop
blt x5, x7, loop_start_23 # Branch back to loop start
loop_exit_23: # Define loop exit label
# --- Resuming code after Loop 23 ---

bne x0, x0, skip_nottaken_51 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_51:
lw x2, 456(x3)
lw x5, 372(x3)
bne x0, x0, skip_nottaken_52 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_52:
lw x5, 632(x3)
sw x5, 348(x3)
lw x2, 196(x3)
beq x0, x0, skip_taken_53 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_53:
lw x5, 844(x3)
lw x7, 976(x3)
sw x7, 740(x3)
srl x6, x9, x4
bne x0, x0, skip_nottaken_54 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_54:
lw x7, 316(x3)
lw x6, 724(x3)
lw x2, 756(x3)

# --- Starting Loop 25 (Depth: 1, break at 4, max 10) ---
addi x9, x0, 10
addi x8, x0, 4
addi x7, x0, 0
loop_start_25:
beq x0, x0, skip_taken_55 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_55:

# --- Closing Loop 25 (Depth: 1) ---
addi x7, x7, 1
beq x7, x8, loop_exit_25  # Conditional break from loop
blt x7, x9, loop_start_25 # Branch back to loop start
loop_exit_25: # Define loop exit label
# --- Resuming code after Loop 25 ---

sw x7, 324(x3)
sw x9, 488(x3)
sw x2, 772(x3)
sll x4, x8, x1
add x7, x5, x2
bne x0, x0, skip_nottaken_56 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_56:
bne x0, x0, skip_nottaken_57 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_57:
sw x7, 608(x3)

# --- Starting Loop 26 (Depth: 1, break at 3, max 7) ---
addi x7, x0, 7
addi x6, x0, 3
addi x8, x0, 0
loop_start_26:

# --- Closing Loop 26 (Depth: 1) ---
addi x8, x8, 1
beq x8, x6, loop_exit_26  # Conditional break from loop
blt x8, x7, loop_start_26 # Branch back to loop start
loop_exit_26: # Define loop exit label
# --- Resuming code after Loop 26 ---


# --- Starting Loop 27 (Depth: 1, break at 1, max 4) ---
addi x9, x0, 4
addi x4, x0, 1
addi x7, x0, 0
loop_start_27:
beq x0, x0, skip_taken_58 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_58:
sw x9, 516(x3)

# --- Closing Loop 27 (Depth: 1) ---
addi x7, x7, 1
beq x7, x4, loop_exit_27  # Conditional break from loop
blt x7, x9, loop_start_27 # Branch back to loop start
loop_exit_27: # Define loop exit label
# --- Resuming code after Loop 27 ---


# --- Starting Loop 28 (Depth: 1, break at 2, max 8) ---
addi x8, x0, 8
addi x7, x0, 2
addi x6, x0, 0
loop_start_28:
srl x4, x6, x8

# --- Starting Loop 29 (Depth: 2, break at 2, max 3) ---
addi x6, x0, 3
addi x2, x0, 2
addi x7, x0, 0
loop_start_29:

# --- Closing Loop 29 (Depth: 2) ---
addi x7, x7, 1
beq x7, x2, loop_exit_29  # Conditional break from loop
blt x7, x6, loop_start_29 # Branch back to loop start
loop_exit_29: # Define loop exit label
# --- Resuming code after Loop 29 ---


# --- Starting Loop 30 (Depth: 2, break at 5, max 8) ---
addi x5, x0, 8
addi x6, x0, 5
addi x4, x0, 0
loop_start_30:
lw x1, 600(x3)
beq x0, x0, skip_taken_59 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_59:
lw x2, 884(x3)

# --- Closing Loop 30 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_exit_30  # Conditional break from loop
blt x4, x5, loop_start_30 # Branch back to loop start
loop_exit_30: # Define loop exit label
# --- Resuming code after Loop 30 ---


# --- Closing Loop 28 (Depth: 1) ---
addi x6, x6, 1
beq x6, x7, loop_exit_28  # Conditional break from loop
blt x6, x8, loop_start_28 # Branch back to loop start
loop_exit_28: # Define loop exit label
# --- Resuming code after Loop 28 ---

sw x2, 404(x3)
sw x9, 228(x3)
srl x2, x7, x9
sw x2, 44(x3)
beq x0, x0, skip_taken_60 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_60:
sw x5, 624(x3)
lw x1, 156(x3)
bne x0, x0, skip_nottaken_61 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_61:
bne x0, x0, skip_nottaken_62 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_62:
beq x0, x0, skip_taken_63 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_63:
bne x0, x0, skip_nottaken_64 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_64:
sw x1, 956(x3)
sw x9, 448(x3)

# --- Starting Loop 31 (Depth: 1, break at 5, max 7) ---
addi x6, x0, 7
addi x9, x0, 5
addi x2, x0, 0
loop_start_31:
bne x0, x0, skip_nottaken_65 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_65:

# --- Closing Loop 31 (Depth: 1) ---
addi x2, x2, 1
beq x2, x9, loop_exit_31  # Conditional break from loop
blt x2, x6, loop_start_31 # Branch back to loop start
loop_exit_31: # Define loop exit label
# --- Resuming code after Loop 31 ---

sw x2, 512(x3)
or x8, x9, x1
lw x8, 36(x3)
sw x2, 584(x3)

# --- Starting Loop 32 (Depth: 1, break at 5, max 6) ---
addi x9, x0, 6
addi x8, x0, 5
addi x2, x0, 0
loop_start_32:
sw x7, 692(x3)
bne x0, x0, skip_nottaken_66 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_66:
add x8, x2, x9
bne x0, x0, skip_nottaken_67 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_67:
srl x8, x7, x7
lw x2, 788(x3)
and x8, x2, x1
sub x2, x8, x7
bne x0, x0, skip_nottaken_68 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_68:
lw x4, 292(x3)
sub x6, x4, x9
lw x6, 448(x3)
bne x0, x0, skip_nottaken_69 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_69:
sw x6, 676(x3)
lw x2, 672(x3)
sw x2, 136(x3)
beq x0, x0, skip_taken_70 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_70:

# --- Closing Loop 32 (Depth: 1) ---
addi x2, x2, 1
beq x2, x8, loop_exit_32  # Conditional break from loop
blt x2, x9, loop_start_32 # Branch back to loop start
loop_exit_32: # Define loop exit label
# --- Resuming code after Loop 32 ---

sll x5, x1, x2

# --- Starting Loop 33 (Depth: 1, break at 4, max 5) ---
addi x4, x0, 5
addi x7, x0, 4
addi x9, x0, 0
loop_start_33:
beq x0, x0, skip_taken_71 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_71:

# --- Closing Loop 33 (Depth: 1) ---
addi x9, x9, 1
beq x9, x7, loop_exit_33  # Conditional break from loop
blt x9, x4, loop_start_33 # Branch back to loop start
loop_exit_33: # Define loop exit label
# --- Resuming code after Loop 33 ---


# --- Starting Loop 34 (Depth: 1, break at 2, max 6) ---
addi x5, x0, 6
addi x6, x0, 2
addi x8, x0, 0
loop_start_34:
sw x8, 376(x3)
beq x0, x0, skip_taken_72 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_72:
bne x0, x0, skip_nottaken_73 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_73:
beq x0, x0, skip_taken_74 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_74:
or x4, x1, x9
bne x0, x0, skip_nottaken_75 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_75:

# --- Starting Loop 35 (Depth: 2, break at 3, max 7) ---
addi x1, x0, 7
addi x5, x0, 3
addi x6, x0, 0
loop_start_35:
lw x2, 164(x3)
sw x2, 716(x3)

# --- Closing Loop 35 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_exit_35  # Conditional break from loop
blt x6, x1, loop_start_35 # Branch back to loop start
loop_exit_35: # Define loop exit label
# --- Resuming code after Loop 35 ---


# --- Starting Loop 36 (Depth: 2, break at 4, max 5) ---
addi x2, x0, 5
addi x5, x0, 4
addi x7, x0, 0
loop_start_36:
lw x5, 680(x3)
lw x6, 788(x3)

# --- Starting Loop 37 (Depth: 3, break at 3, max 10) ---
addi x8, x0, 10
addi x2, x0, 3
addi x1, x0, 0
loop_start_37:

# --- Closing Loop 37 (Depth: 3) ---
addi x1, x1, 1
beq x1, x2, loop_exit_37  # Conditional break from loop
blt x1, x8, loop_start_37 # Branch back to loop start
loop_exit_37: # Define loop exit label
# --- Resuming code after Loop 37 ---

sll x4, x1, x1
sw x4, 668(x3)
sw x8, 848(x3)
beq x0, x0, skip_taken_76 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_76:
srl x2, x6, x1
sw x5, 48(x3)

# --- Closing Loop 36 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_exit_36  # Conditional break from loop
blt x7, x2, loop_start_36 # Branch back to loop start
loop_exit_36: # Define loop exit label
# --- Resuming code after Loop 36 ---

lw x9, 516(x3)
lw x9, 104(x3)
sw x9, 424(x3)
lw x6, 924(x3)

# --- Closing Loop 34 (Depth: 1) ---
addi x8, x8, 1
beq x8, x6, loop_exit_34  # Conditional break from loop
blt x8, x5, loop_start_34 # Branch back to loop start
loop_exit_34: # Define loop exit label
# --- Resuming code after Loop 34 ---

bne x0, x0, skip_nottaken_77 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_77:
xor x2, x6, x4
bne x0, x0, skip_nottaken_78 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_78:
sub x2, x2, x1
or x5, x1, x6

# --- Starting Loop 38 (Depth: 1, break at 5, max 7) ---
addi x4, x0, 7
addi x9, x0, 5
addi x6, x0, 0
loop_start_38:

# --- Closing Loop 38 (Depth: 1) ---
addi x6, x6, 1
beq x6, x9, loop_exit_38  # Conditional break from loop
blt x6, x4, loop_start_38 # Branch back to loop start
loop_exit_38: # Define loop exit label
# --- Resuming code after Loop 38 ---


# --- Starting Loop 39 (Depth: 1, break at 5, max 8) ---
addi x4, x0, 8
addi x7, x0, 5
addi x8, x0, 0
loop_start_39:
sw x8, 712(x3)
sw x1, 524(x3)
lw x8, 728(x3)
bne x0, x0, skip_nottaken_79 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_79:

# --- Closing Loop 39 (Depth: 1) ---
addi x8, x8, 1
beq x8, x7, loop_exit_39  # Conditional break from loop
blt x8, x4, loop_start_39 # Branch back to loop start
loop_exit_39: # Define loop exit label
# --- Resuming code after Loop 39 ---

beq x0, x0, skip_taken_80 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_80:
lw x7, 840(x3)
sw x7, 184(x3)
lw x4, 904(x3)
or x6, x4, x8
bne x0, x0, skip_nottaken_81 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_81:
and x8, x6, x6
lw x4, 416(x3)
lw x1, 564(x3)
bne x0, x0, skip_nottaken_82 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_82:
beq x0, x0, skip_taken_83 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_83:
sw x1, 648(x3)

# --- Starting Loop 40 (Depth: 1, break at 5, max 8) ---
addi x1, x0, 8
addi x2, x0, 5
addi x9, x0, 0
loop_start_40:
lw x2, 540(x3)

# --- Starting Loop 41 (Depth: 2, break at 1, max 9) ---
addi x5, x0, 9
addi x9, x0, 1
addi x1, x0, 0
loop_start_41:
beq x0, x0, skip_taken_84 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_84:
srl x7, x1, x1
and x2, x7, x6
srl x4, x7, x8
sll x7, x4, x9

# --- Starting Loop 42 (Depth: 3, break at 1, max 6) ---
addi x4, x0, 6
addi x1, x0, 1
addi x2, x0, 0
loop_start_42:

# --- Closing Loop 42 (Depth: 3) ---
addi x2, x2, 1
beq x2, x1, loop_exit_42  # Conditional break from loop
blt x2, x4, loop_start_42 # Branch back to loop start
loop_exit_42: # Define loop exit label
# --- Resuming code after Loop 42 ---

lw x7, 564(x3)

# --- Closing Loop 41 (Depth: 2) ---
addi x1, x1, 1
beq x1, x9, loop_exit_41  # Conditional break from loop
blt x1, x5, loop_start_41 # Branch back to loop start
loop_exit_41: # Define loop exit label
# --- Resuming code after Loop 41 ---


# --- Starting Loop 43 (Depth: 2, break at 1, max 8) ---
addi x9, x0, 8
addi x8, x0, 1
addi x1, x0, 0
loop_start_43:
bne x0, x0, skip_nottaken_85 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_85:
sll x4, x8, x2
add x2, x6, x5
sub x9, x2, x6
sw x9, 520(x3)

# --- Closing Loop 43 (Depth: 2) ---
addi x1, x1, 1
beq x1, x8, loop_exit_43  # Conditional break from loop
blt x1, x9, loop_start_43 # Branch back to loop start
loop_exit_43: # Define loop exit label
# --- Resuming code after Loop 43 ---

or x1, x7, x7
bne x0, x0, skip_nottaken_86 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_86:
beq x0, x0, skip_taken_87 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_87:
xor x2, x1, x6

# --- Starting Loop 44 (Depth: 2, break at 3, max 4) ---
addi x1, x0, 4
addi x5, x0, 3
addi x6, x0, 0
loop_start_44:
lw x9, 548(x3)

# --- Closing Loop 44 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_exit_44  # Conditional break from loop
blt x6, x1, loop_start_44 # Branch back to loop start
loop_exit_44: # Define loop exit label
# --- Resuming code after Loop 44 ---


# --- Closing Loop 40 (Depth: 1) ---
addi x9, x9, 1
beq x9, x2, loop_exit_40  # Conditional break from loop
blt x9, x1, loop_start_40 # Branch back to loop start
loop_exit_40: # Define loop exit label
# --- Resuming code after Loop 40 ---

bne x0, x0, skip_nottaken_88 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_88:
beq x0, x0, skip_taken_89 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_89:
beq x0, x0, skip_taken_90 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_90:
sll x2, x6, x8
bne x0, x0, skip_nottaken_91 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_91:
sll x1, x2, x4
lw x4, 68(x3)
and x2, x4, x7

# --- Starting Loop 45 (Depth: 1, break at 3, max 8) ---
addi x4, x0, 8
addi x9, x0, 3
addi x7, x0, 0
loop_start_45:
lw x1, 268(x3)
lw x5, 332(x3)

# --- Closing Loop 45 (Depth: 1) ---
addi x7, x7, 1
beq x7, x9, loop_exit_45  # Conditional break from loop
blt x7, x4, loop_start_45 # Branch back to loop start
loop_exit_45: # Define loop exit label
# --- Resuming code after Loop 45 ---

sll x7, x2, x1
beq x0, x0, skip_taken_92 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_92:
sw x7, 972(x3)
bne x0, x0, skip_nottaken_93 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_93:
lw x1, 268(x3)
lw x8, 140(x3)

# --- Starting Loop 46 (Depth: 1, break at 5, max 9) ---
addi x9, x0, 9
addi x5, x0, 5
addi x6, x0, 0
loop_start_46:
sw x6, 520(x3)
beq x0, x0, skip_taken_94 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_94:
sw x1, 460(x3)
beq x0, x0, skip_taken_95 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_95:
add x1, x4, x4

# --- Closing Loop 46 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_exit_46  # Conditional break from loop
blt x6, x9, loop_start_46 # Branch back to loop start
loop_exit_46: # Define loop exit label
# --- Resuming code after Loop 46 ---

sll x2, x1, x6
beq x0, x0, skip_taken_96 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_96:
sw x2, 264(x3)
or x9, x6, x5
sw x9, 844(x3)

# --- Starting Loop 47 (Depth: 1, break at 2, max 9) ---
addi x5, x0, 9
addi x4, x0, 2
addi x6, x0, 0
loop_start_47:

# --- Closing Loop 47 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_exit_47  # Conditional break from loop
blt x6, x5, loop_start_47 # Branch back to loop start
loop_exit_47: # Define loop exit label
# --- Resuming code after Loop 47 ---


# --- Starting Loop 48 (Depth: 1, break at 3, max 6) ---
addi x4, x0, 6
addi x2, x0, 3
addi x1, x0, 0
loop_start_48:
srl x8, x1, x9
bne x0, x0, skip_nottaken_97 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_97:

# --- Closing Loop 48 (Depth: 1) ---
addi x1, x1, 1
beq x1, x2, loop_exit_48  # Conditional break from loop
blt x1, x4, loop_start_48 # Branch back to loop start
loop_exit_48: # Define loop exit label
# --- Resuming code after Loop 48 ---


# --- Starting Loop 49 (Depth: 1, break at 1, max 7) ---
addi x2, x0, 7
addi x1, x0, 1
addi x7, x0, 0
loop_start_49:
sub x6, x7, x7
sw x6, 136(x3)
beq x0, x0, skip_taken_98 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_98:

# --- Closing Loop 49 (Depth: 1) ---
addi x7, x7, 1
beq x7, x1, loop_exit_49  # Conditional break from loop
blt x7, x2, loop_start_49 # Branch back to loop start
loop_exit_49: # Define loop exit label
# --- Resuming code after Loop 49 ---

lw x1, 864(x3)

# --- Starting Loop 50 (Depth: 1, break at 1, max 9) ---
addi x7, x0, 9
addi x6, x0, 1
addi x5, x0, 0
loop_start_50:
lw x2, 332(x3)
and x2, x2, x7
lw x7, 272(x3)
bne x0, x0, skip_nottaken_99 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_99:
or x1, x6, x5
add x9, x4, x8
add x8, x9, x9
beq x0, x0, skip_taken_100 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_100:
sw x8, 964(x3)

# --- Starting Loop 51 (Depth: 2, break at 3, max 8) ---
addi x6, x0, 8
addi x2, x0, 3
addi x5, x0, 0
loop_start_51:
or x8, x5, x1

# --- Starting Loop 52 (Depth: 3, break at 4, max 5) ---
addi x2, x0, 5
addi x9, x0, 4
addi x5, x0, 0
loop_start_52:
lw x1, 820(x3)
or x9, x1, x2

# --- Closing Loop 52 (Depth: 3) ---
addi x5, x5, 1
beq x5, x9, loop_exit_52  # Conditional break from loop
blt x5, x2, loop_start_52 # Branch back to loop start
loop_exit_52: # Define loop exit label
# --- Resuming code after Loop 52 ---


# --- Closing Loop 51 (Depth: 2) ---
addi x5, x5, 1
beq x5, x2, loop_exit_51  # Conditional break from loop
blt x5, x6, loop_start_51 # Branch back to loop start
loop_exit_51: # Define loop exit label
# --- Resuming code after Loop 51 ---


# --- Starting Loop 53 (Depth: 2, break at 2, max 9) ---
addi x6, x0, 9
addi x7, x0, 2
addi x4, x0, 0
loop_start_53:
beq x0, x0, skip_taken_101 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_101:
bne x0, x0, skip_nottaken_102 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_102:
sw x4, 336(x3)
beq x0, x0, skip_taken_103 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_103:

# --- Closing Loop 53 (Depth: 2) ---
addi x4, x4, 1
beq x4, x7, loop_exit_53  # Conditional break from loop
blt x4, x6, loop_start_53 # Branch back to loop start
loop_exit_53: # Define loop exit label
# --- Resuming code after Loop 53 ---

or x6, x4, x1
bne x0, x0, skip_nottaken_104 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_104:

# --- Starting Loop 54 (Depth: 2, break at 3, max 6) ---
addi x4, x0, 6
addi x5, x0, 3
addi x7, x0, 0
loop_start_54:
sw x7, 276(x3)
beq x0, x0, skip_taken_105 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_105:
beq x0, x0, skip_taken_106 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_106:
beq x0, x0, skip_taken_107 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_107:
beq x0, x0, skip_taken_108 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_108:

# --- Closing Loop 54 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_exit_54  # Conditional break from loop
blt x7, x4, loop_start_54 # Branch back to loop start
loop_exit_54: # Define loop exit label
# --- Resuming code after Loop 54 ---


# --- Closing Loop 50 (Depth: 1) ---
addi x5, x5, 1
beq x5, x6, loop_exit_50  # Conditional break from loop
blt x5, x7, loop_start_50 # Branch back to loop start
loop_exit_50: # Define loop exit label
# --- Resuming code after Loop 50 ---

sub x4, x5, x8
bne x0, x0, skip_nottaken_109 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_109:
sw x4, 648(x3)
lw x4, 436(x3)
lw x1, 244(x3)
lw x6, 236(x3)
bne x0, x0, skip_nottaken_110 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_110:

# --- Starting Loop 55 (Depth: 1, break at 1, max 8) ---
addi x8, x0, 8
addi x5, x0, 1
addi x9, x0, 0
loop_start_55:

# --- Closing Loop 55 (Depth: 1) ---
addi x9, x9, 1
beq x9, x5, loop_exit_55  # Conditional break from loop
blt x9, x8, loop_start_55 # Branch back to loop start
loop_exit_55: # Define loop exit label
# --- Resuming code after Loop 55 ---

lw x5, 160(x3)

# --- Starting Loop 56 (Depth: 1, break at 5, max 9) ---
addi x6, x0, 9
addi x7, x0, 5
addi x1, x0, 0
loop_start_56:
sub x4, x1, x8
bne x0, x0, skip_nottaken_111 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_111:
beq x0, x0, skip_taken_112 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_112:
xor x1, x4, x8
bne x0, x0, skip_nottaken_113 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_113:
sw x9, 548(x3)
bne x0, x0, skip_nottaken_114 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_114:

# --- Closing Loop 56 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_exit_56  # Conditional break from loop
blt x1, x6, loop_start_56 # Branch back to loop start
loop_exit_56: # Define loop exit label
# --- Resuming code after Loop 56 ---

add x5, x9, x2
sw x5, 752(x3)

# --- Starting Loop 57 (Depth: 1, break at 2, max 4) ---
addi x4, x0, 4
addi x2, x0, 2
addi x5, x0, 0
loop_start_57:

# --- Closing Loop 57 (Depth: 1) ---
addi x5, x5, 1
beq x5, x2, loop_exit_57  # Conditional break from loop
blt x5, x4, loop_start_57 # Branch back to loop start
loop_exit_57: # Define loop exit label
# --- Resuming code after Loop 57 ---

beq x0, x0, skip_taken_115 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_115:
lw x7, 452(x3)

# --- Starting Loop 58 (Depth: 1, break at 1, max 3) ---
addi x6, x0, 3
addi x5, x0, 1
addi x9, x0, 0
loop_start_58:

# --- Closing Loop 58 (Depth: 1) ---
addi x9, x9, 1
beq x9, x5, loop_exit_58  # Conditional break from loop
blt x9, x6, loop_start_58 # Branch back to loop start
loop_exit_58: # Define loop exit label
# --- Resuming code after Loop 58 ---

bne x0, x0, skip_nottaken_116 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_116:
lw x6, 492(x3)
beq x0, x0, skip_taken_117 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_117:
and x7, x1, x9
beq x0, x0, skip_taken_118 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_118:

# --- Starting Loop 59 (Depth: 1, break at 4, max 7) ---
addi x9, x0, 7
addi x8, x0, 4
addi x6, x0, 0
loop_start_59:
bne x0, x0, skip_nottaken_119 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_119:
beq x0, x0, skip_taken_120 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_120:

# --- Starting Loop 60 (Depth: 2, break at 4, max 5) ---
addi x2, x0, 5
addi x9, x0, 4
addi x1, x0, 0
loop_start_60:
sw x9, 464(x3)

# --- Closing Loop 60 (Depth: 2) ---
addi x1, x1, 1
beq x1, x9, loop_exit_60  # Conditional break from loop
blt x1, x2, loop_start_60 # Branch back to loop start
loop_exit_60: # Define loop exit label
# --- Resuming code after Loop 60 ---


# --- Starting Loop 61 (Depth: 2, break at 1, max 8) ---
addi x8, x0, 8
addi x6, x0, 1
addi x5, x0, 0
loop_start_61:

# --- Closing Loop 61 (Depth: 2) ---
addi x5, x5, 1
beq x5, x6, loop_exit_61  # Conditional break from loop
blt x5, x8, loop_start_61 # Branch back to loop start
loop_exit_61: # Define loop exit label
# --- Resuming code after Loop 61 ---

beq x0, x0, skip_taken_121 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_121:
beq x0, x0, skip_taken_122 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_122:
bne x0, x0, skip_nottaken_123 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_123:

# --- Closing Loop 59 (Depth: 1) ---
addi x6, x6, 1
beq x6, x8, loop_exit_59  # Conditional break from loop
blt x6, x9, loop_start_59 # Branch back to loop start
loop_exit_59: # Define loop exit label
# --- Resuming code after Loop 59 ---

sw x5, 200(x3)
bne x0, x0, skip_nottaken_124 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_124:
lw x4, 696(x3)

# --- Starting Loop 62 (Depth: 1, break at 4, max 5) ---
addi x6, x0, 5
addi x9, x0, 4
addi x1, x0, 0
loop_start_62:
add x6, x1, x8
lw x4, 836(x3)
sw x4, 988(x3)
add x9, x8, x4

# --- Starting Loop 63 (Depth: 2, break at 1, max 7) ---
addi x1, x0, 7
addi x4, x0, 1
addi x6, x0, 0
loop_start_63:

# --- Starting Loop 64 (Depth: 3, break at 2, max 4) ---
addi x7, x0, 4
addi x4, x0, 2
addi x5, x0, 0
loop_start_64:
lw x9, 888(x3)
sw x9, 388(x3)
xor x6, x1, x2
beq x0, x0, skip_taken_125 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_125:

# --- Closing Loop 64 (Depth: 3) ---
addi x5, x5, 1
beq x5, x4, loop_exit_64  # Conditional break from loop
blt x5, x7, loop_start_64 # Branch back to loop start
loop_exit_64: # Define loop exit label
# --- Resuming code after Loop 64 ---

sw x6, 516(x3)
lw x4, 256(x3)
and x4, x4, x8
add x4, x9, x7
sw x4, 268(x3)
add x2, x4, x8
sw x2, 288(x3)
bne x0, x0, skip_nottaken_126 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_126:
add x5, x4, x7

# --- Closing Loop 63 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_63  # Conditional break from loop
blt x6, x1, loop_start_63 # Branch back to loop start
loop_exit_63: # Define loop exit label
# --- Resuming code after Loop 63 ---


# --- Starting Loop 65 (Depth: 2, break at 4, max 7) ---
addi x7, x0, 7
addi x6, x0, 4
addi x8, x0, 0
loop_start_65:
sw x1, 344(x3)
sw x2, 980(x3)
and x8, x6, x4
lw x8, 268(x3)
beq x0, x0, skip_taken_127 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_127:
sw x8, 984(x3)
sw x5, 668(x3)

# --- Starting Loop 66 (Depth: 3, break at 2, max 9) ---
addi x6, x0, 9
addi x7, x0, 2
addi x9, x0, 0
loop_start_66:

# --- Starting Loop 67 (Depth: 4, break at 1, max 9) ---
addi x1, x0, 9
addi x7, x0, 1
addi x2, x0, 0
loop_start_67:

# --- Closing Loop 67 (Depth: 4) ---
addi x2, x2, 1
beq x2, x7, loop_exit_67  # Conditional break from loop
blt x2, x1, loop_start_67 # Branch back to loop start
loop_exit_67: # Define loop exit label
# --- Resuming code after Loop 67 ---


# --- Closing Loop 66 (Depth: 3) ---
addi x9, x9, 1
beq x9, x7, loop_exit_66  # Conditional break from loop
blt x9, x6, loop_start_66 # Branch back to loop start
loop_exit_66: # Define loop exit label
# --- Resuming code after Loop 66 ---

sw x2, 992(x3)

# --- Closing Loop 65 (Depth: 2) ---
addi x8, x8, 1
beq x8, x6, loop_exit_65  # Conditional break from loop
blt x8, x7, loop_start_65 # Branch back to loop start
loop_exit_65: # Define loop exit label
# --- Resuming code after Loop 65 ---

beq x0, x0, skip_taken_128 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_128:

# --- Starting Loop 68 (Depth: 2, break at 5, max 7) ---
addi x9, x0, 7
addi x6, x0, 5
addi x2, x0, 0
loop_start_68:
srl x5, x2, x1
or x7, x5, x1
lw x4, 980(x3)

# --- Starting Loop 69 (Depth: 3, break at 4, max 10) ---
addi x7, x0, 10
addi x2, x0, 4
addi x8, x0, 0
loop_start_69:

# --- Closing Loop 69 (Depth: 3) ---
addi x8, x8, 1
beq x8, x2, loop_exit_69  # Conditional break from loop
blt x8, x7, loop_start_69 # Branch back to loop start
loop_exit_69: # Define loop exit label
# --- Resuming code after Loop 69 ---

bne x0, x0, skip_nottaken_129 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_129:
bne x0, x0, skip_nottaken_130 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_130:
beq x0, x0, skip_taken_131 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_131:
srl x8, x8, x4
beq x0, x0, skip_taken_132 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_132:
sub x2, x7, x4
beq x0, x0, skip_taken_133 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_133:

# --- Closing Loop 68 (Depth: 2) ---
addi x2, x2, 1
beq x2, x6, loop_exit_68  # Conditional break from loop
blt x2, x9, loop_start_68 # Branch back to loop start
loop_exit_68: # Define loop exit label
# --- Resuming code after Loop 68 ---

lw x6, 572(x3)
beq x0, x0, skip_taken_134 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_134:
lw x8, 288(x3)
or x9, x8, x4
beq x0, x0, skip_taken_135 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_135:
sub x5, x9, x8
beq x0, x0, skip_taken_136 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_136:
beq x0, x0, skip_taken_137 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_137:
sw x5, 36(x3)
beq x0, x0, skip_taken_138 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_138:

# --- Closing Loop 62 (Depth: 1) ---
addi x1, x1, 1
beq x1, x9, loop_exit_62  # Conditional break from loop
blt x1, x6, loop_start_62 # Branch back to loop start
loop_exit_62: # Define loop exit label
# --- Resuming code after Loop 62 ---

lw x8, 360(x3)
or x7, x8, x1
bne x0, x0, skip_nottaken_139 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_139:
bne x0, x0, skip_nottaken_140 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_140:
lw x7, 912(x3)
beq x0, x0, skip_taken_141 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_141:
sw x7, 412(x3)

# --- Starting Loop 70 (Depth: 1, break at 5, max 10) ---
addi x6, x0, 10
addi x2, x0, 5
addi x4, x0, 0
loop_start_70:
xor x5, x4, x1
lw x1, 260(x3)

# --- Closing Loop 70 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_exit_70  # Conditional break from loop
blt x4, x6, loop_start_70 # Branch back to loop start
loop_exit_70: # Define loop exit label
# --- Resuming code after Loop 70 ---

sw x1, 216(x3)
xor x9, x4, x2
beq x0, x0, skip_taken_142 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_142:
lw x6, 476(x3)
bne x0, x0, skip_nottaken_143 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_143:
srl x8, x5, x7
add x2, x8, x5
sub x5, x2, x9
beq x0, x0, skip_taken_144 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_144:
lw x2, 796(x3)
sw x2, 408(x3)
beq x0, x0, skip_taken_145 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_145:
and x5, x9, x4
beq x0, x0, skip_taken_146 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_146:

# --- Starting Loop 71 (Depth: 1, break at 4, max 6) ---
addi x1, x0, 6
addi x4, x0, 4
addi x8, x0, 0
loop_start_71:
beq x0, x0, skip_taken_147 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_147:

# --- Closing Loop 71 (Depth: 1) ---
addi x8, x8, 1
beq x8, x4, loop_exit_71  # Conditional break from loop
blt x8, x1, loop_start_71 # Branch back to loop start
loop_exit_71: # Define loop exit label
# --- Resuming code after Loop 71 ---

lw x7, 704(x3)
sw x7, 636(x3)

# --- Starting Loop 72 (Depth: 1, break at 1, max 9) ---
addi x8, x0, 9
addi x2, x0, 1
addi x5, x0, 0
loop_start_72:
bne x0, x0, skip_nottaken_148 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_148:
and x4, x2, x9

# --- Starting Loop 73 (Depth: 2, break at 2, max 7) ---
addi x2, x0, 7
addi x8, x0, 2
addi x5, x0, 0
loop_start_73:

# --- Closing Loop 73 (Depth: 2) ---
addi x5, x5, 1
beq x5, x8, loop_exit_73  # Conditional break from loop
blt x5, x2, loop_start_73 # Branch back to loop start
loop_exit_73: # Define loop exit label
# --- Resuming code after Loop 73 ---

srl x4, x7, x6
lw x7, 364(x3)
beq x0, x0, skip_taken_149 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_149:
bne x0, x0, skip_nottaken_150 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_150:
beq x0, x0, skip_taken_151 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_151:

# --- Closing Loop 72 (Depth: 1) ---
addi x5, x5, 1
beq x5, x2, loop_exit_72  # Conditional break from loop
blt x5, x8, loop_start_72 # Branch back to loop start
loop_exit_72: # Define loop exit label
# --- Resuming code after Loop 72 ---

bne x0, x0, skip_nottaken_152 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_152:
sw x7, 172(x3)

# --- Final cleanup: Closing all remaining open loops ---

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
