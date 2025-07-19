# Initialize memory base register x3
lui x3, 2
addi x3, x3, 0


# --- Starting Loop 1 (Depth: 1, break at 5, max 8) ---
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_1:
lw x4, 992(x3)

# --- Starting Loop 2 (Depth: 2, break at 4, max 9) ---
addi x5, x0, 9
addi x2, x0, 4
addi x1, x0, 0
loop_start_2:

# --- Starting Loop 3 (Depth: 3, break at 5, max 8) ---
addi x7, x0, 8
addi x4, x0, 5
addi x5, x0, 0
loop_start_3:
lw x1, 892(x3)
beq x0, x0, skip_taken_1 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_1:

# --- Starting Loop 4 (Depth: 4, break at 5, max 7) ---
addi x5, x0, 7
addi x4, x0, 5
addi x7, x0, 0
loop_start_4:
srl x2, x7, x7

# --- Closing Loop 4 (Depth: 4) ---
addi x7, x7, 1
beq x7, x4, loop_exit_4  # Conditional break from loop
blt x7, x5, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---


# --- Closing Loop 3 (Depth: 3) ---
addi x5, x5, 1
beq x5, x4, loop_exit_3  # Conditional break from loop
blt x5, x7, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---


# --- Closing Loop 2 (Depth: 2) ---
addi x1, x1, 1
beq x1, x2, loop_exit_2  # Conditional break from loop
blt x1, x5, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---

sw x1, 692(x3)
lw x7, 140(x3)
sw x6, 456(x3)
beq x0, x0, skip_taken_2 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_2:

# --- Closing Loop 1 (Depth: 1) ---
addi x2, x2, 1
beq x2, x1, loop_exit_1  # Conditional break from loop
blt x2, x5, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---

bne x0, x0, skip_nottaken_3 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_3:

# --- Starting Loop 5 (Depth: 1, break at 5, max 8) ---
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_5:

# --- Starting Loop 6 (Depth: 2, break at 2, max 7) ---
addi x1, x0, 7
addi x6, x0, 2
addi x4, x0, 0
loop_start_6:
beq x0, x0, skip_taken_4 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_4:

# --- Closing Loop 6 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_exit_6  # Conditional break from loop
blt x4, x1, loop_start_6 # Branch back to loop start
loop_exit_6: # Define loop exit label
# --- Resuming code after Loop 6 ---

add x4, x4, x2
xor x4, x1, x2
add x7, x4, x2
beq x0, x0, skip_taken_5 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_5:

# --- Closing Loop 5 (Depth: 1) ---
addi x2, x2, 1
beq x2, x1, loop_exit_5  # Conditional break from loop
blt x2, x5, loop_start_5 # Branch back to loop start
loop_exit_5: # Define loop exit label
# --- Resuming code after Loop 5 ---


# --- Starting Loop 7 (Depth: 1, break at 2, max 8) ---
addi x2, x0, 8
addi x5, x0, 2
addi x4, x0, 0
loop_start_7:
sw x2, 464(x3)
beq x0, x0, skip_taken_6 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_6:
sw x5, 680(x3)

# --- Closing Loop 7 (Depth: 1) ---
addi x4, x4, 1
beq x4, x5, loop_exit_7  # Conditional break from loop
blt x4, x2, loop_start_7 # Branch back to loop start
loop_exit_7: # Define loop exit label
# --- Resuming code after Loop 7 ---

beq x0, x0, skip_taken_7 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_7:

# --- Starting Loop 8 (Depth: 1, break at 4, max 9) ---
addi x1, x0, 9
addi x7, x0, 4
addi x5, x0, 0
loop_start_8:
sw x1, 36(x3)
sll x1, x7, x6

# --- Starting Loop 9 (Depth: 2, break at 4, max 5) ---
addi x2, x0, 5
addi x7, x0, 4
addi x6, x0, 0
loop_start_9:
lw x2, 456(x3)
sw x2, 520(x3)

# --- Starting Loop 10 (Depth: 3, break at 5, max 6) ---
addi x4, x0, 6
addi x6, x0, 5
addi x2, x0, 0
loop_start_10:
beq x0, x0, skip_taken_8 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_8:

# --- Closing Loop 10 (Depth: 3) ---
addi x2, x2, 1
beq x2, x6, loop_exit_10  # Conditional break from loop
blt x2, x4, loop_start_10 # Branch back to loop start
loop_exit_10: # Define loop exit label
# --- Resuming code after Loop 10 ---

sw x6, 92(x3)
beq x0, x0, skip_taken_9 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_9:

# --- Closing Loop 9 (Depth: 2) ---
addi x6, x6, 1
beq x6, x7, loop_exit_9  # Conditional break from loop
blt x6, x2, loop_start_9 # Branch back to loop start
loop_exit_9: # Define loop exit label
# --- Resuming code after Loop 9 ---

sw x4, 292(x3)
bne x0, x0, skip_nottaken_10 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_10:

# --- Starting Loop 11 (Depth: 2, break at 3, max 9) ---
addi x1, x0, 9
addi x2, x0, 3
addi x4, x0, 0
loop_start_11:
and x2, x7, x7
beq x0, x0, skip_taken_11 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_11:
beq x0, x0, skip_taken_12 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_12:
lw x5, 128(x3)
sw x5, 376(x3)
xor x1, x6, x5
sw x1, 872(x3)

# --- Starting Loop 12 (Depth: 3, break at 1, max 5) ---
addi x1, x0, 5
addi x5, x0, 1
addi x2, x0, 0
loop_start_12:
lw x5, 704(x3)
bne x0, x0, skip_nottaken_13 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_13:
srl x5, x2, x2
srl x6, x1, x1

# --- Starting Loop 13 (Depth: 4, break at 4, max 7) ---
addi x2, x0, 7
addi x4, x0, 4
addi x5, x0, 0
loop_start_13:

