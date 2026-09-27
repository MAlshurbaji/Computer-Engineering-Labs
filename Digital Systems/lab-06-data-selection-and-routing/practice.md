# Digital Systems

## Lab 06 · Data Selection and Routing: Practice

Follow one signal at a time. Fill the blanks and draw the requested connections; a labelled block sketch is enough when a task names a multiplexer or decoder.

Use `1` for the stated condition and `0` for its opposite. `+` means OR, `·` means AND, and a prime (`'`) means NOT. All circuits act on the current inputs; read outputs after they settle. In selector word `S1S0`, `S1` is the most significant bit: `00`, `01`, `10`, `11` select ports 0, 1, 2, 3 respectively. Output lists are always in labelled order `Y0,Y1,Y2,Y3`.

### Two-input Multiplexers

A 2:1 multiplexer (MUX) passes `I0` when its selector `S=0` and `I1` when `S=1`.

#### 1. Choose a light request

`W=1` means a wall switch requests light; `A=1` means an app requests light. Connect `W` to `I0` and `A` to `I1`. The output `Y=1` means the selected source requests light.

| S | W | A | Selected input port | Y |
| --- | --- | --- | --- | --- |
| 0 | 0 | 0 | ____ | ____ |
| 0 | 0 | 1 | ____ | ____ |
| 0 | 1 | 0 | ____ | ____ |
| 0 | 1 | 1 | ____ | ____ |
| 1 | 0 | 0 | ____ | ____ |
| 1 | 0 | 1 | ____ | ____ |
| 1 | 1 | 0 | ____ | ____ |
| 1 | 1 | 1 | ____ | ____ |

Draw the MUX with its three inputs labelled. When `S=0`, changing only `A` can change `Y`: ____ (yes/no).

#### 2. Reverse the meaning of the control

Use the same requests `W,A`, but now `M=1` must choose the wall switch and `M=0` the app. Complete two alternative wirings that meet this rule.

| Wiring | MUX selector | I0 connects to | I1 connects to |
| --- | --- | --- | --- |
| Direct control | M | ____ | ____ |
| Inverted control | M' | ____ | ____ |

For `W=0,A=1`, fill both outputs.

| M | Direct-control output | Inverted-control output |
| --- | --- | --- |
| 0 | ____ | ____ |
| 1 | ____ | ____ |

Draw the inverted-control version, including its NOT gate.

### Four-input Multiplexers

A 4:1 MUX passes the input port selected by `S1S0`.

#### 3. Choose one room's request

Four rooms have help-request flags `D0,D1,D2,D3`; 1 means help is requested. Connect each flag to its matching input port. For this snapshot, `D0=1,D1=0,D2=0,D3=1`.

| S1S0 | Selected flag | Y |
| --- | --- | --- |
| 00 | ____ | ____ |
| 01 | ____ | ____ |
| 10 | ____ | ____ |
| 11 | ____ | ____ |

Fill each coefficient with a two-literal selector product, keeping `S1` before `S0`:

`Y=(____)·D0+(____)·D1+(____)·D2+(____)·D3`.

#### 4. Build the selector from smaller blocks

Use three 2:1 MUXes to implement the same four-input selection. Block L handles ports 0–1; block H handles ports 2–3. Their outputs feed a final block F. Complete all ports.

| Block | I0 | I1 | Selector | Output name |
| --- | --- | --- | --- | --- |
| L | ____ | ____ | ____ | Low |
| H | ____ | ____ | ____ | High |
| F | ____ | ____ | ____ | Y |

Draw the three blocks. With `D0=0,D1=1,D2=1,D3=0` and `S1S0=10`, `Low=____`, `High=____`, and `Y=____`.

### Enabled Decoders

An enabled 2-to-4 decoder sets exactly one output to 1 at the selected port when `E=1`; all its outputs are 0 when `E=0`.

#### 5. Point to one storage drawer

`E=1` means the drawer guide is enabled. The selected output `Z0`–`Z3` lights that drawer's indicator. Fill the complete routing table.

| E | S1S0 | Z0 | Z1 | Z2 | Z3 |
| --- | --- | --- | --- | --- | --- |
| 0 | 00 | ____ | ____ | ____ | ____ |
| 0 | 01 | ____ | ____ | ____ | ____ |
| 0 | 10 | ____ | ____ | ____ | ____ |
| 0 | 11 | ____ | ____ | ____ | ____ |
| 1 | 00 | ____ | ____ | ____ | ____ |
| 1 | 01 | ____ | ____ | ____ | ____ |
| 1 | 10 | ____ | ____ | ____ | ____ |
| 1 | 11 | ____ | ____ | ____ | ____ |

`Z2=E·____·____`. Draw this one output using AND/NOT gates; use two-input AND gates if a third input is needed.

#### 6. Use decoded lines to select data

Four kitchen timers supply done flags `R0`–`R3`; 1 means finished. Use the decoder from activity 5 to choose one timer. `E=0` must force the final indicator `Y` off.

Feed each decoded line and its matching timer flag into an AND gate, then combine the four results with OR gates. Fill the data connections:

`Y=Z0·____+Z1·____+Z2·____+Z3·____`.

For `R0=0,R1=1,R2=1,R3=0`, complete `Y` and draw the decoder-and-gates circuit.

| E | S1S0 | Y |
| --- | --- | --- |
| 1 | 00 | ____ |
| 1 | 01 | ____ |
| 1 | 10 | ____ |
| 1 | 11 | ____ |
| 0 | 01 | ____ |
| 0 | 10 | ____ |

### Demultiplexers and Routing Faults

A 1-to-4 demultiplexer (DEMUX) sends one data input to the selected output; every other output is 0.

#### 7. Send a test signal to one room

`T=1` means a test button is held and `M=1` means testing is enabled. Send `M·T` through a DEMUX. `S1S0` chooses the room; `Yi=1` lights room i's test indicator.

Fill each blank with one selector literal, in `S1,S0` order:

`Y0=M·T·____·____`; `Y1=M·T·____·____`.

`Y2=M·T·____·____`; `Y3=M·T·____·____`.

| M | T | S1S0 | Y0 | Y1 | Y2 | Y3 |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 1 | 00 | ____ | ____ | ____ | ____ |
| 1 | 1 | 10 | ____ | ____ | ____ | ____ |
| 1 | 1 | 11 | ____ | ____ | ____ | ____ |
| 1 | 0 | 01 | ____ | ____ | ____ | ____ |
| 0 | 1 | 01 | ____ | ____ | ____ | ____ |
| 0 | 0 | 00 | ____ | ____ | ____ | ____ |

Draw the AND gate feeding the DEMUX. Setting either `M` or `T` to 0 forces all outputs to ____.

#### 8. Repair crossed output wires

In the previous circuit, exactly two output wires were exchanged after the DEMUX; all other connections are correct. With `M=T=1`, these are the observed room indicators.

| S1S0 | Observed Y0 | Observed Y1 | Observed Y2 | Observed Y3 |
| --- | --- | --- | --- | --- |
| 00 | 1 | 0 | 0 | 0 |
| 01 | 0 | 0 | 1 | 0 |
| 10 | 0 | 1 | 0 | 0 |
| 11 | 0 | 0 | 0 | 1 |

Exchange the wires going to rooms ____ and ____ (write the lower number first). After repair, `S1S0=01` produces `(Y0,Y1,Y2,Y3)=____`.

Would repeating the tests with `T=0` reveal this crossed-wire fault? ____ (yes/no). The output list would be ____ for every selector setting.
