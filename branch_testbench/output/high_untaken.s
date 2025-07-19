# Initialize memory base register x3
lui x3, 2
addi x3, x3, 0

bne x0, x0, skip_nottaken_1 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_1:
or x4, x7, x6

# --- Starting Loop 1 (Depth: 1, break at 5, max 10) ---
addi x6, x0, 10
addi x7, x0, 5
addi x2, x0, 0
loop_start_1:
bne x0, x0, skip_nottaken_2 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_2:
or x6, x4, x4
bne x0, x0, skip_nottaken_3 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_3:
bne x0, x0, skip_nottaken_4 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_4:

# --- Closing Loop 1 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_exit_1  # Conditional break from loop
blt x2, x6, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---

srl x5, x2, x2

# --- Starting Loop 2 (Depth: 1, break at 2, max 7) ---
addi x7, x0, 7
addi x4, x0, 2
addi x6, x0, 0
loop_start_2:
sll x6, x2, x5

# --- Closing Loop 2 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_exit_2  # Conditional break from loop
blt x6, x7, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---

sub x6, x6, x4
sw x2, 312(x3)

# --- Starting Loop 3 (Depth: 1, break at 5, max 9) ---
addi x7, x0, 9
addi x4, x0, 5
addi x5, x0, 0
loop_start_3:
sll x2, x4, x7
beq x0, x0, skip_taken_5 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_5:

# --- Closing Loop 3 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_3  # Conditional break from loop
blt x5, x7, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---

bne x0, x0, skip_nottaken_6 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_6:
beq x0, x0, skip_taken_7 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_7:
bne x0, x0, skip_nottaken_8 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_8:
lw x5, 192(x3)
add x5, x2, x6
lw x4, 92(x3)
lw x7, 856(x3)
sub x1, x5, x5
sub x7, x4, x2
lw x4, 704(x3)
sw x1, 708(x3)
sw x2, 136(x3)
or x7, x1, x4
lw x2, 812(x3)

# --- Starting Loop 4 (Depth: 1, break at 5, max 8) ---
addi x1, x0, 8
addi x4, x0, 5
addi x5, x0, 0
loop_start_4:
bne x0, x0, skip_nottaken_9 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_9:
lw x4, 564(x3)
bne x0, x0, skip_nottaken_10 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_10:
sw x1, 716(x3)

# --- Closing Loop 4 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_4  # Conditional break from loop
blt x5, x1, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---

bne x0, x0, skip_nottaken_11 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_11:
bne x0, x0, skip_nottaken_12 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_12:
xor x4, x6, x2
bne x0, x0, skip_nottaken_13 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_13:

# --- Starting Loop 5 (Depth: 1, break at 3, max 6) ---
addi x5, x0, 6
addi x6, x0, 3
addi x1, x0, 0
loop_start_5:
bne x0, x0, skip_nottaken_14 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_14:

# --- Starting Loop 6 (Depth: 2, break at 1, max 6) ---
addi x5, x0, 6
addi x2, x0, 1
addi x7, x0, 0
loop_start_6:
sw x2, 260(x3)
lw x7, 980(x3)
sw x1, 648(x3)

# --- Closing Loop 6 (Depth: 2) ---
addi x7, x7, 1
beq x7, x2, loop_exit_6  # Conditional break from loop
blt x7, x5, loop_start_6 # Branch back to loop start
loop_exit_6: # Define loop exit label
# --- Resuming code after Loop 6 ---

srl x4, x5, x7

# --- Closing Loop 5 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_exit_5  # Conditional break from loop
blt x1, x5, loop_start_5 # Branch back to loop start
loop_exit_5: # Define loop exit label
# --- Resuming code after Loop 5 ---


# --- Starting Loop 7 (Depth: 1, break at 2, max 6) ---
addi x7, x0, 6
addi x1, x0, 2
addi x2, x0, 0
loop_start_7:
lw x7, 596(x3)
srl x6, x1, x5
bne x0, x0, skip_nottaken_15 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_15:
sw x1, 432(x3)
xor x1, x2, x5
add x7, x1, x2
bne x0, x0, skip_nottaken_16 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_16:
beq x0, x0, skip_taken_17 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_17:
srl x1, x7, x6

# --- Starting Loop 8 (Depth: 2, break at 1, max 9) ---
addi x4, x0, 9
addi x6, x0, 1
addi x7, x0, 0
loop_start_8:
bne x0, x0, skip_nottaken_18 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_18:
bne x0, x0, skip_nottaken_19 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_19:

# --- Closing Loop 8 (Depth: 2) ---
addi x7, x7, 1
beq x7, x6, loop_exit_8  # Conditional break from loop
blt x7, x4, loop_start_8 # Branch back to loop start
loop_exit_8: # Define loop exit label
# --- Resuming code after Loop 8 ---

sw x7, 660(x3)
sw x5, 748(x3)
bne x0, x0, skip_nottaken_20 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_20:
srl x2, x7, x1
bne x0, x0, skip_nottaken_21 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_21:
lw x6, 884(x3)
bne x0, x0, skip_nottaken_22 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_22:
sw x2, 532(x3)
sub x6, x5, x4
bne x0, x0, skip_nottaken_23 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_23:
sw x7, 200(x3)
bne x0, x0, skip_nottaken_24 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_24:
or x2, x4, x7
bne x0, x0, skip_nottaken_25 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_25:
xor x1, x2, x7
lw x4, 652(x3)