# --- Closing Loop 13 (Depth: 4) ---
addi x5, x5, 1
beq x5, x4, loop_exit_13  # Conditional break from loop
blt x5, x2, loop_start_13 # Branch back to loop start
loop_exit_13: # Define loop exit label
# --- Resuming code after Loop 13 ---

beq x0, x0, skip_taken_14 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_14:
sll x5, x5, x4
beq x0, x0, skip_taken_15 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_15:
sw x7, 548(x3)
lw x2, 932(x3)
beq x0, x0, skip_taken_16 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_16:
beq x0, x0, skip_taken_17 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_17:

# --- Closing Loop 12 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_exit_12  # Conditional break from loop
blt x2, x1, loop_start_12 # Branch back to loop start
loop_exit_12: # Define loop exit label
# --- Resuming code after Loop 12 ---

sll x2, x7, x7

# --- Closing Loop 11 (Depth: 2) ---
addi x4, x4, 1
beq x4, x2, loop_exit_11  # Conditional break from loop
blt x4, x1, loop_start_11 # Branch back to loop start
loop_exit_11: # Define loop exit label
# --- Resuming code after Loop 11 ---


# --- Closing Loop 8 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_exit_8  # Conditional break from loop
blt x5, x1, loop_start_8 # Branch back to loop start
loop_exit_8: # Define loop exit label
# --- Resuming code after Loop 8 ---

lw x1, 620(x3)
beq x0, x0, skip_taken_18 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_18:

# --- Starting Loop 14 (Depth: 1, break at 2, max 10) ---
addi x6, x0, 10
addi x4, x0, 2
addi x2, x0, 0
loop_start_14:

# --- Closing Loop 14 (Depth: 1) ---
addi x2, x2, 1
beq x2, x4, loop_exit_14  # Conditional break from loop
blt x2, x6, loop_start_14 # Branch back to loop start
loop_exit_14: # Define loop exit label
# --- Resuming code after Loop 14 ---

beq x0, x0, skip_taken_19 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_19:

# --- Starting Loop 15 (Depth: 1, break at 2, max 9) ---
addi x4, x0, 9
addi x5, x0, 2
addi x7, x0, 0
loop_start_15:
or x2, x7, x4

# --- Closing Loop 15 (Depth: 1) ---
addi x7, x7, 1
beq x7, x5, loop_exit_15  # Conditional break from loop
blt x7, x4, loop_start_15 # Branch back to loop start
loop_exit_15: # Define loop exit label
# --- Resuming code after Loop 15 ---


# --- Starting Loop 16 (Depth: 1, break at 4, max 6) ---
addi x5, x0, 6
addi x7, x0, 4
addi x1, x0, 0
loop_start_16:
lw x7, 360(x3)
sw x4, 800(x3)

# --- Closing Loop 16 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_exit_16  # Conditional break from loop
blt x1, x5, loop_start_16 # Branch back to loop start
loop_exit_16: # Define loop exit label
# --- Resuming code after Loop 16 ---

bne x0, x0, skip_nottaken_20 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_20:
srl x7, x6, x5

# --- Starting Loop 17 (Depth: 1, break at 3, max 5) ---
addi x1, x0, 5
addi x5, x0, 3
addi x6, x0, 0
loop_start_17:
sw x4, 68(x3)
lw x1, 712(x3)
bne x0, x0, skip_nottaken_21 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_21:
beq x0, x0, skip_taken_22 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_22:
beq x0, x0, skip_taken_23 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_23:
lw x2, 924(x3)
lw x6, 104(x3)

# --- Closing Loop 17 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_exit_17  # Conditional break from loop
blt x6, x1, loop_start_17 # Branch back to loop start
loop_exit_17: # Define loop exit label
# --- Resuming code after Loop 17 ---

beq x0, x0, skip_taken_24 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_24:

# --- Starting Loop 18 (Depth: 1, break at 4, max 10) ---
addi x7, x0, 10
addi x2, x0, 4
addi x5, x0, 0
loop_start_18:
add x1, x6, x6
lw x5, 80(x3)
lw x2, 716(x3)

# --- Closing Loop 18 (Depth: 1) ---
addi x5, x5, 1
beq x5, x2, loop_exit_18  # Conditional break from loop
blt x5, x7, loop_start_18 # Branch back to loop start
loop_exit_18: # Define loop exit label
# --- Resuming code after Loop 18 ---

bne x0, x0, skip_nottaken_25 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_25:
lw x5, 844(x3)
sw x7, 424(x3)

# --- Starting Loop 19 (Depth: 1, break at 1, max 6) ---
addi x4, x0, 6
addi x6, x0, 1
addi x5, x0, 0
loop_start_19:

# --- Closing Loop 19 (Depth: 1) ---
addi x5, x5, 1
beq x5, x6, loop_exit_19  # Conditional break from loop
blt x5, x4, loop_start_19 # Branch back to loop start
loop_exit_19: # Define loop exit label
# --- Resuming code after Loop 19 ---


# --- Starting Loop 20 (Depth: 1, break at 1, max 5) ---
addi x1, x0, 5
addi x6, x0, 1
addi x2, x0, 0
loop_start_20:
bne x0, x0, skip_nottaken_26 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_26:
beq x0, x0, skip_taken_27 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_27:
sw x7, 980(x3)

# --- Starting Loop 21 (Depth: 2, break at 2, max 7) ---
addi x1, x0, 7
addi x2, x0, 2
addi x4, x0, 0
loop_start_21:

# --- Starting Loop 22 (Depth: 3, break at 1, max 4) ---
addi x5, x0, 4
addi x6, x0, 1
addi x1, x0, 0
loop_start_22:
beq x0, x0, skip_taken_28 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_28:
bne x0, x0, skip_nottaken_29 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_29:
lw x2, 524(x3)

# --- Closing Loop 22 (Depth: 3) ---
addi x1, x1, 1
beq x1, x6, loop_exit_22  # Conditional break from loop
blt x1, x5, loop_start_22 # Branch back to loop start
loop_exit_22: # Define loop exit label
# --- Resuming code after Loop 22 ---

