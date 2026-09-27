# Digital Systems

## Lab 06 · Data Selection and Routing: Practice Quiz

Show the requested tables, equations, and labelled circuit or block drawings. Equivalent correct gate forms are accepted.

Use `1` for the stated condition and `0` for its opposite. `+` means OR, `·` means AND, and a prime (`'`) means NOT. All circuits act on the current inputs; read outputs after they settle. In selector word `S1S0`, `S1` is the most significant bit: `00`, `01`, `10`, `11` select ports 0, 1, 2, 3 respectively. Output lists are always in labelled order `Y0,Y1,Y2,Y3`.

A 2:1 MUX passes `I0` at selector 0 and `I1` at selector 1. A 4:1 MUX passes the port selected by `S1S0`. An enabled 2-to-4 decoder produces one selected 1 when enabled and four zeros when disabled. A 1-to-4 DEMUX passes its data to the selected output and sets all other outputs to 0.

### 1. Choose a laundry reminder

`W=1` means a washing machine has finished; `D=1` means a dryer has finished. `S=0` selects the washing machine and `S=1` the dryer. `E=1` enables the display; `E=0` must force its reminder `Y` to 0.

Write `Y` as a Boolean expression, construct the complete truth table in `E,S,W,D` order, and draw a circuit using one 2:1 MUX and one AND gate. Label the MUX ports.

### 2. Select a reminder mode

`R=1` means rain is detected. A 4:1 MUX controls a reminder with four modes: `00` always off, `01` on only during rain, `10` on only without rain, and `11` always on for a lamp test.

Assign each data port to `0`, `1`, `R`, or `R'`. Build the complete eight-row table in `S1,S0,R` order. Draw the MUX and any required NOT gate, and write the output as an AND/OR/NOT expression.

### 3. Show which shelf to check

An enabled 2-to-4 decoder selects shelves 0–3. `E=1` means the shelf guide is open; its outputs are `Z0`–`Z3`. `S1S0` is the shelf number. Shelves 0 and 1 are on the left; shelves 2 and 3 are on the right.

Use decoder outputs to create `Left` and `Right` indicators. Both must be 0 while the guide is disabled. Give their OR connections, construct the complete table in `E,S1,S0` order for the two indicators, and draw the decoder with the added gates. Also write `Z3` directly in terms of `E,S1,S0`.

### 4. Choose a timer and a destination

`A=1` and `B=1` mean two kitchen timers have finished. A source selector `T` chooses timer A at 0 or timer B at 1, producing `H`. `E=1` allows the selected flag to reach a room; `E=0` silences every room indicator. Destination `S1S0` chooses room 0–3.

Draw a circuit using a 2:1 MUX, a 1-to-4 DEMUX, and an AND gate. Write `H` and all four room-output equations. For each row below, give `H` and `(Y0,Y1,Y2,Y3)`.

| E | T | S1S0 | A | B |
| --- | --- | --- | --- | --- |
| 1 | 0 | 00 | 1 | 0 |
| 1 | 1 | 11 | 1 | 0 |
| 1 | 1 | 10 | 0 | 1 |
| 0 | 0 | 01 | 1 | 1 |
| 1 | 0 | 01 | 0 | 1 |
| 1 | 1 | 00 | 1 | 1 |

### 5. Identify a selector fault

A 4:1 MUX should pass request flags `D0`–`D3` at the matching port numbers. Exactly one of these faults is present:

- Fault A: data wires `D0` and `D3` are exchanged at the input ports.
- Fault B: the `S1` input is stuck at 0; all data wires are correct.

For both tests, predict the correct output, the Fault A output, and the Fault B output. Use the observed outputs to identify the fault and state the wiring repair.

| Test | S1S0 | D0 | D1 | D2 | D3 | Observed Y |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10 | 0 | 0 | 1 | 0 | 1 |
| 2 | 00 | 0 | 0 | 0 | 1 | 1 |
