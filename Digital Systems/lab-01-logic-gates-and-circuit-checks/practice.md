# Digital Systems

## Lab 01 · Logic Gates and Circuit Checks: Practice

Take one small circuit at a time. Complete the blanks and draw requested circuits on paper or in a logic simulator.

Use `1` for true/on and `0` for false/off. `+` means OR, `·` means AND, and a prime (`'`) negates the preceding signal or parenthesized expression. Use two-input AND/OR gates and one-input NOT gates. Signals may branch to several gates; an inverted signal may be shared within one circuit. Assume ideal gates and read outputs after inputs have settled.

### Logic Levels and Connections

#### 1. Read a switch signal

A desk-lamp controller uses a 5 V supply. For these input readings, 0–0.8 V is logic 0, 2.0–5.0 V is logic 1, and values strictly between 0.8 and 2.0 V are undefined. Fill with `0`, `1`, or `undefined`.

| Input voltage (V) | Logic reading |
| --- | --- |
| 0.0 | ____ |
| 0.8 | ____ |
| 1.4 | ____ |
| 2.0 | ____ |
| 4.6 | ____ |

An SPDT switch connects its common terminal to one of two contacts. To select defined input levels, connect those contacts to ____ and ____; the common terminal goes to the gate input.

#### 2. Plan connections before wiring

On this breadboard, holes A–E in the same numbered row are joined; F–J in that row form a separate group. Different rows are separate. No jumpers have been added. Fill `yes` or `no`.

| Hole pair | Already connected? |
| --- | --- |
| A12 and E12 | ____ |
| A12 and A13 | ____ |
| D12 and F12 | ____ |
| H12 and J12 | ____ |

Use this supplied 14-pin 7408 map: gate 2 has inputs at pins 4 and 5, output at pin 6; supply is pin 14 and ground is pin 7. A switch `P` goes to pin 4. Fill the plan for a second switch `Q` and a logic probe.

`Q → pin ____`; `output probe → pin ____`; `+5 V → pin ____`; `0 V → pin ____`.

### AND, OR, and NOT

#### 3. Check two cutlery drawers

`A=1` means drawer A contains cutlery; `B=1` means drawer B contains cutlery. `Both` means both are stocked, `Any` means at least one is stocked, and `RefillA` means drawer A is empty.

`Both = ____`; `Any = ____`; `RefillA = ____`.

| A | B | Both | Any | RefillA |
| --- | --- | --- | --- | --- |
| 0 | 0 | ____ | ____ | ____ |
| 0 | 1 | ____ | ____ | ____ |
| 1 | 0 | ____ | ____ | ____ |
| 1 | 1 | ____ | ____ | ____ |

#### 4. Light an open cupboard

`R=1` means the lamp is requested; `C=1` means the cupboard is closed. The lamp `L` is on only when requested and the cupboard is open.

`Open = ____`; `L = R·____`.

Draw one ____ gate for `Open` followed by one ____ gate for `L`.

| R | C | Open | L |
| --- | --- | --- | --- |
| 0 | 0 | ____ | ____ |
| 0 | 1 | ____ | ____ |
| 1 | 0 | ____ | ____ |
| 1 | 1 | ____ | ____ |

### Combining Gates

#### 5. Connect a desk fan

`P=1` means power is available, `M=1` means a manual request, and `W=1` means the room is warm. The fan runs when power is available and at least one request (`M` or `W`) is present.

Gate 1 combines `M` and `W` with ____, producing `Request`. Gate 2 combines `P` and `Request` with ____, producing `Fan`. Draw the connections.

`Fan = ____`.

| P | M | W | Request | Fan |
| --- | --- | --- | --- | --- |
| 0 | 0 | 0 | ____ | ____ |
| 0 | 0 | 1 | ____ | ____ |
| 0 | 1 | 0 | ____ | ____ |
| 0 | 1 | 1 | ____ | ____ |
| 1 | 0 | 0 | ____ | ____ |
| 1 | 0 | 1 | ____ | ____ |
| 1 | 1 | 0 | ____ | ____ |
| 1 | 1 | 1 | ____ | ____ |

#### 6. Route a doorbell request

`F=1` means the front button is pressed, `B=1` means the back button is pressed, and `Q=1` means quiet mode is selected. Either button creates a request `R`. A request activates the sound in normal mode or a silent indicator in quiet mode.

`R = ____`; `Sound = R·____`; `Silent = R·____`.

Draw both outputs, sharing `R`. Fill the table.

| F | B | Q | Sound | Silent |
| --- | --- | --- | --- | --- |
| 0 | 0 | 0 | ____ | ____ |
| 0 | 0 | 1 | ____ | ____ |
| 0 | 1 | 0 | ____ | ____ |
| 0 | 1 | 1 | ____ | ____ |
| 1 | 0 | 0 | ____ | ____ |
| 1 | 0 | 1 | ____ | ____ |
| 1 | 1 | 0 | ____ | ____ |
| 1 | 1 | 1 | ____ | ____ |

### Timing and Verification

#### 7. Follow a cupboard lamp over time

Use `L=R·C'`, where `R=1` requests light and `C=1` means closed. Each column is one settled time interval. Fill `L`, then draw its high/low waveform across the six intervals.

| Signal / interval | 1 | 2 | 3 | 4 | 5 | 6 |
| --- | --- | --- | --- | --- | --- | --- |
| R | 0 | 1 | 1 | 0 | 1 | 1 |
| C | 1 | 1 | 0 | 0 | 0 | 1 |
| L | ____ | ____ | ____ | ____ | ____ | ____ |

#### 8. Check where the inverter belongs

`A=1` means a refill was requested; `B=1` means the bottle is full. Compare the indicator circuits `X=A+B'` and `Y=(A+B)'`.

| A | B | X | Y |
| --- | --- | --- | --- |
| 0 | 0 | ____ | ____ |
| 0 | 1 | ____ | ____ |
| 1 | 0 | ____ | ____ |
| 1 | 1 | ____ | ____ |

Give any one distinguishing input pair: `(A,B) = ____`. At that pair, `X=____` and `Y=____`.

Draw both circuits. If using a simulator, give each input a 0/1 switch and each output a logic probe; check all four rows against your predictions.
