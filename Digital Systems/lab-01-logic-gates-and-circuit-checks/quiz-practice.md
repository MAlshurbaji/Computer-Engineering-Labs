# Digital Systems

## Lab 01 · Logic Gates and Circuit Checks: Practice Quiz

Answer with Boolean expressions, tables, and labelled circuit sketches as requested.

Use `1` for true/on and `0` for false/off. `+` means OR, `·` means AND, and a prime (`'`) negates the preceding signal or parenthesized expression. Use two-input AND/OR gates and one-input NOT gates. Signals may branch to several gates; an inverted signal may be shared within one circuit. Assume ideal gates and read outputs after inputs have settled.

### 1. A cupboard reminder

`D=1` means the cupboard door is open, `T=1` means a reminder timer is active, and `S=1` means reminders are silenced. A reminder lights only when the door is open or the timer is active, and reminders are not silenced.

Write its expression, construct the complete eight-row truth table in `D,T,S` order, and draw the circuit. Label every intermediate signal.

### 2. Trace a reading-lamp circuit

`P=1` means power is present, `D=1` means daylight is present, and `M=1` means manual light is requested. The circuit is wired as follows: NOT takes `D` and produces `N`; OR takes `N,M` and produces `R`; AND takes `P,R` and produces `L`.

Write `L` directly in terms of the three inputs. For the intervals below, give the `N`, `R`, and `L` rows and draw the waveform for `L`.

| Signal / interval | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 1 |
| D | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 1 |
| M | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 0 |

### 3. Find a distinguishing test

A pantry indicator has `A=1` when a bag is available and `B=1` when a box is available. Design X lights when at least one container is available but both are not available. Design Y lights whenever at least one is available.

Write an expression and draw a circuit for each design using only AND, OR, and NOT. Construct one complete truth table containing both outputs. Give every input pair for which the outputs differ.

### 4. Read a wiring and voltage record

For a 14-pin 7408, gate 2 uses inputs 4 and 5 and output 6; supply is pin 14 and ground is pin 7. Supply and ground are correctly connected to +5 V and 0 V. Use these logic-input limits: 0–0.8 V is low, 2.0–5.0 V is high, and the interval between them is undefined.

An input switch reaches pin 4 at 2.4 V. Another reaches pin 5 at 0.5 V. State both input bits and the expected output bit. An output probe reports logic 1; does that agree with the intended AND operation?

The second switch's wire is in hole A9. On this board, A9–E9 are joined, F9–J9 form a separate group, and different rows are separate. Which of `D9`, `G9`, and `A10` can reach that switch signal without a jumper? State which IC pin the output probe must check.