sub x7, x2, x4
beq x0, x0, skip_taken_30 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_30:
beq x0, x0, skip_taken_31 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_31:
lw x6, 732(x3)
add x1, x6, x4
add x7, x5, x2

# --- Starting Loop 23 (Depth: 3, break at 4, max 6) ---
addi x4, x0, 6
addi x6, x0, 4
addi x1, x0, 0
loop_start_23:
beq x0, x0, skip_taken_32 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_32:
lw x6, 804(x3)
beq x0, x0, skip_taken_33 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_33:

# --- Starting Loop 24 (Depth: 4, break at 2, max 4) ---
addi x5, x0, 4
addi x7, x0, 2
addi x4, x0, 0
loop_start_24:

# --- Closing Loop 24 (Depth: 4) ---
addi x4, x4, 1
beq x4, x7, loop_exit_24  # Conditional break from loop
blt x4, x5, loop_start_24 # Branch back to loop start
loop_exit_24: # Define loop exit label
# --- Resuming code after Loop 24 ---

lw x5, 588(x3)
beq x0, x0, skip_taken_34 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_34:
lw x7, 36(x3)
lw x2, 456(x3)
beq x0, x0, skip_taken_35 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_35:
beq x0, x0, skip_taken_36 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_36:
beq x0, x0, skip_taken_37 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_37:
sw x5, 236(x3)

# --- Closing Loop 23 (Depth: 3) ---
addi x1, x1, 1
beq x1, x6, loop_exit_23  # Conditional break from loop
blt x1, x4, loop_start_23 # Branch back to loop start
loop_exit_23: # Define loop exit label
# --- Resuming code after Loop 23 ---

lw x6, 504(x3)
beq x0, x0, skip_taken_38 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_38:
beq x0, x0, skip_taken_39 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_39:
beq x0, x0, skip_taken_40 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_40:

# --- Starting Loop 25 (Depth: 3, break at 2, max 10) ---
addi x1, x0, 10
addi x4, x0, 2
addi x2, x0, 0
loop_start_25:
srl x4, x1, x1
sw x1, 184(x3)
sw x4, 268(x3)
sw x5, 68(x3)
sw x5, 152(x3)
or x7, x6, x6
or x7, x1, x2
srl x1, x2, x5
and x6, x7, x4

# --- Closing Loop 25 (Depth: 3) ---
addi x2, x2, 1
beq x2, x4, loop_exit_25  # Conditional break from loop
blt x2, x1, loop_start_25 # Branch back to loop start
loop_exit_25: # Define loop exit label
# --- Resuming code after Loop 25 ---

beq x0, x0, skip_taken_41 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_41:
sll x6, x7, x5
sw x1, 556(x3)

# --- Closing Loop 21 (Depth: 2) ---
addi x4, x4, 1
beq x4, x2, loop_exit_21  # Conditional break from loop
blt x4, x1, loop_start_21 # Branch back to loop start
loop_exit_21: # Define loop exit label
# --- Resuming code after Loop 21 ---


# --- Closing Loop 20 (Depth: 1) ---
addi x2, x2, 1
beq x2, x6, loop_exit_20  # Conditional break from loop
blt x2, x1, loop_start_20 # Branch back to loop start
loop_exit_20: # Define loop exit label
# --- Resuming code after Loop 20 ---

srl x2, x6, x5
sll x6, x7, x1
bne x0, x0, skip_nottaken_42 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_42:
xor x2, x7, x7
lw x6, 732(x3)
sw x1, 4(x3)

# --- Starting Loop 26 (Depth: 1, break at 1, max 5) ---
addi x5, x0, 5
addi x2, x0, 1
addi x4, x0, 0
loop_start_26:

# --- Closing Loop 26 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_exit_26  # Conditional break from loop
blt x4, x5, loop_start_26 # Branch back to loop start
loop_exit_26: # Define loop exit label
# --- Resuming code after Loop 26 ---

beq x0, x0, skip_taken_43 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_43:

# --- Starting Loop 27 (Depth: 1, break at 3, max 7) ---
addi x1, x0, 7
addi x2, x0, 3
addi x7, x0, 0
loop_start_27:
lw x5, 412(x3)
beq x0, x0, skip_taken_44 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_44:
beq x0, x0, skip_taken_45 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_45:
sub x4, x7, x2
sw x4, 152(x3)
beq x0, x0, skip_taken_46 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_46:
beq x0, x0, skip_taken_47 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_47:
beq x0, x0, skip_taken_48 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_48:
sub x6, x5, x2

# --- Starting Loop 28 (Depth: 2, break at 1, max 2) ---
addi x4, x0, 2
addi x5, x0, 1
addi x7, x0, 0
loop_start_28:
beq x0, x0, skip_taken_49 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_49:

# --- Closing Loop 28 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_exit_28  # Conditional break from loop
blt x7, x4, loop_start_28 # Branch back to loop start
loop_exit_28: # Define loop exit label
# --- Resuming code after Loop 28 ---

sw x5, 608(x3)
and x6, x1, x4
lw x7, 628(x3)

# --- Closing Loop 27 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_exit_27  # Conditional break from loop
blt x7, x1, loop_start_27 # Branch back to loop start
loop_exit_27: # Define loop exit label
# --- Resuming code after Loop 27 ---

beq x0, x0, skip_taken_50 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_50:
bne x0, x0, skip_nottaken_51 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_51:

# --- Starting Loop 29 (Depth: 1, break at 2, max 8) ---
addi x1, x0, 8
addi x4, x0, 2
addi x6, x0, 0
loop_start_29:
or x5, x2, x7
beq x0, x0, skip_taken_52 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_52:
sw x4, 944(x3)

# --- Closing Loop 29 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_exit_29  # Conditional break from loop
blt x6, x1, loop_start_29 # Branch back to loop start
loop_exit_29: # Define loop exit label
# --- Resuming code after Loop 29 ---

