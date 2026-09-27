# Digital Systems

## Lab 05 · Arithmetic Circuits and Comparators: Practice Quiz

Show your working and label circuit inputs, outputs, and intermediate wires. Equivalent correct minimal forms are accepted.

Write binary words most significant bit first: a four-bit word is `X3X2X1X0`. Unless an activity says **signed**, values are unsigned. Four-bit two's complement ranges from −8 to +7. `X'` means NOT, juxtaposition means AND, `+` between logic signals means OR, and `⊕` means XOR. Ordinary arithmetic is named explicitly. Carry and signed overflow are different flags.

An `Adder4(A,B,C0)` produces the low four sum bits `S3S2S1S0` and carry `C4` of the arithmetic total `A + B + C0`. A four-bit comparator's outputs `G`, `E`, `L` mean respectively A > B, A = B, A < B. For cascading: unequal local words determine the outputs and ignore cascade inputs; equal local words pass through `I_G`, `I_E`, `I_L`. These are logical block ports, not chip pin numbers.

### 1. A display that stops at fifteen

Two unsigned four-bit inputs A and B are cup counts, each 0–15. A display must show their total when it is at most 15 and show 15 for any larger total.
Use one `Adder4` and two-input logic gates. Derive each displayed bit from the adder's S bits and `C4`, and draw the circuit.
Give the displayed words for (A,B) = (0,0), (6,9), (6,10), and (15,15).

### 2. Reject an unrepresentable difference

A thermostat stores **signed** four-bit adjustments. A working subtraction block already produces the low four bits S of A − B.
Design a `Reject` flag from `A3`, `B3`, and `S3` that is 1 exactly when the mathematical difference is outside −8…+7. Draw the flag circuit.
For (A,B) = (+6,−3), (−6,+3), (−2,+3), and (−8,−8), show the mathematical difference, stored word, and reject decision. Do not use carry as the reject flag.

### 3. A comparator chain runs backwards

Two four-bit comparators compare eight-bit unsigned counts. A faulty design sends High's outputs into Low's cascade inputs and treats Low's outputs as the final comparison; High's cascade inputs are the neutral constants 0,1,0 for G,E,L.
Give one pair of eight-bit counts for which that design reports the wrong relation. Show the local high- and low-part relations and the faulty final result.
Redraw the chain so the more significant bits have priority. State all lowest-stage cascade constants and identify the final output stage.

### 4. The decimal carry disappears

Two BCD digits (each 0–9) are first added as binary. A flag K is 1 when their full binary total is at least 10. A second adder adds `0110` to the raw low four bits when K = 1, otherwise `0000`.
The ones digit comes from that second adder. A proposed display uses only the second adder's carry output as its tens digit.
Trace 6 + 6 and 8 + 9 through both stages. Identify the wrong decimal display, replace the tens connection with the correct existing signal, and explain why the repair also handles totals 16–18.

### 5. Counts that differ by at most one

Two trays have unsigned four-bit item counts A and B. `Match` should be 1 exactly when their counts differ by at most one.
One `Adder4` computes X = the low four bits of A + 1 with carry `CA`; another computes Y = the low four bits of B + 1 with carry `CB`.
Three comparator equality outputs are `E0 = (A = B)`, `E1 = (X = B)`, and `E2 = (Y = A)`. A proposed circuit uses `Match_bad = E0 + E1 + E2`.
Find the unordered pair of counts that it wrongly accepts. Derive a repaired expression using the same outputs and carry flags, then draw its gate circuit. Verify pairs (0,15), (7,8), (5,5), (14,15), and (3,5).
