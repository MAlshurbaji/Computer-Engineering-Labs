# Digital Systems

## Lab 04 · Code Conversion and Parity: Practice

Practice checking that a small message keeps its meaning as its code or check bit changes.

Fill each `____` and draw the requested circuits. Equivalent correct forms are accepted.

Notation: `X'` means NOT X, `XY` means AND, `X + Y` means OR, and `X ⊕ Y` means XOR. Write bit words most significant bit first. All payload bits are independent; 1 means the named flag is active. An even-parity word has an even total number of 1s, including its parity bit; an odd-parity word has an odd total. A receiver's `Error = 1` means its parity rule is violated.

### Binary and Gray Code

#### 1. Follow a volume dial

A volume dial has levels 0–7. Its three-bit reflected Gray codes are listed below. Fill the ordinary binary codes and count changed bits from the previous level; use `—` for level 0.

| Level | Binary B2B1B0 | Gray G2G1G0 | Binary changes | Gray changes |
|---|---|---|---|---|
| 0 | ____ | 000 | — | — |
| 1 | ____ | 001 | ____ | ____ |
| 2 | ____ | 011 | ____ | ____ |
| 3 | ____ | 010 | ____ | ____ |
| 4 | ____ | 110 | ____ | ____ |
| 5 | ____ | 111 | ____ | ____ |
| 6 | ____ | 101 | ____ | ____ |
| 7 | ____ | 100 | ____ | ____ |

For the wrap from level 7 back to 0, binary changes: ____; Gray changes: ____.

#### 2. Send a binary setting to the dial

Use the level mapping in activity 1 to convert `B2B1B0` into `G2G1G0`.
For each output, draw a three-input K-map with rows `B2 = 0, 1` and columns `B1B0 = 00, 01, 11, 10`, then obtain its equation. Implement the converter using the fewest two-input XOR gates and wires.

`G2 = ____`; `G1 = ____`; `G0 = ____`.

Draw the complete converter. Gate count, excluding wires: ____. Output for binary `110`: ____.

### Converter Faults

#### 3. Find a wrong XOR input

A copy of the dial encoder uses `G2 = B2`, `G1 = B2 ⊕ B1`, but `G0_wrong = B2 ⊕ B0`.

| Binary input | Required Gray | Faulty Gray | Different? |
|---|---|---|---|
| 000 | ____ | ____ | ____ |
| 001 | ____ | ____ | ____ |
| 010 | ____ | ____ | ____ |
| 011 | ____ | ____ | ____ |
| 100 | ____ | ____ | ____ |
| 101 | ____ | ____ | ____ |
| 110 | ____ | ____ | ____ |
| 111 | ____ | ____ | ____ |

An equation for `Mismatch = 1` is ____. On the final XOR gate, replace the input wire ____ with ____.

### Parity Checking

#### 4. Inspect received cupboard flags

A cupboard sends four flags: `D3 = locked`, `D2 = lit`, `D1 = chilled`, `D0 = stocked`; 1 means that condition is true. An even-parity bit `P` is appended, so received words are `D3D2D1D0P`.
A receiver XORs all five received bits. Complete its intermediate signals and verdicts.

`left = D3 ⊕ D2`; `right = D1 ⊕ D0`; `Error = ____`.

| Received word | left | right | Error |
|---|---|---|---|
| 00000 | ____ | ____ | ____ |
| 10001 | ____ | ____ | ____ |
| 10110 | ____ | ____ | ____ |
| 11111 | ____ | ____ | ____ |
| 11011 | ____ | ____ | ____ |

Two-input XOR gates needed for the whole checker: ____.

### Updating a Check Bit

#### 5. Change one message flag

A valid even-parity message has data `D3D2D1D0` and parity `P_old`. Replace only `D3` with the new bit `N`; all other bits stay fixed.

| Old data | P_old | N | New data | P_new |
|---|---|---|---|---|
| 0110 | 0 | 1 | ____ | ____ |
| 1111 | 0 | 0 | ____ | ____ |
| 1000 | 1 | 1 | ____ | ____ |
| 0000 | 0 | 0 | ____ | ____ |

Update the parity using only `P_old`, the old `D3`, and `N`: `P_new = ____`. Draw that update circuit. A changed data bit makes the parity bit ____; an unchanged data bit leaves it ____.

### Error Patterns

#### 6. What a passing check can miss

Start with valid even-parity word `10001`. XOR it with each error mask; a 1 in the mask flips that position.

| Error mask | Received word | Bits flipped | Error |
|---|---|---|---|
| 00000 | ____ | ____ | ____ |
| 10000 | ____ | ____ | ____ |
| 01001 | ____ | ____ | ____ |
| 11100 | ____ | ____ | ____ |
| 11110 | ____ | ____ | ____ |

One changed-data word that passes the parity check is ____. Parity detects every pattern with an ____ number of flipped bits, but a passing check does not prove that the data is unchanged.

### Two’s Complement Limits

#### 7. Reverse a small movement command

A toy lift uses three-bit two's complement for movements from −4 to +3 steps. A reverse command asks for the mathematical negative of the original movement.

| Input word | Signed movement | Desired reverse | Representable in 3 bits? | Reverse word if representable |
|---|---|---|---|---|
| 000 | ____ | ____ | ____ | ____ |
| 010 | ____ | ____ | ____ | ____ |
| 101 | ____ | ____ | ____ | ____ |
| 100 | ____ | ____ | ____ | ____ |

Use `not representable` in the last column when needed. The exceptional input word is ____. With input bits `X2X1X0`, an exception indicator is `Exception = ____`.
