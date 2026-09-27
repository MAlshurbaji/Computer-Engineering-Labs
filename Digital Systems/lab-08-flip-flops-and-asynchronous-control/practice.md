# Digital Systems

## Lab 08 · Flip-Flops and Asynchronous Control: Practice

Build confidence following a stored bit through clock edges, overrides, and small control circuits.

Fill each `____` and draw the requested traces or circuits.

Assume ideal, settled events: data is stable around active edges; asynchronous changes occur away from them. Unlisted inputs retain their values. `↑`/`↓` mean rising/falling clock edges. Equations use pre-edge Q; `Q_next` is the updated state. `X'`, `XY`, `+`, `⊕` mean NOT, AND, OR, XOR.

For active-low `(PRE_n, CLR_n)`: `01` immediately forces Q = 1; `10` forces Q = 0; `11` enables clocked operation. `00` is forbidden: mark outputs `F`. After simultaneous release from `00`, use `U` until the state is determined. During legal operation, `Q_bar` complements Q; unknown outputs are `U`.

### Active Clock Edges

With asynchronous controls inactive, D is stored only at the active clock edge; otherwise Q holds.

#### 1. Compare two parcel-ready indicators

D = 1 means a parcel is ready. Two D flip-flops receive the same D and clock: R is rising-edge triggered; F is falling-edge triggered. Initially CLK = 0, D = 0, and both stored outputs are 0. Both asynchronous controls stay at 1.

Complete both output histories after each event.

| Event | Clock level after event | D after event | Q_R | Q_F |
|---|---|---|---|---|
| D becomes 1 | 0 | 1 | ____ | ____ |
| CLK rises | 1 | 1 | ____ | ____ |
| D becomes 0 | 1 | 0 | ____ | ____ |
| CLK falls | 0 | 0 | ____ | ____ |
| D becomes 1 | 0 | 1 | ____ | ____ |
| CLK rises | 1 | 1 | ____ | ____ |
| CLK falls | 0 | 1 | ____ | ____ |
| D becomes 0 | 0 | 0 | ____ | ____ |
| CLK rises | 1 | 0 | ____ | ____ |

The two outputs first differ after event ____. A data change without an active edge changes the stored state: ____.

### Asynchronous Priority

#### 2. Force a display on and off

A rising-edge D flip-flop drives a display indicator. Initially Q = 0, D = 0, CLK = 0, and both controls are 1. Only the signal named in each row changes.

| Event | Q after settling | Q_bar after settling |
|---|---|---|
| 1. D becomes 1 | ____ | ____ |
| 2. CLK rises | ____ | ____ |
| 3. CLR_n becomes 0 | ____ | ____ |
| 4. D becomes 0 | ____ | ____ |
| 5. CLK falls | ____ | ____ |
| 6. CLR_n becomes 1 | ____ | ____ |
| 7. PRE_n becomes 0 | ____ | ____ |
| 8. CLK rises | ____ | ____ |
| 9. PRE_n becomes 1 | ____ | ____ |
| 10. CLK falls | ____ | ____ |
| 11. CLK rises | ____ | ____ |

Releasing PRE_n in event 9 copies D immediately: ____. Draw Q and both asynchronous controls across these events.

### JK State History

At an active edge: JK = 00 holds, 10 sets, 01 clears, and 11 toggles.

#### 3. Keep a room-booking indicator

A falling-edge JK flip-flop stores a booking flag: Q = 1 means booked. It starts at Q = 1; both asynchronous controls remain at 1. Each row is the J,K pair held stable for the next falling edge.

| Falling edge | J | K | Q before | Q after |
|---|---|---|---|---|
| 1 | 0 | 0 | ____ | ____ |
| 2 | 1 | 1 | ____ | ____ |
| 3 | 0 | 0 | ____ | ____ |
| 4 | 0 | 1 | ____ | ____ |
| 5 | 0 | 0 | ____ | ____ |
| 6 | 1 | 0 | ____ | ____ |
| 7 | 1 | 1 | ____ | ____ |
| 8 | 1 | 1 | ____ | ____ |

At edge 1, holding preserves ____. At edge 7, toggling changes ____ to ____.

### T State History

At an active edge, T = 0 holds and T = 1 toggles.

#### 4. Can toggles initialize a lamp?