beq x0, x0, skip_taken_53 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_53:
lw x7, 840(x3)
beq x0, x0, skip_taken_54 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_54:
beq x0, x0, skip_taken_55 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_55:
beq x0, x0, skip_taken_56 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_56:
or x7, x1, x2
beq x0, x0, skip_taken_57 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_57:
srl x1, x7, x2
beq x0, x0, skip_taken_58 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_58:
beq x0, x0, skip_taken_59 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_59:
beq x0, x0, skip_taken_60 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_60:
lw x6, 732(x3)
beq x0, x0, skip_taken_61 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_61:
lw x7, 252(x3)
sw x7, 108(x3)
beq x0, x0, skip_taken_62 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_62:

# --- Starting Loop 30 (Depth: 1, break at 4, max 8) ---
addi x1, x0, 8
addi x4, x0, 4
addi x6, x0, 0
loop_start_30:

# --- Closing Loop 30 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_exit_30  # Conditional break from loop
blt x6, x1, loop_start_30 # Branch back to loop start
loop_exit_30: # Define loop exit label
# --- Resuming code after Loop 30 ---


# --- Starting Loop 31 (Depth: 1, break at 4, max 5) ---
addi x7, x0, 5
addi x4, x0, 4
addi x2, x0, 0
loop_start_31:
xor x5, x6, x7
or x1, x7, x2
beq x0, x0, skip_taken_63 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_63:
beq x0, x0, skip_taken_64 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_64:
add x4, x6, x2
sll x2, x6, x6
sll x7, x2, x2
xor x2, x7, x6
sw x2, 16(x3)

# --- Closing Loop 31 (Depth: 1) ---
addi x2, x2, 1
beq x2, x4, loop_exit_31  # Conditional break from loop
blt x2, x7, loop_start_31 # Branch back to loop start
loop_exit_31: # Define loop exit label
# --- Resuming code after Loop 31 ---

bne x0, x0, skip_nottaken_65 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_65:

# --- Starting Loop 32 (Depth: 1, break at 2, max 4) ---
addi x7, x0, 4
addi x5, x0, 2
addi x2, x0, 0
loop_start_32:

# --- Starting Loop 33 (Depth: 2, break at 1, max 6) ---
addi x6, x0, 6
addi x4, x0, 1
addi x5, x0, 0
loop_start_33:

# --- Starting Loop 34 (Depth: 3, break at 1, max 4) ---
addi x4, x0, 4
addi x6, x0, 1
addi x7, x0, 0
loop_start_34:
lw x4, 720(x3)
sll x5, x1, x6

# --- Closing Loop 34 (Depth: 3) ---
addi x7, x7, 1
beq x7, x6, loop_exit_34  # Conditional break from loop
blt x7, x4, loop_start_34 # Branch back to loop start
loop_exit_34: # Define loop exit label
# --- Resuming code after Loop 34 ---


# --- Closing Loop 33 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_exit_33  # Conditional break from loop
blt x5, x6, loop_start_33 # Branch back to loop start
loop_exit_33: # Define loop exit label
# --- Resuming code after Loop 33 ---

srl x6, x5, x5
beq x0, x0, skip_taken_66 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_66:
lw x7, 992(x3)
or x5, x1, x6
add x4, x1, x1
beq x0, x0, skip_taken_67 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_67:
add x1, x6, x5

# --- Starting Loop 35 (Depth: 2, break at 5, max 9) ---
addi x5, x0, 9
addi x6, x0, 5
addi x7, x0, 0
loop_start_35:
or x4, x5, x2

# --- Starting Loop 36 (Depth: 3, break at 1, max 2) ---
addi x6, x0, 2
addi x5, x0, 1
addi x2, x0, 0
loop_start_36:
srl x4, x2, x1
beq x0, x0, skip_taken_68 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_68:
beq x0, x0, skip_taken_69 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_69:

# --- Closing Loop 36 (Depth: 3) ---
addi x2, x2, 1
beq x2, x5, loop_exit_36  # Conditional break from loop
blt x2, x6, loop_start_36 # Branch back to loop start
loop_exit_36: # Define loop exit label
# --- Resuming code after Loop 36 ---

beq x0, x0, skip_taken_70 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_70:
lw x5, 560(x3)
and x1, x2, x6

# --- Closing Loop 35 (Depth: 2) ---
addi x7, x7, 1
beq x7, x6, loop_exit_35  # Conditional break from loop
blt x7, x5, loop_start_35 # Branch back to loop start
loop_exit_35: # Define loop exit label
# --- Resuming code after Loop 35 ---

sw x2, 228(x3)
add x4, x1, x6

# --- Starting Loop 37 (Depth: 2, break at 3, max 4) ---
addi x1, x0, 4
addi x5, x0, 3
addi x7, x0, 0
loop_start_37:
and x6, x5, x1
beq x0, x0, skip_taken_71 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_71:

# --- Closing Loop 37 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_exit_37  # Conditional break from loop
blt x7, x1, loop_start_37 # Branch back to loop start
loop_exit_37: # Define loop exit label
# --- Resuming code after Loop 37 ---

beq x0, x0, skip_taken_72 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_72:

# --- Starting Loop 38 (Depth: 2, break at 5, max 8) ---
addi x7, x0, 8
addi x5, x0, 5
addi x1, x0, 0
loop_start_38:
xor x2, x6, x4
sw x6, 512(x3)

# --- Closing Loop 38 (Depth: 2) ---
addi x1, x1, 1
beq x1, x5, loop_exit_38  # Conditional break from loop
blt x1, x7, loop_start_38 # Branch back to loop start
loop_exit_38: # Define loop exit label
# --- Resuming code after Loop 38 ---


# --- Starting Loop 39 (Depth: 2, break at 1, max 8) ---
addi x6, x0, 8
addi x5, x0, 1
addi x7, x0, 0
loop_start_39:
sw x7, 100(x3)
beq x0, x0, skip_taken_73 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_73:
sw x5, 440(x3)
lw x1, 496(x3)
lw x6, 988(x3)

