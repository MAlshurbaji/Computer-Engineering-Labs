# Digital Systems

## Lab 02 · Boolean Algebra and Circuit Simplification: Practice Quiz

Show Boolean-algebra steps and label circuit inputs and outputs. Use algebra rather than Karnaugh maps.

Use `1` for true/on and `0` for false/off. `+` means OR, `·` means AND, and a prime (`'`) negates the preceding signal or parenthesized expression. Use two-input AND/OR gates and one-input NOT gates. Signals may branch to several gates; an inverted signal may be shared within one circuit. Assume ideal gates and read outputs after inputs have settled.

### 1. Reduce a lamp controller

`A=1` means manual light is requested, `B=1` means a timer requests light, `C=1` means the room is dim, and `D=1` means the timer is paused. A draft circuit is `F=(A+B)·(A+C)·(A+D')`.

Simplify it into a sum of products. Draw the literal draft circuit and the simplified circuit. Count AND, OR, and NOT gates in each drawing. For the draft, form all three parenthesized OR results first, then AND them together. Construct a complete 16-row truth table to verify the reduction.

### 2. Mark a picnic bag ready

The inputs are `W` (water packed), `S` (sandwich packed), `F` (fruit pot packed), and `K` (fork packed); 1 means packed. A small carrier has room for exactly one meal option: a sandwich or a fruit pot. A ready carrier contains water and exactly one of those options. The fruit-pot option also requires a fork; a fork is optional with the sandwich. Packing both meal options is not a ready state.

Construct the complete truth table in `W,S,F,K` order. Write a sum with one four-literal product for each output-1 row, simplify it using Boolean algebra to a sum of products, and draw the simplified circuit.

### 3. Audit a complemented expression

`A`, `B`, and `C` are three bedside-control switches; 1 means pressed. A circuit produces `Q=(A'·B+C')'`. A proposed rewrite is `R=(A+B')+C`.

Apply De Morgan's laws to express `Q` without a complement over a group. Construct a complete eight-row table for `Q` and `R`. State whether they are equivalent, and list every input row that disproves equivalence. Draw a circuit for the correct rewritten `Q`.

### 4. Plan seven independent desk indicators

For each desk, `A=1` means its reminder is silenced; `B=1` and `C=1` mean two different reminder buttons are pressed. The literal circuit is `Y=A'·B+A'·C`, with its `A'` signal shared between the two products.

Factor the expression and draw one circuit before and one after simplification. Seven desks have separate input signals. Gate outputs cannot be shared between desks, but spare gates within a chip may serve different desks.

Calculate the total NOT, two-input AND, and two-input OR gates before and after simplification. Then give the smallest whole-chip count for each type in each design: a 7404 contains six NOT gates, a 7408 contains four two-input AND gates, and a 7432 contains four two-input OR gates.
