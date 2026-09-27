# Digital Systems

## Lab 07 · Latches and Clocked Storage: Practice Quiz

Use labelled circuits, event tables, and waveforms as requested. Show settled logic levels `0` and `1`; use `U` for a stored state that cannot be predicted.

`Qb` names the partner output, not a guaranteed complement during forbidden SR inputs. Set requests `Q=1`; reset requests `Q=0`. Active-high commands assert at `1`, and names ending `_n` assert at `0`. Each event settles before the next. Space event markers equally in waveform sketches. Unlisted inputs stay unchanged; data never changes at the same instant as an enable transition or clock edge. D devices have no active asynchronous controls. Simultaneous release of forbidden SR inputs leaves the stored state unpredictable until a valid command establishes it.

### 1. Release two stuck reminder buttons

Test a cross-coupled NOR latch with active-high `S,R` and a cross-coupled NAND latch with active-low `S_n,R_n`. For each latch, every trial starts fresh with both commands asserted long enough for the outputs to settle.

Compare these three release procedures:

- Release set first, allow settling, then release reset.
- Release reset first, allow settling, then release set.
- Release both together.

For each latch and procedure, state `(Q,Qb)` while both commands are asserted, after the first release where there is one, and after both are released. State which final results are predictable and explain why waiting between individual releases matters.

### 2. Give the clear button priority

A parcel indicator uses active-high buttons: `A=1` posts a message and `B=1` clears it. If both are pressed, clear must win. If neither is pressed, the indicator must remember its previous state.

Design an interface to a cross-coupled NAND latch with active-low `S_n,R_n`. Use AND, OR, and NOT gates before the latch. Write expressions for `S_n` and `R_n`, draw the full circuit, and make a four-row table of `A,B,S_n,R_n` and the resulting action (`set`, `reset`, or `hold`). Show that the forbidden command pair is absent for all settled input combinations. Initially `A=B=0`, `Q=1`, and `Qb=0`.

### 3. Audit an availability-sign log

A D latch displays the bit on `D` while edit permission `E=1`; it holds its state while `E=0`. Initially `D=0`, `E=1`, and `Q=0`. The technician's recorded outputs below are observations, not inputs to the latch.

| Event | D after | E after | Recorded Q |
| --- | --- | --- | --- |
| A | 1 | 1 | 1 |
| B | 1 | 0 | 1 |
| C | 0 | 0 | 0 |
| D | 1 | 0 | 1 |
| E | 1 | 1 | 1 |
| F | 0 | 1 | 0 |
| G | 0 | 0 | 0 |

Rebuild the actual `Q` row from the initial state, identify the earliest incorrect record, and correct every incorrect entry. Explain the error using the enable level. Draw the actual `D`, `E`, and `Q` waveforms.

### 4. Choose a replacement save board

Two unlabelled boards share data `D` and control `C`. One is a D latch enabled at `C=1`; the other is a rising-edge D flip-flop. Initially `D=C=0` and both outputs are `0`. Their measured log is:

| Event | D after | C after | Board A output | Board B output |
| --- | --- | --- | --- | --- |
| 1 | 1 | 0 | 0 | 0 |
| 2 | 1 | 1 | 1 | 1 |
| 3 | 0 | 1 | 0 | 1 |
| 4 | 0 | 0 | 0 | 1 |
| 5 | 1 | 0 | 0 | 1 |

Identify each board and give the first event that distinguishes their behavior. A save button raises `C` when pressed and keeps it high while held. The replacement must capture `D` once on the press and ignore later changes while held. Choose the suitable board and justify it.

Continue from event 5 using that board. The next changes, in order, are `C→1`, `D→0`, `C→0`, `C→1`, `D→1`, `C→0`, `C→1`. Give `Q` after each event and draw its waveform, starting with the stored state after event 5.