# --- Closing Loop 39 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_exit_39  # Conditional break from loop
blt x7, x6, loop_start_39 # Branch back to loop start
loop_exit_39: # Define loop exit label
# --- Resuming code after Loop 39 ---

sw x5, 280(x3)

# --- Starting Loop 40 (Depth: 2, break at 4, max 7) ---
addi x4, x0, 7
addi x1, x0, 4
addi x5, x0, 0
loop_start_40:
sub x4, x2, x1
beq x0, x0, skip_taken_74 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_74:
beq x0, x0, skip_taken_75 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_75:
xor x1, x5, x6
beq x0, x0, skip_taken_76 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_76:
add x1, x4, x7
lw x5, 532(x3)
beq x0, x0, skip_taken_77 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_77:
beq x0, x0, skip_taken_78 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_78:
srl x4, x1, x7
lw x7, 532(x3)

# --- Starting Loop 41 (Depth: 3, break at 2, max 10) ---
addi x5, x0, 10
addi x2, x0, 2
addi x4, x0, 0
loop_start_41:
beq x0, x0, skip_taken_79 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_79:
sw x6, 628(x3)

# --- Closing Loop 41 (Depth: 3) ---
addi x4, x4, 1
beq x4, x2, loop_exit_41  # Conditional break from loop
blt x4, x5, loop_start_41 # Branch back to loop start
loop_exit_41: # Define loop exit label
# --- Resuming code after Loop 41 ---

beq x0, x0, skip_taken_80 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_80:

# --- Closing Loop 40 (Depth: 2) ---
addi x5, x5, 1
beq x5, x1, loop_exit_40  # Conditional break from loop
blt x5, x4, loop_start_40 # Branch back to loop start
loop_exit_40: # Define loop exit label
# --- Resuming code after Loop 40 ---

beq x0, x0, skip_taken_81 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_81:
beq x0, x0, skip_taken_82 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_82:
xor x5, x1, x2
beq x0, x0, skip_taken_83 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_83:
beq x0, x0, skip_taken_84 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_84:
or x1, x6, x7

# --- Starting Loop 42 (Depth: 2, break at 5, max 7) ---
addi x7, x0, 7
addi x4, x0, 5
addi x5, x0, 0
loop_start_42:
sll x6, x1, x4
or x7, x6, x4
sw x7, 296(x3)

# --- Closing Loop 42 (Depth: 2) ---
addi x5, x5, 1
beq x5, x4, loop_exit_42  # Conditional break from loop
blt x5, x7, loop_start_42 # Branch back to loop start
loop_exit_42: # Define loop exit label
# --- Resuming code after Loop 42 ---

sw x7, 936(x3)
beq x0, x0, skip_taken_85 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_85:
bne x0, x0, skip_nottaken_86 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_86:
lw x4, 68(x3)
beq x0, x0, skip_taken_87 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_87:

# --- Closing Loop 32 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_exit_32  # Conditional break from loop
blt x2, x7, loop_start_32 # Branch back to loop start
loop_exit_32: # Define loop exit label
# --- Resuming code after Loop 32 ---

bne x0, x0, skip_nottaken_88 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_88:
beq x0, x0, skip_taken_89 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_89:
srl x7, x4, x2

# --- Starting Loop 43 (Depth: 1, break at 1, max 5) ---
addi x4, x0, 5
addi x5, x0, 1
addi x2, x0, 0
loop_start_43:

# --- Starting Loop 44 (Depth: 2, break at 4, max 5) ---
addi x5, x0, 5
addi x6, x0, 4
addi x7, x0, 0
loop_start_44:
bne x0, x0, skip_nottaken_90 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_90:
lw x4, 384(x3)
lw x2, 40(x3)
lw x7, 684(x3)

# --- Closing Loop 44 (Depth: 2) ---
addi x7, x7, 1
beq x7, x6, loop_exit_44  # Conditional break from loop
blt x7, x5, loop_start_44 # Branch back to loop start
loop_exit_44: # Define loop exit label
# --- Resuming code after Loop 44 ---

beq x0, x0, skip_taken_91 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_91:
sw x5, 912(x3)
sw x7, 688(x3)
srl x5, x7, x6
add x2, x4, x4

# --- Closing Loop 43 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_exit_43  # Conditional break from loop
blt x2, x4, loop_start_43 # Branch back to loop start
loop_exit_43: # Define loop exit label
# --- Resuming code after Loop 43 ---

sw x1, 948(x3)

# --- Starting Loop 45 (Depth: 1, break at 1, max 9) ---
addi x6, x0, 9
addi x5, x0, 1
addi x4, x0, 0
loop_start_45:

# --- Starting Loop 46 (Depth: 2, break at 1, max 4) ---
addi x1, x0, 4
addi x5, x0, 1
addi x6, x0, 0
loop_start_46:

# --- Starting Loop 47 (Depth: 3, break at 4, max 7) ---
addi x5, x0, 7
addi x4, x0, 4
addi x7, x0, 0
loop_start_47:
beq x0, x0, skip_taken_92 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_92:
lw x5, 360(x3)
sll x5, x7, x2
beq x0, x0, skip_taken_93 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_93:

# --- Closing Loop 47 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_exit_47  # Conditional break from loop
blt x7, x5, loop_start_47 # Branch back to loop start
loop_exit_47: # Define loop exit label
# --- Resuming code after Loop 47 ---

beq x0, x0, skip_taken_94 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_94:
srl x7, x4, x1
beq x0, x0, skip_taken_95 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_95:

# --- Closing Loop 46 (Depth: 2) ---
addi x6, x6, 1
beq x6, x5, loop_exit_46  # Conditional break from loop
blt x6, x1, loop_start_46 # Branch back to loop start
loop_exit_46: # Define loop exit label
# --- Resuming code after Loop 46 ---

