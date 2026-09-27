# Digital Systems

## Lab 05 · Arithmetic Circuits and Comparators: Practice

Practice following carries, checking numeric limits, and choosing the right comparison for a small circuit.

Fill each `____` and draw the requested circuits. Equivalent correct forms are accepted.

Write binary words most significant bit first: a four-bit word is `X3X2X1X0`. Unless an activity says **signed**, values are unsigned. Four-bit two's complement ranges from −8 to +7. `X'` means NOT, juxtaposition means AND, `+` between logic signals means OR, and `⊕` means XOR. Ordinary arithmetic is named explicitly. Carry and signed overflow are different flags.

An `Adder4(A,B,C0)` produces the low four sum bits `S3S2S1S0` and carry `C4` of the arithmetic total `A + B + C0`. A four-bit comparator's outputs `G`, `E`, `L` mean respectively A > B, A = B, A < B. For cascading: unequal local words determine the outputs and ignore cascade inputs; equal local words pass through `I_G`, `I_E`, `I_L`. These are logical block ports, not chip pin numbers.

### Half and Full Adders

#### 1. Record two cup returns

Two people can each return one cup: `a = 1` and `b = 1` mean their respective cups were returned. Encode the total as the two-bit word `CS`, where C is the two-cup bit and S the one-cup bit.

| a | b | Total cups | C | S |
|---|---|---|---|---|
| 0 | 0 | ____ | ____ | ____ |
| 0 | 1 | ____ | ____ | ____ |
| 1 | 0 | ____ | ____ | ____ |
| 1 | 1 | ____ | ____ | ____ |

`S = ____`; `C = ____`. Draw the two-gate half adder.

#### 2. Join two half adders

One binary addition column receives `a`, `b`, and incoming carry `c`; each is 0 or 1. A half adder returns a sum bit and a carry bit.

```text
HA1 inputs: a, b       outputs: temporary, carry1
HA2 inputs: ____, c    outputs: S, carry2
Cout = ____
```

| abc | S | Cout |
|---|---|---|
| 000 | ____ | ____ |
| 001 | ____ | ____ |
| 010 | ____ | ____ |
| 011 | ____ | ____ |
| 100 | ____ | ____ |
| 101 | ____ | ____ |
| 110 | ____ | ____ |
| 111 | ____ | ____ |

Draw the full adder from these two half adders and the required combining gate.

### Carry Chains

#### 3. Find a missing connection

Two `Adder4` blocks add eight-bit unsigned counts. The low block adds bits 3–0 with input carry 0. The high block adds bits 7–4, but its input carry has accidentally been tied to 0.

| A | B | Low carry | Correct 8-bit result | Faulty 8-bit result | Correct final carry |
|---|---|---|---|---|---|
| 00001111 | 00000001 | ____ | ____ | ____ | ____ |
| 00010010 | 00000011 | ____ | ____ | ____ | ____ |
| 11111111 | 00000001 | ____ | ____ | ____ | ____ |

Reconnect the high block's input carry to ____. The full result needs ____ bits when the correct final carry is included.

### Signed Overflow

#### 4. Accept only a representable adjustment

A controller adds two **signed** four-bit adjustments and stores the result only when it fits in −8…+7. `A3`, `B3`, and `S3` are the operand and stored-result sign bits.

| A | B | Mathematical sum | Fits? | Store enable |
|---|---|---|---|---|
| 4 | 4 | ____ | ____ | ____ |
| -7 | -2 | ____ | ____ | ____ |
| -1 | -1 | ____ | ____ | ____ |
| 7 | -7 | ____ | ____ | ____ |

`Overflow = ____`; `Store = ____`.
For A = −1 and B = −1, carry `C4 = ____` and signed overflow = ____. Explain in one sentence why a carry-only test would make the wrong storage decision: ____.

### Subtraction Control

#### 5. Locate a one-step error

An unsigned four-bit subtraction block should return the low four bits of the arithmetic difference A − B. It inverts each B bit before addition, but its carry input is incorrectly fixed at 0.

| A | B | Required 4-bit result | Faulty 4-bit result |
|---|---|---|---|
| 11 | 4 | ____ | ____ |
| 2 | 9 | ____ | ____ |
| 7 | 7 | ____ | ____ |

The faulty arithmetic result is one ____ than the required result, modulo 16. Correct carry input: ____. Draw the corrected connection; the B inverters stay in place.

### Magnitude Comparators

#### 6. Keep a setting inside a window

A small fan accepts unsigned speed codes N from 3 through 10, inclusive.
Comparator Low compares N with 3; comparator High compares N with 10. Their outputs are `Low_G, Low_E, Low_L` and `High_G, High_E, High_L`.

| N | Accept |
|---|---|
| 2 | ____ |
| 3 | ____ |
| 7 | ____ |
| 10 | ____ |
| 11 | ____ |

Using the comparator outputs, `Accept = ____`. Draw the two comparator blocks and the gates that combine their outputs. Both endpoints must be accepted.

### Cascaded Comparators

#### 7. Compare complete eight-bit counts

Low compares the low four bits of each count; High compares the high four bits. Use the cascade behavior defined above.

Lowest-stage inputs: `I_G = ____`, `I_E = ____`, `I_L = ____`.
Connect Low's three outputs to ____; take the final answer from ____.

| A | B | Low G/E/L | High local relation | Final G/E/L |
|---|---|---|---|---|
| 0010 0111 | 0010 1010 | ____ | ____ | ____ |
| 0011 0001 | 0010 1111 | ____ | ____ | ____ |
| 0100 1011 | 0100 1011 | ____ | ____ | ____ |
| 0011 1010 | 0100 0000 | ____ | ____ | ____ |

Draw the three cascade wires and label the significance of each block.

### BCD Addition

#### 8. Keep a decimal display valid

Each decimal digit 0–9 is encoded separately in four bits (BCD). Add two digits and an incoming decimal carry 0 or 1. First compute the five-bit binary total `C4 S3S2S1S0`.
If the total is at least 10, correction flag K is 1 and a second adder adds `0110` to the low four bits; otherwise it adds `0000`. The corrected low four bits are the ones digit. The tens digit is 0 or 1.

| Digits + carry | Raw C4 S | K | Corrected ones word | Tens digit |
|---|---|---|---|---|
| 5 + 2 + 0 | ____ | ____ | ____ | ____ |
| 4 + 7 + 0 | ____ | ____ | ____ | ____ |
| 9 + 8 + 0 | ____ | ____ | ____ | ____ |
| 9 + 9 + 1 | ____ | ____ | ____ | ____ |

Complete `K = C4 + ____`. As a four-bit word, the second adder's correction input is ____. The tens digit must come from ____.
Draw the two-adder block diagram, including the correction logic.
