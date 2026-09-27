# Digital Systems

## Lab 07 · Latches and Clocked Storage: Practice

Follow one event at a time. Complete the blanks and draw the requested circuits or waveforms.

Use settled logic levels `0` and `1`. `Qb` names the partner output; it need not complement `Q` during forbidden SR inputs. Active-high commands assert at `1`; names ending `_n` assert at `0`. Set requests `Q=1`; reset requests `Q=0`.

Each event settles before the next. Unlisted inputs retain their levels. Space event markers equally in waveform sketches. Data never changes at the same instant as a clock edge or enable transition. D devices have no active asynchronous controls. Write `U` when a stored bit cannot be predicted after simultaneous release of forbidden SR inputs; retain `U` until a valid command establishes a known state.

### Active-High SR Storage

#### 1. Remember a parcel message

A cross-coupled NOR latch drives a parcel indicator. `S=1` posts the message; `R=1` acknowledges it. Initially `S=R=0`, `Q=0`, and `Qb=1`. Only the listed switch changes at each event.

| Event | Change | S after | R after | Q after | Qb after |
| --- | --- | --- | --- | --- | --- |
| 1 | Post button pressed | 1 | 0 | ____ | ____ |
| 2 | Post button released | 0 | 0 | ____ | ____ |
| 3 | Post button pressed again | 1 | 0 | ____ | ____ |
| 4 | Post button released | 0 | 0 | ____ | ____ |
| 5 | Acknowledge pressed | 0 | 1 | ____ | ____ |
| 6 | Acknowledge released | 0 | 0 | ____ | ____ |

Draw the two NOR gates and their feedback connections. Label `S`, `R`, `Q`, and `Qb`. The indicator after both buttons are released depends on ____.

### Active-Low SR Storage

#### 2. Read buttons that assert low

A cross-coupled NAND latch stores a laundry reminder. `S_n=0` posts it; `R_n=0` clears it. Initially `S_n=R_n=1`, `Q=1`, and `Qb=0`.

| Event | S_n after | R_n after | Q after | Qb after |
| --- | --- | --- | --- | --- |
| 1 | 1 | 0 | ____ | ____ |
| 2 | 1 | 1 | ____ | ____ |
| 3 | 0 | 1 | ____ | ____ |
| 4 | 1 | 1 | ____ | ____ |
| 5 | 1 | 0 | ____ | ____ |
| 6 | 1 | 1 | ____ | ____ |

Draw the two NAND gates and label the feedback paths. At events 2 and 4 the input pair is identical, but the stored `Q` values are ____ and ____.

#### 3. Adapt replacement buttons

New reminder buttons produce `A=1` for post and `B=1` for clear; both are normally `0` and are never pressed together. The replacement latch requires active-low `S_n` and `R_n`. Initially `A=B=0` and both boards below have `Q=0`, `Qb=1`.

`S_n=____`; `R_n=____`. Use a prime for NOT.

Draw the button adapters and a cross-coupled NAND latch. With neither button pressed, its input pair `(S_n,R_n)` is ____. A NOR latch driven directly by `(S,R)=(A,B)` starts with the same `Q`; do the two designs keep matching `Q` values after every permitted button event? ____.

### Forbidden Inputs and Recovery

#### 4. Separate a forced output from stored memory

Each table is an independent fault test. In events 1 and 2, both inputs change together. Fill both output levels; use `U` where appropriate.

The NOR latch begins at `S=R=0`, `Q=1`, `Qb=0`.

| Event | S | R | Q after | Qb after |
| --- | --- | --- | --- | --- |
| 1: both commands forced active | 1 | 1 | ____ | ____ |
| 2: both released together | 0 | 0 | ____ | ____ |
| 3: clear alone | 0 | 1 | ____ | ____ |
| 4: clear released | 0 | 0 | ____ | ____ |

The NAND latch begins at `S_n=R_n=1`, `Q=0`, `Qb=1`.

| Event | S_n | R_n | Q after | Qb after |
| --- | --- | --- | --- | --- |
| 1: both commands forced active | 0 | 0 | ____ | ____ |
| 2: both released together | 1 | 1 | ____ | ____ |
| 3: post alone | 0 | 1 | ____ | ____ |
| 4: post released | 1 | 1 | ____ | ____ |

In each table, the first event that restores a valid, known stored bit after simultaneous release is event ____.

### Enabled D Latches

#### 5. Edit a room-availability sign

`D=1` requests the word “Available.” A D latch follows `D` while `E=1` and retains its value while `E=0`. Initially `D=1`, `E=0`, and `Q=0`.

| Event | D after | E after | Q after |
| --- | --- | --- | --- |
| 1 | 1 | 1 | ____ |
| 2 | 0 | 1 | ____ |
| 3 | 0 | 0 | ____ |
| 4 | 1 | 0 | ____ |
| 5 | 1 | 1 | ____ |
| 6 | 1 | 0 | ____ |
| 7 | 0 | 0 | ____ |

Draw `D`, `E`, and `Q` across these settled intervals, including the initial state. List every event where `D` changes but `Q` does not: ____.

#### 6. Build the write interface

A kitchen sign must store `D` when write permission `E=1` and keep its previous value when `E=0`. Use an active-high NOR SR latch, one NOT gate, and two two-input AND gates. Initially `E=0`, `D=0`, `Q=0`, and `Qb=1`.

Fill the input equations: `S=____`; `R=____`.

Draw the complete circuit. For all settled combinations of `D,E`, `S·R=____`. Explain in one sentence why no settled input combination asserts both commands: ____.

### Rising-Edge D Flip-Flops

#### 7. Sample a pickup request

A rising-edge D flip-flop samples `D` only when `C` changes from `0` to `1`. `D=1` means a pickup is requested. Initially `D=1`, `C=0`, `Q=0`, and `Qb=1`.

| Event | D after | C after | Capture at this event? | Q after | Qb after |
| --- | --- | --- | --- | --- | --- |
| 1 | 0 | 0 | ____ | ____ | ____ |
| 2 | 0 | 1 | ____ | ____ | ____ |
| 3 | 1 | 1 | ____ | ____ | ____ |
| 4 | 1 | 0 | ____ | ____ | ____ |
| 5 | 1 | 1 | ____ | ____ | ____ |
| 6 | 0 | 1 | ____ | ____ | ____ |
| 7 | 0 | 0 | ____ | ____ | ____ |
| 8 | 0 | 1 | ____ | ____ | ____ |

Draw `Q`. Number of captures: ____. Number of changes in `Q`: ____.

### Level-Sensitive and Edge-Triggered Storage

#### 8. Test two replacement boards

Both boards receive the same `D` and control `C`. Board L is a D latch enabled by `C=1`; board F is a rising-edge D flip-flop. Initially `D=C=0` and both outputs are `0`.

| Event | D after | C after | Q_L after | Q_F after |
| --- | --- | --- | --- | --- |
| 1 | 0 | 1 | ____ | ____ |
| 2 | 1 | 1 | ____ | ____ |
| 3 | 0 | 1 | ____ | ____ |
| 4 | 0 | 0 | ____ | ____ |
| 5 | 1 | 0 | ____ | ____ |
| 6 | 1 | 1 | ____ | ____ |
| 7 | 1 | 0 | ____ | ____ |
| 8 | 0 | 0 | ____ | ____ |

The outputs differ after event(s) ____. The short high pulse on `D` between events 2 and 3 changes board ____ temporarily but is not stored by board ____.