A falling-edge T flip-flop drives a lamp. Both asynchronous controls remain at 1. Work through the same inputs for two possible initial states.

| Falling edge | T | Q after, starting at 0 | Q after, starting at 1 |
|---|---|---|---|
| 1 | 1 | ____ | ____ |
| 2 | 0 | ____ | ____ |
| 3 | 1 | ____ | ____ |
| 4 | 1 | ____ | ____ |
| 5 | 0 | ____ | ____ |

If the initial state is unknown, the final state is ____. Can this hold/toggle sequence establish a known state by itself? ____.
In a fresh run, CLR_n is asserted alone, then released while CLK is steady before the sequence begins. Final Q after that same sequence: ____.

### Forbidden Controls and Recovery

#### 5. Release order matters

Three separate runs begin with both asynchronous controls incorrectly at 0. CLK is fixed at 0 throughout; no clock edge occurs. Do not assign outputs during that initial forbidden condition.
For ordered releases, allow the first change to settle before the second.

| Release procedure | Controls after first change (PRE_n, CLR_n) | Q after first change | Final Q |
|---|---|---|---|
| Release PRE_n, then release CLR_n | ____ | ____ | ____ |
| Release CLR_n, then release PRE_n | ____ | ____ | ____ |
| Release both together | ____ | ____ | ____ |

After simultaneous release, asserting only CLR_n makes Q = ____; releasing CLR_n later with no clock edge leaves Q = ____.

### D Flip-Flop Feedback

#### 6. Enable a toggle request

A night-light uses one rising-edge D flip-flop. `E = 1` means changes are enabled; `T = 1` requests a toggle at the next active edge. Toggle Q only when both E and T are 1; otherwise hold Q.
Initialize Q = 0 with CLR_n before use, then leave both asynchronous controls at 1.

| E | T | Q before | Q_next = D |
|---|---|---|---|
| 0 | 0 | 0 | ____ |
| 0 | 0 | 1 | ____ |
| 0 | 1 | 0 | ____ |
| 0 | 1 | 1 | ____ |
| 1 | 0 | 0 | ____ |
| 1 | 0 | 1 | ____ |
| 1 | 1 | 0 | ____ |
| 1 | 1 | 1 | ____ |

Complete the feedback circuit and draw it:

```text
request = ____
D = ____
lamp = Q
```

With E = 1 and T = 1 at three consecutive rising edges, Q after each edge is ____, ____, ____.

### JK Input Logic

#### 7. Give completion priority

A falling-edge JK flip-flop stores a printer's busy flag Q. `S = 1` requests a start; `C = 1` reports completion. At the edge: completion clears Q, otherwise a start sets Q, otherwise hold. Completion wins if both requests are 1.
Both asynchronous controls stay at 1. J and K may depend only on S and C, not on Q.

| S | C | Required action | J | K |
|---|---|---|---|---|
| 0 | 0 | ____ | ____ | ____ |
| 0 | 1 | ____ | ____ | ____ |
| 1 | 0 | ____ | ____ | ____ |
| 1 | 1 | ____ | ____ | ____ |

`J = ____`; `K = ____`. Draw the gate connections.
A proposed shortcut uses J = S and K = C. Give a starting Q and request pair where it fails: Q = ____, SC = ____. Required next state: ____; shortcut next state: ____.

### Stored State and Combinational Output

#### 8. Notice a newly active signal

X = 1 means a collection request is active. One rising-edge D flip-flop stores the previous sampled X in Q. Initially Q = 0. Both asynchronous controls remain at 1.
The combinational output `New` is 1 when X is 1 and the stored Q is 0. Each row's X is stable before the edge and remains unchanged until well after it.

`D = ____`; `New = ____`.

| Rising edge | X | Q before | New before edge | Q after edge | New after settling |
|---|---|---|---|---|---|
| 1 | 0 | ____ | ____ | ____ | ____ |
| 2 | 1 | ____ | ____ | ____ | ____ |
| 3 | 1 | ____ | ____ | ____ | ____ |
| 4 | 0 | ____ | ____ | ____ | ____ |
| 5 | 1 | ____ | ____ | ____ | ____ |

Draw the one-flip-flop circuit. Which signal may also change when X changes between clock edges: Q or New? ____.