lw x1, 348(x3)
sub x6, x1, x1
lw x7, 104(x3)
beq x0, x0, skip_taken_96 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_96:
beq x0, x0, skip_taken_97 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_97:
sw x7, 484(x3)

# --- Starting Loop 48 (Depth: 2, break at 3, max 5) ---
addi x1, x0, 5
addi x5, x0, 3
addi x7, x0, 0
loop_start_48:
sll x2, x1, x1
beq x0, x0, skip_taken_98 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_98:
beq x0, x0, skip_taken_99 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_99:
beq x0, x0, skip_taken_100 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_100:

# --- Starting Loop 49 (Depth: 3, break at 2, max 10) ---
addi x1, x0, 10
addi x5, x0, 2
addi x6, x0, 0
loop_start_49:
beq x0, x0, skip_taken_101 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_101:
sw x7, 696(x3)
lw x4, 504(x3)
lw x1, 404(x3)
sw x6, 928(x3)
xor x5, x4, x1

# --- Closing Loop 49 (Depth: 3) ---
addi x6, x6, 1
beq x6, x5, loop_exit_49  # Conditional break from loop
blt x6, x1, loop_start_49 # Branch back to loop start
loop_exit_49: # Define loop exit label
# --- Resuming code after Loop 49 ---


# --- Starting Loop 50 (Depth: 3, break at 3, max 5) ---
addi x2, x0, 5
addi x4, x0, 3
addi x7, x0, 0
loop_start_50:
bne x0, x0, skip_nottaken_102 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_102:
bne x0, x0, skip_nottaken_103 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_103:
beq x0, x0, skip_taken_104 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_104:
sll x4, x6, x5
sw x4, 476(x3)
sw x4, 588(x3)
beq x0, x0, skip_taken_105 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_105:
bne x0, x0, skip_nottaken_106 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_106:
beq x0, x0, skip_taken_107 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_107:
sub x6, x4, x1
beq x0, x0, skip_taken_108 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_108:
beq x0, x0, skip_taken_109 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_109:
lw x7, 856(x3)
sll x6, x1, x5
sw x2, 900(x3)
beq x0, x0, skip_taken_110 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_110:

# --- Closing Loop 50 (Depth: 3) ---
addi x7, x7, 1
beq x7, x4, loop_exit_50  # Conditional break from loop
blt x7, x2, loop_start_50 # Branch back to loop start
loop_exit_50: # Define loop exit label
# --- Resuming code after Loop 50 ---

beq x0, x0, skip_taken_111 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_111:
or x4, x7, x6
bne x0, x0, skip_nottaken_112 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_112:
beq x0, x0, skip_taken_113 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_113:

# --- Starting Loop 51 (Depth: 3, break at 4, max 7) ---
addi x1, x0, 7
addi x2, x0, 4
addi x7, x0, 0
loop_start_51:
sw x5, 456(x3)
beq x0, x0, skip_taken_114 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_114:

# --- Closing Loop 51 (Depth: 3) ---
addi x7, x7, 1
beq x7, x2, loop_exit_51  # Conditional break from loop
blt x7, x1, loop_start_51 # Branch back to loop start
loop_exit_51: # Define loop exit label
# --- Resuming code after Loop 51 ---


# --- Starting Loop 52 (Depth: 3, break at 3, max 6) ---
addi x6, x0, 6
addi x4, x0, 3
addi x2, x0, 0
loop_start_52:
or x6, x5, x7

# --- Starting Loop 53 (Depth: 4, break at 1, max 3) ---
addi x5, x0, 3
addi x1, x0, 1
addi x7, x0, 0
loop_start_53:
sw x5, 692(x3)
lw x5, 724(x3)
sw x5, 60(x3)
lw x5, 512(x3)
beq x0, x0, skip_taken_115 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_115:
sub x5, x7, x6
bne x0, x0, skip_nottaken_116 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_116:
sll x7, x5, x5
srl x6, x7, x5
lw x5, 160(x3)
beq x0, x0, skip_taken_117 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_117:
beq x0, x0, skip_taken_118 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_118:

# --- Closing Loop 53 (Depth: 4) ---
addi x7, x7, 1
beq x7, x1, loop_exit_53  # Conditional break from loop
blt x7, x5, loop_start_53 # Branch back to loop start
loop_exit_53: # Define loop exit label
# --- Resuming code after Loop 53 ---

lw x2, 992(x3)
beq x0, x0, skip_taken_119 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_119:

# --- Starting Loop 54 (Depth: 4, break at 2, max 4) ---
addi x1, x0, 4
addi x5, x0, 2
addi x7, x0, 0
loop_start_54:
lw x4, 12(x3)
sw x5, 632(x3)
srl x5, x7, x4
lw x6, 820(x3)
sll x4, x5, x7
beq x0, x0, skip_taken_120 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_120:
lw x1, 120(x3)
and x1, x2, x2
bne x0, x0, skip_nottaken_121 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_121:
sw x5, 580(x3)
bne x0, x0, skip_nottaken_122 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_122:
beq x0, x0, skip_taken_123 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_123:

# --- Closing Loop 54 (Depth: 4) ---
addi x7, x7, 1
beq x7, x5, loop_exit_54  # Conditional break from loop
blt x7, x1, loop_start_54 # Branch back to loop start
loop_exit_54: # Define loop exit label
# --- Resuming code after Loop 54 ---

sll x7, x1, x6
srl x5, x6, x2

# --- Closing Loop 52 (Depth: 3) ---
addi x2, x2, 1
beq x2, x4, loop_exit_52  # Conditional break from loop
blt x2, x6, loop_start_52 # Branch back to loop start
loop_exit_52: # Define loop exit label
# --- Resuming code after Loop 52 ---


# --- Closing Loop 48 (Depth: 2) ---
addi x7, x7, 1
beq x7, x5, loop_exit_48  # Conditional break from loop
blt x7, x1, loop_start_48 # Branch back to loop start
loop_exit_48: # Define loop exit label
# --- Resuming code after Loop 48 ---

