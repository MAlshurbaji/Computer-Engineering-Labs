# Digital Systems

## Lab 03 · Karnaugh Maps: Practice Quiz

Show your working and label circuit inputs, outputs, and intermediate wires. Equivalent correct minimal forms are accepted.

Notation: `X'` means NOT X, `XY` means AND, `X + Y` means OR, and `X ⊕ Y` means XOR. Inputs are independent bits unless stated otherwise; 0 means the opposite of the stated 1 meaning. Read bit words with the leftmost bit most significant. For a three-input K-map use rows `A = 0, 1` and columns `BC = 00, 01, 11, 10`; for four inputs use rows `AB = 00, 01, 11, 10` and columns `CD` in the same Gray order. Opposite edges are adjacent; diagonals are not. Use no don't-care cells.

### 1. One drink selection

Three independent drink buttons are `A`, `B`, and `C`; 1 means pressed. `Accept` must be 1 only when exactly one button is pressed.
Make the truth table and K-map, obtain a minimal SOP, and draw a circuit using two-input AND/OR gates and NOT gates. Explain why any proposed diagonal pairing would change the required behavior.

### 2. Choose a working movie setup

`A = 1`: the TV is ready. `B = 1`: its remote is available. `C = 1`: a laptop is ready. `D = 1`: the laptop's separate speaker is ready.
A film can play using the TV with its remote, the laptop with its speaker, or the laptop connected to the TV. Any working option is enough.
Create the 16-row truth table, use a K-map to obtain a minimal SOP, and draw the reduced circuit. List the input words covered by each group.

### 3. Repair a grouped map

A toy bridge has four on/off switches. `A` and `B` are direction requests, `C` is a manual open request, and `D` selects automatic mode; 1 means each named signal is active.
In automatic mode, open the bridge only when the direction requests differ. Outside automatic mode, follow the manual request.
A proposed circuit is `Bad = A'D + CD'`.
Draw the required K-map, list every input word where `Bad` differs from the rule, and replace it with a minimal SOP. Show the corrected groups.

### 4. An enabled disagreement indicator

`A = 1`: a cabinet monitor is enabled. `B = 1` and `C = 1`: its two door contacts report open.
The indicator must be 1 exactly when monitoring is enabled and the contacts disagree.
Use a K-map to derive the SOP, then draw an equivalent circuit built entirely from two-input NAND gates. Label each intermediate output and verify the disabled cases.

### 5. A three-person readiness rule

Four friends each have a ready switch: `A`, `B`, `C`, and `D`; 1 means ready. A group call may begin when at least three friends are ready.
Form the truth table and K-map. Find a minimal POS by grouping zeros and draw its two-input-gate implementation. State the number of sum terms and literal occurrences in your POS.