# --- Closing Loop 7 (Depth: 1) ---
addi x2, x2, 1
beq x2, x1, loop_exit_7  # Conditional break from loop
blt x2, x7, loop_start_7 # Branch back to loop start
loop_exit_7: # Define loop exit label
# --- Resuming code after Loop 7 ---

sub x7, x5, x1
sll x4, x5, x6
sll x1, x7, x2
sw x1, 560(x3)
sw x1, 116(x3)
bne x0, x0, skip_nottaken_26 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_26:
bne x0, x0, skip_nottaken_27 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_27:
bne x0, x0, skip_nottaken_28 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_28:
srl x2, x5, x1
or x5, x1, x1
bne x0, x0, skip_nottaken_29 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_29:
sw x6, 812(x3)
bne x0, x0, skip_nottaken_30 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_30:
bne x0, x0, skip_nottaken_31 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_31:
sub x5, x1, x7
sw x2, 304(x3)
sll x6, x7, x5
bne x0, x0, skip_nottaken_32 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_32:

# --- Starting Loop 9 (Depth: 1, break at 4, max 5) ---
addi x7, x0, 5
addi x2, x0, 4
addi x1, x0, 0
loop_start_9:
sll x4, x1, x2
bne x0, x0, skip_nottaken_33 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_33:
bne x0, x0, skip_nottaken_34 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_34:

# --- Closing Loop 9 (Depth: 1) ---
addi x1, x1, 1
beq x1, x2, loop_exit_9  # Conditional break from loop
blt x1, x7, loop_start_9 # Branch back to loop start
loop_exit_9: # Define loop exit label
# --- Resuming code after Loop 9 ---

bne x0, x0, skip_nottaken_35 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_35:
bne x0, x0, skip_nottaken_36 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_36:
sw x1, 672(x3)
or x2, x1, x6
lw x7, 236(x3)
sw x4, 112(x3)
add x2, x6, x4
bne x0, x0, skip_nottaken_37 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_37:
beq x0, x0, skip_taken_38 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_38:

# --- Starting Loop 10 (Depth: 1, break at 5, max 8) ---
addi x7, x0, 8
addi x5, x0, 5
addi x4, x0, 0
loop_start_10:
bne x0, x0, skip_nottaken_39 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_39:
and x7, x6, x1
sw x1, 248(x3)
or x6, x2, x2
sub x5, x2, x7
lw x6, 976(x3)
bne x0, x0, skip_nottaken_40 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_40:
bne x0, x0, skip_nottaken_41 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_41:
bne x0, x0, skip_nottaken_42 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_42:

# --- Closing Loop 10 (Depth: 1) ---
addi x4, x4, 1
beq x4, x5, loop_exit_10  # Conditional break from loop
blt x4, x7, loop_start_10 # Branch back to loop start
loop_exit_10: # Define loop exit label
# --- Resuming code after Loop 10 ---

bne x0, x0, skip_nottaken_43 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_43:
or x1, x6, x5
sw x1, 444(x3)
sw x6, 932(x3)
bne x0, x0, skip_nottaken_44 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_44:
bne x0, x0, skip_nottaken_45 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_45:
or x5, x6, x1
bne x0, x0, skip_nottaken_46 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_46:
and x4, x6, x2
lw x2, 372(x3)
bne x0, x0, skip_nottaken_47 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_47:
lw x7, 880(x3)
bne x0, x0, skip_nottaken_48 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_48:
bne x0, x0, skip_nottaken_49 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_49:
bne x0, x0, skip_nottaken_50 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_50:
bne x0, x0, skip_nottaken_51 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_51:

# --- Starting Loop 11 (Depth: 1, break at 3, max 10) ---
addi x4, x0, 10
addi x5, x0, 3
addi x1, x0, 0
loop_start_11:
beq x0, x0, skip_taken_52 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_52:
bne x0, x0, skip_nottaken_53 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_53:
lw x4, 232(x3)
xor x7, x1, x6

# --- Closing Loop 11 (Depth: 1) ---
addi x1, x1, 1
beq x1, x5, loop_exit_11  # Conditional break from loop
blt x1, x4, loop_start_11 # Branch back to loop start
loop_exit_11: # Define loop exit label
# --- Resuming code after Loop 11 ---

lw x2, 304(x3)
beq x0, x0, skip_taken_54 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_54:
bne x0, x0, skip_nottaken_55 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_55:

# --- Starting Loop 12 (Depth: 1, break at 4, max 6) ---
addi x5, x0, 6
addi x7, x0, 4
addi x1, x0, 0
loop_start_12:
srl x2, x1, x7
sub x1, x6, x6

# --- Closing Loop 12 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_exit_12  # Conditional break from loop
blt x1, x5, loop_start_12 # Branch back to loop start
loop_exit_12: # Define loop exit label
# --- Resuming code after Loop 12 ---

