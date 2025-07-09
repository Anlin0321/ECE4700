# Initialize memory base register x3
lui x3, 1
addi x3, x3, 0

sw x4, 476(x3)

# --- Starting Loop 1 (Depth: 1, break at 5, max 7) ---
addi x6, x0, 7
addi x2, x0, 5
addi x4, x0, 0
loop_start_1:
xor x2, x5, x1
lw x6, 432(x3)
bne x0, x0, skip_nottaken_1 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_1:
lw x4, 404(x3)
lw x5, 4(x3)
lw x4, 720(x3)
sw x5, 184(x3)
sll x4, x7, x6
sw x2, 704(x3)
sw x1, 32(x3)
lw x5, 856(x3)
lw x2, 700(x3)
sw x5, 996(x3)
sw x4, 344(x3)

# --- Starting Loop 2 (Depth: 2, break at 5, max 8) ---
addi x5, x0, 8
addi x1, x0, 5
addi x2, x0, 0
loop_start_2:
sw x4, 476(x3)
sw x4, 248(x3)

# --- Closing Loop 2 (Depth: 2) ---
addi x2, x2, 1
beq x2, x1, loop_exit_2  # Conditional break from loop
blt x2, x5, loop_start_2 # Branch back to loop start
loop_exit_2: # Define loop exit label
# --- Resuming code after Loop 2 ---

beq x0, x0, skip_taken_2 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_2:
and x1, x5, x4
xor x4, x2, x5
add x7, x2, x1
bne x0, x0, skip_nottaken_3 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_3:

# --- Closing Loop 1 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_exit_1  # Conditional break from loop
blt x4, x6, loop_start_1 # Branch back to loop start
loop_exit_1: # Define loop exit label
# --- Resuming code after Loop 1 ---

sll x7, x4, x6
bne x0, x0, skip_nottaken_4 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_4:
sll x4, x5, x2
sw x1, 248(x3)

# --- Starting Loop 3 (Depth: 1, break at 3, max 9) ---
addi x5, x0, 9
addi x7, x0, 3
addi x1, x0, 0
loop_start_3:
lw x5, 996(x3)

# --- Starting Loop 4 (Depth: 2, break at 4, max 8) ---
addi x7, x0, 8
addi x4, x0, 4
addi x2, x0, 0
loop_start_4:
beq x0, x0, skip_taken_5 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_5:
bne x0, x0, skip_nottaken_6 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_6:

# --- Closing Loop 4 (Depth: 2) ---
addi x2, x2, 1
beq x2, x4, loop_exit_4  # Conditional break from loop
blt x2, x7, loop_start_4 # Branch back to loop start
loop_exit_4: # Define loop exit label
# --- Resuming code after Loop 4 ---

add x2, x6, x6

# --- Closing Loop 3 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_exit_3  # Conditional break from loop
blt x1, x5, loop_start_3 # Branch back to loop start
loop_exit_3: # Define loop exit label
# --- Resuming code after Loop 3 ---

lw x6, 96(x3)
lw x2, 744(x3)
lw x6, 140(x3)
sll x7, x6, x6
add x4, x2, x6
sw x5, 624(x3)
sw x6, 616(x3)

# --- Starting Loop 5 (Depth: 1, break at 3, max 7) ---
addi x2, x0, 7
addi x1, x0, 3
addi x6, x0, 0
loop_start_5:
sub x2, x7, x7
lw x7, 340(x3)
sub x2, x6, x4
bne x0, x0, skip_nottaken_7 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_7:

# --- Starting Loop 6 (Depth: 2, break at 2, max 8) ---
addi x6, x0, 8
addi x4, x0, 2
addi x1, x0, 0
loop_start_6:
sw x7, 656(x3)
lw x5, 628(x3)
xor x1, x4, x2
sw x5, 56(x3)
or x1, x4, x6
srl x7, x4, x5
lw x4, 940(x3)
beq x0, x0, skip_taken_8 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_8:
lw x5, 292(x3)
or x2, x4, x7
and x1, x7, x6
beq x0, x0, skip_taken_9 # Always branch
addi x0, x0, 0  # This instruction is skipped
skip_taken_9:
sw x7, 548(x3)
lw x2, 932(x3)
bne x0, x0, skip_nottaken_10 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_10:
bne x0, x0, skip_nottaken_11 # Never branch
addi x0, x0, 0  # This instruction is executed
skip_nottaken_11:
and x7, x4, x1
and x2, x6, x6

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 6
addi x1, x1, 1
beq x1, x4, loop_exit_6
blt x1, x6, loop_start_6
loop_exit_6:

# Closing remaining Loop 5
addi x6, x6, 1
beq x6, x1, loop_exit_5
blt x6, x2, loop_start_5
loop_exit_5:

# Program exit
addi x0, x0, 0   # Set exit code to 0
addi x0, x0, 93  # Exit syscall number
ecall