and x1, x6, x7
sll x2, x1, x4
lw x1, 860(x3)

# --- Starting Loop 55 (Depth: 2, break at 1, max 2) ---
addi x7, x0, 2
addi x2, x0, 1
addi x4, x0, 0
loop_start_55:
lw x1, 100(x3)

# --- Starting Loop 56 (Depth: 3, break at 2, max 4) ---
addi x2, x0, 4
addi x6, x0, 2
addi x4, x0, 0
loop_start_56:
beq x0, x0, skip_taken_124 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_124:
or x4, x5, x5
sll x7, x5, x2
beq x0, x0, skip_taken_125 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_125:

# --- Closing Loop 56 (Depth: 3) ---
addi x4, x4, 1
beq x4, x6, loop_exit_56  # Conditional break from loop
blt x4, x2, loop_start_56 # Branch back to loop start
loop_exit_56: # Define loop exit label
# --- Resuming code after Loop 56 ---

lw x6, 164(x3)

# --- Starting Loop 57 (Depth: 3, break at 3, max 9) ---
addi x7, x0, 9
addi x4, x0, 3
addi x1, x0, 0
loop_start_57:
beq x0, x0, skip_taken_126 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_126:
beq x0, x0, skip_taken_127 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_127:
sub x5, x1, x4
beq x0, x0, skip_taken_128 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_128:
lw x4, 136(x3)
lw x1, 752(x3)
srl x5, x2, x4
beq x0, x0, skip_taken_129 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_129:

# --- Closing Loop 57 (Depth: 3) ---
addi x1, x1, 1
beq x1, x4, loop_exit_57  # Conditional break from loop
blt x1, x7, loop_start_57 # Branch back to loop start
loop_exit_57: # Define loop exit label
# --- Resuming code after Loop 57 ---

beq x0, x0, skip_taken_130 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_130:
add x6, x1, x2
lw x2, 296(x3)
beq x0, x0, skip_taken_131 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_131:
bne x0, x0, skip_nottaken_132 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_132:
bne x0, x0, skip_nottaken_133 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_133:
sw x2, 904(x3)
sub x2, x5, x1

# --- Starting Loop 58 (Depth: 3, break at 3, max 7) ---
addi x4, x0, 7
addi x7, x0, 3
addi x1, x0, 0
loop_start_58:
beq x0, x0, skip_taken_134 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_134:

# --- Closing Loop 58 (Depth: 3) ---
addi x1, x1, 1
beq x1, x7, loop_exit_58  # Conditional break from loop
blt x1, x4, loop_start_58 # Branch back to loop start
loop_exit_58: # Define loop exit label
# --- Resuming code after Loop 58 ---

beq x0, x0, skip_taken_135 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_135:
add x4, x1, x5

# --- Starting Loop 59 (Depth: 3, break at 4, max 7) ---
addi x7, x0, 7
addi x5, x0, 4
addi x6, x0, 0
loop_start_59:

# --- Closing Loop 59 (Depth: 3) ---
addi x6, x6, 1
beq x6, x5, loop_exit_59  # Conditional break from loop
blt x6, x7, loop_start_59 # Branch back to loop start
loop_exit_59: # Define loop exit label
# --- Resuming code after Loop 59 ---

beq x0, x0, skip_taken_136 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_136:
beq x0, x0, skip_taken_137 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_137:
and x4, x7, x7
sw x7, 8(x3)
beq x0, x0, skip_taken_138 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_138:
beq x0, x0, skip_taken_139 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_139:
and x2, x6, x7

# --- Closing Loop 55 (Depth: 2) ---
addi x4, x4, 1
beq x4, x2, loop_exit_55  # Conditional break from loop
blt x4, x7, loop_start_55 # Branch back to loop start
loop_exit_55: # Define loop exit label
# --- Resuming code after Loop 55 ---


# --- Starting Loop 60 (Depth: 2, break at 5, max 6) ---
addi x1, x0, 6
addi x4, x0, 5
addi x6, x0, 0
loop_start_60:
beq x0, x0, skip_taken_140 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_140:
beq x0, x0, skip_taken_141 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_141:
add x4, x1, x2
beq x0, x0, skip_taken_142 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_142:
or x7, x5, x2
bne x0, x0, skip_nottaken_143 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_143:
sub x4, x7, x5
or x4, x2, x7
sw x1, 664(x3)
bne x0, x0, skip_nottaken_144 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_144:
sw x2, 616(x3)
bne x0, x0, skip_nottaken_145 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_145:

# --- Starting Loop 61 (Depth: 3, break at 2, max 7) ---
addi x6, x0, 7
addi x7, x0, 2
addi x1, x0, 0
loop_start_61:
sw x7, 516(x3)
beq x0, x0, skip_taken_146 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_146:
beq x0, x0, skip_taken_147 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_147:
sub x7, x4, x4
beq x0, x0, skip_taken_148 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_148:
lw x4, 264(x3)
xor x7, x2, x1
lw x7, 412(x3)
beq x0, x0, skip_taken_149 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_149:
lw x2, 564(x3)
beq x0, x0, skip_taken_150 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_150:
lw x4, 32(x3)
beq x0, x0, skip_taken_151 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_151:
lw x7, 104(x3)

# --- Closing Loop 61 (Depth: 3) ---
addi x1, x1, 1
beq x1, x7, loop_exit_61  # Conditional break from loop
blt x1, x6, loop_start_61 # Branch back to loop start
loop_exit_61: # Define loop exit label
# --- Resuming code after Loop 61 ---

beq x0, x0, skip_taken_152 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_152:
sub x7, x7, x4
sw x7, 12(x3)
bne x0, x0, skip_nottaken_153 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_153:

# --- Closing Loop 60 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_60  # Conditional break from loop
blt x6, x1, loop_start_60 # Branch back to loop start
loop_exit_60: # Define loop exit label
# --- Resuming code after Loop 60 ---

beq x0, x0, skip_taken_154 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_154:
lw x7, 644(x3)