bne x0, x0, skip_nottaken_56 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_56:
sw x6, 160(x3)
bne x0, x0, skip_nottaken_57 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_57:
bne x0, x0, skip_nottaken_58 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_58:
sub x4, x6, x1
and x5, x7, x6
sw x7, 76(x3)
add x4, x7, x1
bne x0, x0, skip_nottaken_59 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_59:
add x1, x2, x7
or x5, x4, x2
lw x7, 64(x3)
srl x1, x2, x5
sw x5, 644(x3)
bne x0, x0, skip_nottaken_60 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_60:
or x5, x2, x7
bne x0, x0, skip_nottaken_61 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_61:
and x1, x5, x6
or x1, x2, x2
sw x6, 800(x3)
srl x7, x5, x5
bne x0, x0, skip_nottaken_62 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_62:
bne x0, x0, skip_nottaken_63 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_63:
lw x2, 960(x3)
bne x0, x0, skip_nottaken_64 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_64:
lw x7, 856(x3)
bne x0, x0, skip_nottaken_65 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_65:
bne x0, x0, skip_nottaken_66 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_66:
sw x6, 72(x3)
bne x0, x0, skip_nottaken_67 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_67:
sw x4, 160(x3)
lw x5, 556(x3)
xor x1, x4, x7
bne x0, x0, skip_nottaken_68 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_68:
sw x7, 620(x3)
sw x2, 784(x3)
sw x4, 308(x3)

# --- Starting Loop 13 (Depth: 1, break at 5, max 9) ---
addi x1, x0, 9
addi x4, x0, 5
addi x5, x0, 0
loop_start_13:
xor x4, x6, x7
add x6, x7, x2

# --- Starting Loop 14 (Depth: 2, break at 3, max 9) ---
addi x1, x0, 9
addi x7, x0, 3
addi x4, x0, 0
loop_start_14:
beq x0, x0, skip_taken_69 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_69:

# --- Closing Loop 14 (Depth: 2) ---
addi x4, x4, 1
beq x4, x7, loop_exit_14  # Conditional break from loop
blt x4, x1, loop_start_14 # Branch back to loop start
loop_exit_14: # Define loop exit label
# --- Resuming code after Loop 14 ---


# --- Closing Loop 13 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_13  # Conditional break from loop
blt x5, x1, loop_start_13 # Branch back to loop start
loop_exit_13: # Define loop exit label
# --- Resuming code after Loop 13 ---

lw x7, 44(x3)

# --- Starting Loop 15 (Depth: 1, break at 1, max 4) ---
addi x1, x0, 4
addi x4, x0, 1
addi x5, x0, 0
loop_start_15:
sw x5, 852(x3)
beq x0, x0, skip_taken_70 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_70:
sub x2, x1, x7
bne x0, x0, skip_nottaken_71 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_71:
sw x6, 184(x3)
add x5, x6, x6

# --- Closing Loop 15 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_15  # Conditional break from loop
blt x5, x1, loop_start_15 # Branch back to loop start
loop_exit_15: # Define loop exit label
# --- Resuming code after Loop 15 ---

sw x5, 856(x3)
bne x0, x0, skip_nottaken_72 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_72:
sw x4, 20(x3)
lw x5, 908(x3)
bne x0, x0, skip_nottaken_73 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_73:
sw x6, 640(x3)
sll x2, x1, x5

# --- Starting Loop 16 (Depth: 1, break at 1, max 5) ---
addi x1, x0, 5
addi x7, x0, 1
addi x4, x0, 0
loop_start_16:
lw x6, 592(x3)
add x4, x6, x7

# --- Closing Loop 16 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_exit_16  # Conditional break from loop
blt x4, x1, loop_start_16 # Branch back to loop start
loop_exit_16: # Define loop exit label
# --- Resuming code after Loop 16 ---

beq x0, x0, skip_taken_74 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_74:
beq x0, x0, skip_taken_75 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_75:
sub x7, x5, x1
bne x0, x0, skip_nottaken_76 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_76:
sw x2, 620(x3)

# --- Starting Loop 17 (Depth: 1, break at 1, max 9) ---
addi x2, x0, 9
addi x6, x0, 1
addi x4, x0, 0
loop_start_17:
bne x0, x0, skip_nottaken_77 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_77:
srl x1, x4, x2
beq x0, x0, skip_taken_78 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_78:

# --- Closing Loop 17 (Depth: 1) ---
addi x4, x4, 1
beq x4, x6, loop_exit_17  # Conditional break from loop
blt x4, x2, loop_start_17 # Branch back to loop start
loop_exit_17: # Define loop exit label
# --- Resuming code after Loop 17 ---

beq x0, x0, skip_taken_79 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_79:
sub x4, x2, x7
sw x6, 696(x3)

# --- Starting Loop 18 (Depth: 1, break at 5, max 8) ---
addi x7, x0, 8
addi x1, x0, 5
addi x5, x0, 0
loop_start_18:
and x7, x5, x1
sub x1, x2, x2
sw x4, 844(x3)
bne x0, x0, skip_nottaken_80 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_80:
bne x0, x0, skip_nottaken_81 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_81:
or x1, x4, x6
lw x5, 184(x3)
srl x7, x4, x2
sw x4, 868(x3)
bne x0, x0, skip_nottaken_82 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_82:

# --- Starting Loop 19 (Depth: 2, break at 2, max 8) ---
addi x7, x0, 8
addi x6, x0, 2
addi x4, x0, 0
loop_start_19:
beq x0, x0, skip_taken_83 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_83:

# --- Closing Loop 19 (Depth: 2) ---
addi x4, x4, 1
beq x4, x6, loop_exit_19  # Conditional break from loop
blt x4, x7, loop_start_19 # Branch back to loop start
loop_exit_19: # Define loop exit label
# --- Resuming code after Loop 19 ---


