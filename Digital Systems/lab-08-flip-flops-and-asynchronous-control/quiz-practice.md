# Digital Systems

## Lab 08 · Flip-Flops and Asynchronous Control: Practice Quiz

Show state histories and label the active clock edge on every flip-flop. Equivalent correct circuits are accepted.

Assume ideal, settled events: data is stable around active edges; asynchronous changes occur away from them. Unlisted inputs retain their values. `↑`/`↓` mean rising/falling clock edges. Equations use pre-edge Q; `Q_next` is the updated state. `X'`, `XY`, `+`, `⊕` mean NOT, AND, OR, XOR.

For active-low `(PRE_n, CLR_n)`: `01` immediately forces Q = 1; `10` forces Q = 0; `11` enables clocked operation. `00` is forbidden: mark outputs `F`. After simultaneous release from `00`, use `U` until the state is determined. During legal operation, `Q_bar` complements Q; unknown outputs are `U`.

### 1. Trace a display through control overrides

A rising-edge D flip-flop begins with Q = 0, CLK = 0, D = 0, and PRE_n = CLR_n = 1.
Use these times, in arbitrary units:

- CLK rises at 2, 6, 10, 14, 18 and falls at 4, 8, 12, 16.
- D becomes 1 at time 1, 0 at 5, 1 at 9, and 0 at 13.
- CLR_n becomes 0 at 7 and returns to 1 at 11.
- PRE_n becomes 0 at 15 and returns to 1 at 17.

Draw CLK, D, PRE_n, CLR_n, Q, and Q_bar from time 0 through just after 18. List every time Q changes and identify whether a clock edge or an asynchronous assertion caused it.

### 2. Recover from an unknown booking state

A falling-edge JK flip-flop starts in an unknown but legal state Q = U. Both asynchronous controls remain at 1.
The stable J,K pairs at successive falling edges are `00, 11, 01, 10, 11, 00`.
Give Q and Q_bar after every edge, retaining U whenever the value cannot be determined. Identify the first edge that establishes a known state and explain why the two earlier operations cannot do so. Show the two possible initial-state traces that support your answer.

### 3. Identify the active edge

Two otherwise identical T flip-flops start at Q = 0 with CLK = 0 and both asynchronous controls inactive. One triggers on rising edges; the other on falling edges.
Design a one-cycle experiment: CLK rises at time 2 and falls at 4. You may set T at time 1 and change it at time 3; it is stable around both edges.
Choose T at those two times so the final outputs distinguish the devices. Give both outputs just after each edge and draw the two Q traces. Do not use preset or clear during the experiment.

### 4. Alternate two serving counters

A stall alternates valid orders between counter 0 and counter 1. One state bit Q stores the counter to use next; initially Q = 0. `V = 1` means an order is ready at the next rising edge.
If V = 1, serve that order at the counter named by the pre-edge Q and switch Q to the other counter. If V = 0, serve nothing and keep Q. A combinational output Y is 1 when the ready order should go to counter 1; read Y just before the edge.
Build the state table and diagram, derive D and Y, and draw a circuit using one rising-edge D flip-flop and logic gates. Keep asynchronous controls inactive after initialization.
For V = `1, 1, 0, 1, 0, 1` at successive rising edges, list the assigned counter (or `none`), Y before each edge, and Q after each edge.

### 5. A force-off button waits for the clock

A rising-edge D flip-flop drives a shop sign. Initially Q = 1, CLK = 0, and PRE_n = CLR_n = 1. The normal data signal N stays at 1.
An active-high button F must turn the sign off immediately. The proposed circuit drives D = 0 while F = 1 but leaves CLR_n inactive; releasing F restores D = N.
Design a no-clock test that exposes the fault. State the observed and required Q when F is asserted. Draw a repair using the appropriate asynchronous input, showing its active polarity and the normal data connection.
For the repaired circuit, give Q after releasing F with CLK still at 0, then after the next rising edge. Explain why releasing the button and applying that edge have different effects.