# --- Closing Loop 45 (Depth: 1) ---
addi x4, x4, 1
beq x4, x5, loop_exit_45  # Conditional break from loop
blt x4, x6, loop_start_45 # Branch back to loop start
loop_exit_45: # Define loop exit label
# --- Resuming code after Loop 45 ---


# --- Starting Loop 62 (Depth: 1, break at 4, max 9) ---
addi x4, x0, 9
addi x2, x0, 4
addi x5, x0, 0
loop_start_62:
lw x6, 716(x3)

# --- Closing Loop 62 (Depth: 1) ---
addi x5, x5, 1
beq x5, x2, loop_exit_62  # Conditional break from loop
blt x5, x4, loop_start_62 # Branch back to loop start
loop_exit_62: # Define loop exit label
# --- Resuming code after Loop 62 ---

bne x0, x0, skip_nottaken_155 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_155:
beq x0, x0, skip_taken_156 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_156:
sw x5, 532(x3)
beq x0, x0, skip_taken_157 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_157:
and x7, x2, x6
and x4, x7, x5
beq x0, x0, skip_taken_158 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_158:

# --- Starting Loop 63 (Depth: 1, break at 5, max 10) ---
addi x7, x0, 10
addi x5, x0, 5
addi x1, x0, 0
loop_start_63:
beq x0, x0, skip_taken_159 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_159:
xor x5, x7, x7
lw x4, 388(x3)
sw x7, 372(x3)

# --- Starting Loop 64 (Depth: 2, break at 4, max 9) ---
addi x1, x0, 9
addi x4, x0, 4
addi x6, x0, 0
loop_start_64:

# --- Starting Loop 65 (Depth: 3, break at 3, max 5) ---
addi x2, x0, 5
addi x4, x0, 3
addi x1, x0, 0
loop_start_65:
lw x4, 620(x3)
and x1, x6, x5

# --- Closing Loop 65 (Depth: 3) ---
addi x1, x1, 1
beq x1, x4, loop_exit_65  # Conditional break from loop
blt x1, x2, loop_start_65 # Branch back to loop start
loop_exit_65: # Define loop exit label
# --- Resuming code after Loop 65 ---

sll x2, x7, x7
beq x0, x0, skip_taken_160 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_160:
beq x0, x0, skip_taken_161 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_161:
beq x0, x0, skip_taken_162 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_162:
beq x0, x0, skip_taken_163 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_163:
and x7, x2, x1
or x7, x5, x5
sw x6, 88(x3)

# --- Closing Loop 64 (Depth: 2) ---
addi x6, x6, 1
beq x6, x4, loop_exit_64  # Conditional break from loop
blt x6, x1, loop_start_64 # Branch back to loop start
loop_exit_64: # Define loop exit label
# --- Resuming code after Loop 64 ---


# --- Starting Loop 66 (Depth: 2, break at 1, max 7) ---
addi x7, x0, 7
addi x2, x0, 1
addi x6, x0, 0
loop_start_66:
bne x0, x0, skip_nottaken_164 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_164:
add x2, x4, x7
lw x6, 320(x3)
lw x4, 956(x3)
or x1, x2, x6

# --- Starting Loop 67 (Depth: 3, break at 5, max 9) ---
addi x6, x0, 9
addi x4, x0, 5
addi x2, x0, 0
loop_start_67:
beq x0, x0, skip_taken_165 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_165:
lw x5, 520(x3)
lw x5, 988(x3)

# --- Closing Loop 67 (Depth: 3) ---
addi x2, x2, 1
beq x2, x4, loop_exit_67  # Conditional break from loop
blt x2, x6, loop_start_67 # Branch back to loop start
loop_exit_67: # Define loop exit label
# --- Resuming code after Loop 67 ---

lw x7, 868(x3)
xor x5, x1, x4
sw x4, 120(x3)
lw x4, 780(x3)
add x5, x4, x4
beq x0, x0, skip_taken_166 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_166:

# --- Starting Loop 68 (Depth: 3, break at 2, max 8) ---
addi x6, x0, 8
addi x7, x0, 2
addi x1, x0, 0
loop_start_68:

# --- Closing Loop 68 (Depth: 3) ---
addi x1, x1, 1
beq x1, x7, loop_exit_68  # Conditional break from loop
blt x1, x6, loop_start_68 # Branch back to loop start
loop_exit_68: # Define loop exit label
# --- Resuming code after Loop 68 ---

beq x0, x0, skip_taken_167 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_167:
beq x0, x0, skip_taken_168 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_168:
sw x1, 780(x3)

# --- Closing Loop 66 (Depth: 2) ---
addi x6, x6, 1
beq x6, x2, loop_exit_66  # Conditional break from loop
blt x6, x7, loop_start_66 # Branch back to loop start
loop_exit_66: # Define loop exit label
# --- Resuming code after Loop 66 ---

xor x7, x6, x4
beq x0, x0, skip_taken_169 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_169:

# --- Closing Loop 63 (Depth: 1) ---
addi x1, x1, 1
beq x1, x5, loop_exit_63  # Conditional break from loop
blt x1, x7, loop_start_63 # Branch back to loop start
loop_exit_63: # Define loop exit label
# --- Resuming code after Loop 63 ---

sub x5, x4, x2
beq x0, x0, skip_taken_170 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_170:

# --- Starting Loop 69 (Depth: 1, break at 4, max 7) ---
addi x4, x0, 7
addi x2, x0, 4
addi x7, x0, 0
loop_start_69:
lw x5, 996(x3)

# --- Closing Loop 69 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_exit_69  # Conditional break from loop
blt x7, x4, loop_start_69 # Branch back to loop start
loop_exit_69: # Define loop exit label
# --- Resuming code after Loop 69 ---

sll x5, x5, x2
lw x1, 492(x3)
beq x0, x0, skip_taken_171 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_171:

# --- Final cleanup: Closing all remaining open loops ---

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