# --- Closing Loop 18 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_exit_18  # Conditional break from loop
blt x5, x7, loop_start_18 # Branch back to loop start
loop_exit_18: # Define loop exit label
# --- Resuming code after Loop 18 ---

srl x1, x5, x7
bne x0, x0, skip_nottaken_84 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_84:
sub x7, x1, x4
bne x0, x0, skip_nottaken_85 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_85:
bne x0, x0, skip_nottaken_86 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_86:
and x7, x4, x5
beq x0, x0, skip_taken_87 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_87:
beq x0, x0, skip_taken_88 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_88:
bne x0, x0, skip_nottaken_89 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_89:

# --- Starting Loop 20 (Depth: 1, break at 5, max 8) ---
addi x2, x0, 8
addi x1, x0, 5
addi x5, x0, 0
loop_start_20:
srl x7, x5, x1

# --- Starting Loop 21 (Depth: 2, break at 3, max 8) ---
addi x5, x0, 8
addi x4, x0, 3
addi x1, x0, 0
loop_start_21:
lw x7, 140(x3)
sw x1, 748(x3)
srl x6, x7, x5
sw x5, 852(x3)
bne x0, x0, skip_nottaken_90 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_90:

# --- Closing Loop 21 (Depth: 2) ---
addi x1, x1, 1
beq x1, x4, loop_exit_21  # Conditional break from loop
blt x1, x5, loop_start_21 # Branch back to loop start
loop_exit_21: # Define loop exit label
# --- Resuming code after Loop 21 ---

sw x7, 164(x3)
srl x1, x7, x7
bne x0, x0, skip_nottaken_91 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_91:
bne x0, x0, skip_nottaken_92 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_92:
sub x6, x1, x1

# --- Closing Loop 20 (Depth: 1) ---
addi x5, x5, 1
beq x5, x1, loop_exit_20  # Conditional break from loop
blt x5, x2, loop_start_20 # Branch back to loop start
loop_exit_20: # Define loop exit label
# --- Resuming code after Loop 20 ---


# --- Starting Loop 22 (Depth: 1, break at 3, max 5) ---
addi x2, x0, 5
addi x7, x0, 3
addi x5, x0, 0
loop_start_22:
lw x7, 112(x3)
sw x7, 792(x3)

# --- Closing Loop 22 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_exit_22  # Conditional break from loop
blt x5, x2, loop_start_22 # Branch back to loop start
loop_exit_22: # Define loop exit label
# --- Resuming code after Loop 22 ---

bne x0, x0, skip_nottaken_93 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_93:
sw x4, 564(x3)
bne x0, x0, skip_nottaken_94 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_94:
sw x5, 252(x3)
lw x2, 392(x3)
xor x4, x6, x7
xor x1, x6, x2
sw x2, 868(x3)
bne x0, x0, skip_nottaken_95 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_95:
sw x7, 816(x3)
lw x5, 984(x3)

# --- Starting Loop 23 (Depth: 1, break at 4, max 7) ---
addi x7, x0, 7
addi x6, x0, 4
addi x4, x0, 0
loop_start_23:
lw x5, 688(x3)

# --- Closing Loop 23 (Depth: 1) ---
addi x4, x4, 1
beq x4, x6, loop_exit_23  # Conditional break from loop
blt x4, x7, loop_start_23 # Branch back to loop start
loop_exit_23: # Define loop exit label
# --- Resuming code after Loop 23 ---

bne x0, x0, skip_nottaken_96 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_96:
sw x7, 40(x3)
bne x0, x0, skip_nottaken_97 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_97:
lw x2, 856(x3)

# --- Starting Loop 24 (Depth: 1, break at 1, max 6) ---
addi x5, x0, 6
addi x7, x0, 1
addi x1, x0, 0
loop_start_24:

# --- Closing Loop 24 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_exit_24  # Conditional break from loop
blt x1, x5, loop_start_24 # Branch back to loop start
loop_exit_24: # Define loop exit label
# --- Resuming code after Loop 24 ---

bne x0, x0, skip_nottaken_98 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_98:
lw x4, 564(x3)
sw x4, 948(x3)
sub x4, x7, x2
xor x1, x5, x2
bne x0, x0, skip_nottaken_99 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_99:
bne x0, x0, skip_nottaken_100 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_100:
lw x2, 928(x3)
and x5, x2, x1

# --- Starting Loop 25 (Depth: 1, break at 4, max 6) ---
addi x2, x0, 6
addi x4, x0, 4
addi x6, x0, 0
loop_start_25:
bne x0, x0, skip_nottaken_101 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_101:

# --- Closing Loop 25 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_exit_25  # Conditional break from loop
blt x6, x2, loop_start_25 # Branch back to loop start
loop_exit_25: # Define loop exit label
# --- Resuming code after Loop 25 ---

bne x0, x0, skip_nottaken_102 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_102:
xor x7, x6, x4
sw x7, 220(x3)
bne x0, x0, skip_nottaken_103 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_103:
sub x1, x5, x5

# --- Starting Loop 26 (Depth: 1, break at 4, max 8) ---
addi x6, x0, 8
addi x7, x0, 4
addi x2, x0, 0
loop_start_26:
bne x0, x0, skip_nottaken_104 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_104:
srl x2, x5, x7
or x2, x7, x7

# --- Closing Loop 26 (Depth: 1) ---
addi x2, x2, 1
beq x2, x7, loop_exit_26  # Conditional break from loop
blt x2, x6, loop_start_26 # Branch back to loop start
loop_exit_26: # Define loop exit label
# --- Resuming code after Loop 26 ---

