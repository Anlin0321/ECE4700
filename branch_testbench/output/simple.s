# Initialize memory base register x3
lui x3, 1
addi x3, x3, 0

sw x4, 476(x3)

# --- Starting Loop 1 (Depth: 1, break at 5, max 7) ---
addi x6, x0, 7
addi x2, x0, 5
addi x4, x0, 0
loop_start_1: # Loop body start
xor x2, x4, x1
lw x6, 432(x3)
bne x0, x0, 8 # Never branch
nop # Executed instruction
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
loop_start_2: # Loop body start
sw x4, 476(x3)
sw x4, 248(x3)

# --- Closing Loop 2 (Depth: 2) ---
addi x2, x2, 1
beq x2, x1, loop_end_2  # Conditional break from loop
bge x2, x5, loop_end_2 # Main loop exit condition
j loop_start_2 # Jump back to loop start
loop_end_2: # --- Resuming code after Loop 2 ---

beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
and x1, x5, x4
xor x4, x1, x5
add x7, x2, x1
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 1 (Depth: 1) ---
addi x4, x4, 1
beq x4, x2, loop_end_1  # Conditional break from loop
bge x4, x6, loop_end_1 # Main loop exit condition
j loop_start_1 # Jump back to loop start
loop_end_1: # --- Resuming code after Loop 1 ---

sll x7, x4, x2
sll x4, x5, x2
sw x1, 248(x3)

# --- Starting Loop 3 (Depth: 1, break at 3, max 9) ---
addi x5, x0, 9
addi x7, x0, 3
addi x1, x0, 0
loop_start_3: # Loop body start
lw x5, 996(x3)

# --- Starting Loop 4 (Depth: 2, break at 4, max 8) ---
addi x7, x0, 8
addi x4, x0, 4
addi x2, x0, 0
loop_start_4: # Loop body start
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Closing Loop 4 (Depth: 2) ---
addi x2, x2, 1
beq x2, x4, loop_end_4  # Conditional break from loop
bge x2, x7, loop_end_4 # Main loop exit condition
j loop_start_4 # Jump back to loop start
loop_end_4: # --- Resuming code after Loop 4 ---

add x2, x6, x7

# --- Closing Loop 3 (Depth: 1) ---
addi x1, x1, 1
beq x1, x7, loop_end_3  # Conditional break from loop
bge x1, x5, loop_end_3 # Main loop exit condition
j loop_start_3 # Jump back to loop start
loop_end_3: # --- Resuming code after Loop 3 ---

lw x6, 96(x3)
lw x2, 744(x3)
lw x6, 140(x3)
sll x7, x6, x6
add x4, x7, x2
bne x0, x0, 8 # Never branch
nop # Executed instruction
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x6, 616(x3)
lw x7, 60(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch

# --- Starting Loop 5 (Depth: 1, break at 3, max 5) ---
addi x2, x0, 5
addi x5, x0, 3
addi x6, x0, 0
loop_start_5: # Loop body start
lw x7, 340(x3)
sub x2, x6, x4
bne x0, x0, 8 # Never branch
nop # Executed instruction

# --- Starting Loop 6 (Depth: 2, break at 2, max 8) ---
addi x6, x0, 8
addi x4, x0, 2
addi x1, x0, 0
loop_start_6: # Loop body start
sw x7, 656(x3)
lw x5, 628(x3)
xor x1, x4, x2
sw x5, 56(x3)
or x1, x4, x7
srl x7, x2, x5
lw x4, 940(x3)
beq x0, x0, 8 # Always branch
nop # Skipped instruction
nop # Target of the branch
lw x5, 292(x3)

# --- Final cleanup: Closing all remaining open loops ---

# Closing remaining Loop 6
addi x1, x1, 1
beq x1, x4, loop_end_6
bge x1, x6, loop_end_6
j loop_start_6
loop_end_6: # Loop exit

# Closing remaining Loop 5
addi x6, x6, 1
beq x6, x5, loop_end_5
bge x6, x2, loop_end_5
j loop_start_5
loop_end_5: # Loop exit

# Program exit
li a7, 93 # ecall: exit
ecall
