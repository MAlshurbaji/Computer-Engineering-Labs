# Digital Systems

## Lab 04 · Code Conversion and Parity: Practice Quiz

Show your working and label circuit inputs, outputs, and intermediate wires. Equivalent correct minimal forms are accepted.

Notation: `X'` means NOT X, `XY` means AND, `X + Y` means OR, and `X ⊕ Y` means XOR. Write bit words most significant bit first. All payload bits are independent; 1 means the named flag is active. An even-parity word has an even total number of 1s, including its parity bit; an odd-parity word has an odd total. A receiver's `Error = 1` means its parity rule is violated.

### 1. One interface, two encodings

A fan has levels 0–7, supplied as three-bit binary `B2B1B0`. In increasing level order, its reflected Gray words are `000, 001, 011, 010, 110, 111, 101, 100`.
Transmit `G2G1G0P`, where `P` makes the complete transmitted word have odd parity.
Build the eight-row input/output table, simplify all four output equations, and draw a converter using XOR/NOT gates and wires. State the transmitted words for levels 2 and 7.

### 2. A checker repeats one wire

Received even-parity words have four data bits and one parity bit, ordered `D3D2D1D0P`.
A faulty receiver computes `Error_bad = D3 ⊕ D2 ⊕ D1 ⊕ D1 ⊕ P`, accidentally omitting `D0`.
Give one valid word it rejects. Starting from a valid word, give one single-bit corruption it accepts; identify the flipped position. Show the XOR calculations and draw the smallest wiring repair.

### 3. Parity after two independent edits

A valid even-parity record is `ABCP`. Two edit controls are `R` and `S`; 1 enables the named edit. `R` flips only A. `S` flips both A and B. If both are enabled, apply both edits.
The edited data is `A_new = A ⊕ R ⊕ S`, `B_new = B ⊕ S`, `C_new = C`.
Derive the new parity directly from `P`, `R`, and `S`, then draw the update circuit. Give the four-row control table showing whether the old parity must be kept or inverted. Do not rebuild parity from all data bits.

### 4. A reverse command that cannot fit

A controller stores four-bit two's-complement movements from −8 to +7. It must reject a reverse command exactly when the mathematical negative cannot fit in that range.
Identify the rejected input word and design its reject signal from `X3X2X1X0`. For every accepted command, the output should represent its negative.
A replacement unit merely flips every bit. Give a single accepted input that distinguishes this faulty unit from a correct reverser, and state both output words.

### 5. Parity belongs to the transmitted code

A three-bit binary level `B2B1B0` is converted to reflected Gray code by `G2 = B2`, `G1 = B2 ⊕ B1`, and `G0 = B1 ⊕ B0`.
The sender mistakenly appends `P_binary = B2 ⊕ B1 ⊕ B0`. The receiver checks even parity over `G2G1G0P_binary`.
List every binary input that is falsely reported as an error. Derive a correction that updates `P_binary` using only `B2` and `B1`, and draw the extra gate connections. The Gray data wires must stay unchanged.