or x5, x2, x4
sub x7, x4, x4
bne x0, x0, skip_nottaken_105 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_105:

# --- Starting Loop 27 (Depth: 1, break at 3, max 8) ---
addi x1, x0, 8
addi x2, x0, 3
addi x4, x0, 0
loop_start_27:
bne x0, x0, skip_nottaken_106 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_106:
sw x4, 500(x3)
bne x0, x0, skip_nottaken_107 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_107:

# --- Closing Loop 27 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_exit_27  # Conditional break from loop
blt x4, x1, loop_start_27 # Branch back to loop start
loop_exit_27: # Define loop exit label
# --- Resuming code after Loop 27 ---

bne x0, x0, skip_nottaken_108 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_108:
sw x6, 952(x3)
bne x0, x0, skip_nottaken_109 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_109:

# --- Starting Loop 28 (Depth: 1, break at 3, max 7) ---
addi x7, x0, 7
addi x4, x0, 3
addi x5, x0, 0
loop_start_28:

# --- Closing Loop 28 (Depth: 1) ---
addi x5, x5, 1
beq x5, x4, loop_exit_28  # Conditional break from loop
blt x5, x7, loop_start_28 # Branch back to loop start
loop_exit_28: # Define loop exit label
# --- Resuming code after Loop 28 ---

bne x0, x0, skip_nottaken_110 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_110:

# --- Starting Loop 29 (Depth: 1, break at 3, max 8) ---
addi x2, x0, 8
addi x4, x0, 3
addi x6, x0, 0
loop_start_29:

# --- Closing Loop 29 (Depth: 1) ---
addi x6, x6, 1
beq x6, x4, loop_exit_29  # Conditional break from loop
blt x6, x2, loop_start_29 # Branch back to loop start
loop_exit_29: # Define loop exit label
# --- Resuming code after Loop 29 ---

bne x0, x0, skip_nottaken_111 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_111:
sw x6, 236(x3)
lw x1, 636(x3)
lw x4, 52(x3)
xor x7, x5, x1
bne x0, x0, skip_nottaken_112 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_112:
sw x7, 360(x3)
xor x1, x2, x2
sw x7, 120(x3)
beq x0, x0, skip_taken_113 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_113:
bne x0, x0, skip_nottaken_114 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_114:
sw x1, 952(x3)
xor x5, x4, x2
bne x0, x0, skip_nottaken_115 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_115:
sw x5, 128(x3)
bne x0, x0, skip_nottaken_116 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_116:
bne x0, x0, skip_nottaken_117 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_117:
bne x0, x0, skip_nottaken_118 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_118:
xor x5, x2, x7
sw x4, 916(x3)
lw x1, 124(x3)
bne x0, x0, skip_nottaken_119 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_119:
lw x4, 592(x3)
srl x5, x4, x6
bne x0, x0, skip_nottaken_120 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_120:
bne x0, x0, skip_nottaken_121 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_121:
xor x2, x1, x6
bne x0, x0, skip_nottaken_122 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_122:

# --- Starting Loop 30 (Depth: 1, break at 2, max 8) ---
addi x5, x0, 8
addi x1, x0, 2
addi x6, x0, 0
loop_start_30:

# --- Closing Loop 30 (Depth: 1) ---
addi x6, x6, 1
beq x6, x1, loop_exit_30  # Conditional break from loop
blt x6, x5, loop_start_30 # Branch back to loop start
loop_exit_30: # Define loop exit label
# --- Resuming code after Loop 30 ---

lw x1, 716(x3)
sw x4, 28(x3)
add x1, x5, x7
bne x0, x0, skip_nottaken_123 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_123:

# --- Starting Loop 31 (Depth: 1, break at 2, max 8) ---
addi x5, x0, 8
addi x2, x0, 2
addi x6, x0, 0
loop_start_31:
beq x0, x0, skip_taken_124 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_124:
add x6, x2, x4

# --- Closing Loop 31 (Depth: 1) ---
addi x6, x6, 1
beq x6, x2, loop_exit_31  # Conditional break from loop
blt x6, x5, loop_start_31 # Branch back to loop start
loop_exit_31: # Define loop exit label
# --- Resuming code after Loop 31 ---

srl x6, x4, x4

# --- Starting Loop 32 (Depth: 1, break at 5, max 7) ---
addi x1, x0, 7
addi x2, x0, 5
addi x4, x0, 0
loop_start_32:
and x4, x4, x7

# --- Closing Loop 32 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_exit_32  # Conditional break from loop
blt x4, x1, loop_start_32 # Branch back to loop start
loop_exit_32: # Define loop exit label
# --- Resuming code after Loop 32 ---


# --- Starting Loop 33 (Depth: 1, break at 1, max 6) ---
addi x7, x0, 6
addi x1, x0, 1
addi x6, x0, 0
loop_start_33:
bne x0, x0, skip_nottaken_125 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_125:
bne x0, x0, skip_nottaken_126 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_126:

# --- Closing Loop 33 (Depth: 1) ---
addi x6, x6, 1
beq x6, x1, loop_exit_33  # Conditional break from loop
blt x6, x7, loop_start_33 # Branch back to loop start
loop_exit_33: # Define loop exit label
# --- Resuming code after Loop 33 ---

beq x0, x0, skip_taken_127 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_127:
bne x0, x0, skip_nottaken_128 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_128:
sw x6, 48(x3)

# --- Starting Loop 34 (Depth: 1, break at 5, max 9) ---
addi x7, x0, 9
addi x6, x0, 5
addi x1, x0, 0
loop_start_34:
lw x1, 48(x3)
lw x7, 196(x3)

# --- Closing Loop 34 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_exit_34  # Conditional break from loop
blt x1, x7, loop_start_34 # Branch back to loop start
loop_exit_34: # Define loop exit label
# --- Resuming code after Loop 34 ---

lw x6, 260(x3)
and x5, x4, x2
bne x0, x0, skip_nottaken_129 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_129:
lw x2, 216(x3)
bne x0, x0, skip_nottaken_130 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_130:
sw x7, 224(x3)
and x2, x1, x1
sw x5, 892(x3)

# --- Starting Loop 35 (Depth: 1, break at 2, max 4) ---
addi x5, x0, 4
addi x4, x0, 2
addi x1, x0, 0
loop_start_35:

# --- Closing Loop 35 (Depth: 1) ---
addi x1, x1, 1
beq x1, x4, loop_exit_35  # Conditional break from loop
blt x1, x5, loop_start_35 # Branch back to loop start
loop_exit_35: # Define loop exit label
# --- Resuming code after Loop 35 ---

bne x0, x0, skip_nottaken_131 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_131:
and x4, x1, x5
xor x7, x5, x6

# --- Starting Loop 36 (Depth: 1, break at 3, max 8) ---
addi x4, x0, 8
addi x6, x0, 3
addi x5, x0, 0
loop_start_36:
xor x1, x6, x6

# --- Closing Loop 36 (Depth: 1) ---
addi x5, x5, 1
beq x5, x6, loop_exit_36  # Conditional break from loop
blt x5, x4, loop_start_36 # Branch back to loop start
loop_exit_36: # Define loop exit label
# --- Resuming code after Loop 36 ---

bne x0, x0, skip_nottaken_132 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_132:

# --- Starting Loop 37 (Depth: 1, break at 5, max 7) ---
addi x6, x0, 7
addi x2, x0, 5
addi x7, x0, 0
loop_start_37:
sw x4, 320(x3)
lw x2, 124(x3)
xor x6, x4, x5
xor x6, x5, x2
bne x0, x0, skip_nottaken_133 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_133:

# --- Closing Loop 37 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_exit_37  # Conditional break from loop
blt x7, x6, loop_start_37 # Branch back to loop start
loop_exit_37: # Define loop exit label
# --- Resuming code after Loop 37 ---

bne x0, x0, skip_nottaken_134 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_134:
bne x0, x0, skip_nottaken_135 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_135:
bne x0, x0, skip_nottaken_136 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_136:
lw x1, 872(x3)
sub x5, x6, x2
bne x0, x0, skip_nottaken_137 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_137:
sub x6, x4, x7
srl x5, x6, x4
srl x2, x7, x6
xor x5, x7, x6
add x2, x6, x6
bne x0, x0, skip_nottaken_138 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_138:
bne x0, x0, skip_nottaken_139 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_139:
or x6, x5, x5
lw x5, 180(x3)
sw x6, 696(x3)
bne x0, x0, skip_nottaken_140 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_140:
add x1, x4, x2
sll x7, x6, x6

# --- Starting Loop 38 (Depth: 1, break at 2, max 3) ---
addi x6, x0, 3
addi x5, x0, 2
addi x2, x0, 0
loop_start_38:
and x4, x7, x7

# --- Starting Loop 39 (Depth: 2, break at 2, max 6) ---
addi x2, x0, 6
addi x7, x0, 2
addi x5, x0, 0
loop_start_39:
bne x0, x0, skip_nottaken_141 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_141:
bne x0, x0, skip_nottaken_142 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_142:

# --- Closing Loop 39 (Depth: 2) ---
addi x5, x5, 1
beq x5, x7, loop_exit_39  # Conditional break from loop
blt x5, x2, loop_start_39 # Branch back to loop start
loop_exit_39: # Define loop exit label
# --- Resuming code after Loop 39 ---

sw x6, 448(x3)

# --- Starting Loop 40 (Depth: 2, break at 3, max 6) ---
addi x1, x0, 6
addi x2, x0, 3
addi x4, x0, 0
loop_start_40:
xor x4, x5, x6

# --- Closing Loop 40 (Depth: 2) ---
addi x4, x4, 1
beq x4, x2, loop_exit_40  # Conditional break from loop
blt x4, x1, loop_start_40 # Branch back to loop start
loop_exit_40: # Define loop exit label
# --- Resuming code after Loop 40 ---


# --- Closing Loop 38 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_exit_38  # Conditional break from loop
blt x2, x6, loop_start_38 # Branch back to loop start
loop_exit_38: # Define loop exit label
# --- Resuming code after Loop 38 ---

lw x7, 384(x3)
add x4, x2, x1

# --- Starting Loop 41 (Depth: 1, break at 2, max 4) ---
addi x2, x0, 4
addi x7, x0, 2
addi x5, x0, 0
loop_start_41:
or x7, x2, x4
bne x0, x0, skip_nottaken_143 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_143:

# --- Closing Loop 41 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_exit_41  # Conditional break from loop
blt x5, x2, loop_start_41 # Branch back to loop start
loop_exit_41: # Define loop exit label
# --- Resuming code after Loop 41 ---

xor x4, x5, x5
sw x5, 292(x3)
add x5, x4, x2
bne x0, x0, skip_nottaken_144 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_144:

# --- Starting Loop 42 (Depth: 1, break at 2, max 7) ---
addi x7, x0, 7
addi x2, x0, 2
addi x4, x0, 0
loop_start_42:
or x6, x7, x2

# --- Starting Loop 43 (Depth: 2, break at 3, max 4) ---
addi x2, x0, 4
addi x1, x0, 3
addi x5, x0, 0
loop_start_43:

# --- Closing Loop 43 (Depth: 2) ---
addi x5, x5, 1
beq x5, x1, loop_exit_43  # Conditional break from loop
blt x5, x2, loop_start_43 # Branch back to loop start
loop_exit_43: # Define loop exit label
# --- Resuming code after Loop 43 ---


# --- Closing Loop 42 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_exit_42  # Conditional break from loop
blt x4, x7, loop_start_42 # Branch back to loop start
loop_exit_42: # Define loop exit label
# --- Resuming code after Loop 42 ---

bne x0, x0, skip_nottaken_145 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_145:
bne x0, x0, skip_nottaken_146 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_146:
sw x5, 0(x3)
beq x0, x0, skip_taken_147 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_147:
bne x0, x0, skip_nottaken_148 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_148:

# --- Starting Loop 44 (Depth: 1, break at 1, max 4) ---
addi x5, x0, 4
addi x1, x0, 1
addi x2, x0, 0
loop_start_44:
and x6, x2, x4
add x1, x6, x4

# --- Closing Loop 44 (Depth: 1) ---
addi x2, x2, 1
beq x2, x1, loop_exit_44  # Conditional break from loop
blt x2, x5, loop_start_44 # Branch back to loop start
loop_exit_44: # Define loop exit label
# --- Resuming code after Loop 44 ---

bne x0, x0, skip_nottaken_149 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_149:
sw x7, 468(x3)
lw x5, 336(x3)
lw x4, 124(x3)
lw x1, 820(x3)
beq x0, x0, skip_taken_150 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_150:
bne x0, x0, skip_nottaken_151 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_151:
add x1, x1, x5

# --- Starting Loop 45 (Depth: 1, break at 5, max 8) ---
addi x5, x0, 8
addi x2, x0, 5
addi x7, x0, 0
loop_start_45:
bne x0, x0, skip_nottaken_152 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_152:
bne x0, x0, skip_nottaken_153 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_153:

# --- Closing Loop 45 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_exit_45  # Conditional break from loop
blt x7, x5, loop_start_45 # Branch back to loop start
loop_exit_45: # Define loop exit label
# --- Resuming code after Loop 45 ---

bne x0, x0, skip_nottaken_154 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_154:
bne x0, x0, skip_nottaken_155 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_155:
add x7, x6, x1
lw x6, 192(x3)
bne x0, x0, skip_nottaken_156 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_156:
add x4, x2, x5
beq x0, x0, skip_taken_157 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_157:
bne x0, x0, skip_nottaken_158 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_158:
bne x0, x0, skip_nottaken_159 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_159:
lw x6, 420(x3)
sw x6, 140(x3)

# --- Starting Loop 46 (Depth: 1, break at 3, max 10) ---
addi x1, x0, 10
addi x7, x0, 3
addi x4, x0, 0
loop_start_46:
sub x4, x1, x5

# --- Closing Loop 46 (Depth: 1) ---
addi x4, x4, 1
beq x4, x7, loop_exit_46  # Conditional break from loop
blt x4, x1, loop_start_46 # Branch back to loop start
loop_exit_46: # Define loop exit label
# --- Resuming code after Loop 46 ---

bne x0, x0, skip_nottaken_160 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_160:
bne x0, x0, skip_nottaken_161 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_161:
sw x2, 80(x3)
srl x4, x7, x7
bne x0, x0, skip_nottaken_162 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_162:
beq x0, x0, skip_taken_163 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_163:
xor x5, x4, x7
sub x1, x4, x4
bne x0, x0, skip_nottaken_164 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_164:
xor x5, x1, x7
bne x0, x0, skip_nottaken_165 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_165:
sw x7, 664(x3)
bne x0, x0, skip_nottaken_166 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_166:
xor x6, x7, x4
bne x0, x0, skip_nottaken_167 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_167:
bne x0, x0, skip_nottaken_168 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_168:
sw x2, 696(x3)
xor x4, x5, x2
xor x5, x4, x6
bne x0, x0, skip_nottaken_169 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_169:
bne x0, x0, skip_nottaken_170 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_170:
bne x0, x0, skip_nottaken_171 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_171:
sll x5, x1, x4
lw x7, 184(x3)
bne x0, x0, skip_nottaken_172 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_172:
bne x0, x0, skip_nottaken_173 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_173:
sw x2, 704(x3)
or x2, x4, x6
lw x5, 696(x3)
lw x2, 564(x3)
bne x0, x0, skip_nottaken_174 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_174:
xor x5, x1, x6
bne x0, x0, skip_nottaken_175 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_175:
bne x0, x0, skip_nottaken_176 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_176:

# --- Starting Loop 47 (Depth: 1, break at 1, max 5) ---
addi x6, x0, 5
addi x1, x0, 1
addi x7, x0, 0
loop_start_47:
bne x0, x0, skip_nottaken_177 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_177:
or x7, x1, x5
sw x5, 284(x3)
bne x0, x0, skip_nottaken_178 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_178:
bne x0, x0, skip_nottaken_179 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_179:
lw x4, 124(x3)
bne x0, x0, skip_nottaken_180 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_180:
or x4, x7, x1

# --- Closing Loop 47 (Depth: 1) ---
addi x7, x7, 1
beq x7, x1, loop_exit_47  # Conditional break from loop
blt x7, x6, loop_start_47 # Branch back to loop start
loop_exit_47: # Define loop exit label
# --- Resuming code after Loop 47 ---

lw x4, 560(x3)
lw x6, 916(x3)
sw x4, 192(x3)
sll x4, x7, x5
sll x5, x1, x7
sw x1, 212(x3)
sw x1, 24(x3)
lw x1, 764(x3)

# --- Starting Loop 48 (Depth: 1, break at 1, max 9) ---
addi x7, x0, 9
addi x5, x0, 1
addi x2, x0, 0
loop_start_48:
lw x1, 800(x3)

# --- Closing Loop 48 (Depth: 1) ---
addi x2, x2, 1
beq x2, x5, loop_exit_48  # Conditional break from loop
blt x2, x7, loop_start_48 # Branch back to loop start
loop_exit_48: # Define loop exit label
# --- Resuming code after Loop 48 ---

bne x0, x0, skip_nottaken_181 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_181:
lw x6, 984(x3)
bne x0, x0, skip_nottaken_182 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_182:
sw x5, 116(x3)
sll x4, x1, x7
lw x1, 584(x3)
sub x4, x1, x1
bne x0, x0, skip_nottaken_183 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_183:
srl x6, x7, x5
bne x0, x0, skip_nottaken_184 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_184:
bne x0, x0, skip_nottaken_185 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_185:
add x4, x2, x1
bne x0, x0, skip_nottaken_186 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_186:
srl x5, x7, x1
lw x7, 652(x3)

# --- Starting Loop 49 (Depth: 1, break at 1, max 4) ---
addi x1, x0, 4
addi x5, x0, 1
addi x6, x0, 0
loop_start_49:
bne x0, x0, skip_nottaken_187 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_187:
sub x4, x7, x7

# --- Closing Loop 49 (Depth: 1) ---
addi x6, x6, 1
beq x6, x5, loop_exit_49  # Conditional break from loop
blt x6, x1, loop_start_49 # Branch back to loop start
loop_exit_49: # Define loop exit label
# --- Resuming code after Loop 49 ---

bne x0, x0, skip_nottaken_188 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_188:
lw x2, 752(x3)
sll x5, x6, x1

# --- Starting Loop 50 (Depth: 1, break at 5, max 8) ---
addi x6, x0, 8
addi x2, x0, 5
addi x7, x0, 0
loop_start_50:
xor x7, x2, x5
sw x1, 704(x3)

# --- Closing Loop 50 (Depth: 1) ---
addi x7, x7, 1
beq x7, x2, loop_exit_50  # Conditional break from loop
blt x7, x6, loop_start_50 # Branch back to loop start
loop_exit_50: # Define loop exit label
# --- Resuming code after Loop 50 ---

bne x0, x0, skip_nottaken_189 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_189:
sw x5, 264(x3)
lw x4, 600(x3)
sll x7, x5, x2
sw x5, 360(x3)
sw x1, 872(x3)
lw x4, 840(x3)
bne x0, x0, skip_nottaken_190 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_190:
sub x5, x4, x2
bne x0, x0, skip_nottaken_191 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_191:
add x1, x5, x5

# --- Starting Loop 51 (Depth: 1, break at 1, max 5) ---
addi x5, x0, 5
addi x2, x0, 1
addi x6, x0, 0
loop_start_51:
sw x7, 188(x3)

# --- Closing Loop 51 (Depth: 1) ---
addi x6, x6, 1
beq x6, x2, loop_exit_51  # Conditional break from loop
blt x6, x5, loop_start_51 # Branch back to loop start
loop_exit_51: # Define loop exit label
# --- Resuming code after Loop 51 ---

bne x0, x0, skip_nottaken_192 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_192:
lw x7, 424(x3)
sw x4, 996(x3)
bne x0, x0, skip_nottaken_193 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_193:

# --- Starting Loop 52 (Depth: 1, break at 5, max 7) ---
addi x2, x0, 7
addi x6, x0, 5
addi x1, x0, 0
loop_start_52:

# --- Closing Loop 52 (Depth: 1) ---
addi x1, x1, 1
beq x1, x6, loop_exit_52  # Conditional break from loop
blt x1, x2, loop_start_52 # Branch back to loop start
loop_exit_52: # Define loop exit label
# --- Resuming code after Loop 52 ---


# --- Starting Loop 53 (Depth: 1, break at 3, max 9) ---
addi x2, x0, 9
addi x7, x0, 3
addi x5, x0, 0
loop_start_53:

# --- Closing Loop 53 (Depth: 1) ---
addi x5, x5, 1
beq x5, x7, loop_exit_53  # Conditional break from loop
blt x5, x2, loop_start_53 # Branch back to loop start
loop_exit_53: # Define loop exit label
# --- Resuming code after Loop 53 ---

sw x5, 300(x3)
sw x1, 888(x3)
add x5, x7, x2

# --- Final cleanup: Closing all remaining open loops ---

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
