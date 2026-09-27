# Digital Systems

## Lab 03 · Karnaugh Maps: Practice

Build confidence turning a small set of everyday rules into a simpler logic circuit.

Fill each `____` and draw the requested circuits. Equivalent correct forms are accepted.

Notation: `X'` means NOT X, `XY` means AND, `X + Y` means OR, and `X ⊕ Y` means XOR. Inputs are independent bits unless stated otherwise; 0 means the opposite of the stated 1 meaning. Read bit words with the leftmost bit most significant. For a three-input K-map use rows `A = 0, 1` and columns `BC = 00, 01, 11, 10`; for four inputs use rows `AB = 00, 01, 11, 10` and columns `CD` in the same Gray order. Opposite edges are adjacent; diagonals are not. Use no don't-care cells.

### Map Coordinates

#### 1. Put each input in its cell

A toy has three switches `A`, `B`, and `C`; 1 means a switch is on. Write the decimal index of each input word in the map.

| A \ BC | 00 | 01 | 11 | 10 |
|---|---|---|---|---|
| 0 | ____ | ____ | ____ | ____ |
| 1 | ____ | ____ | ____ | ____ |

The cell for `101` has row ____ and column ____. From `000`, the horizontally adjacent cell across the outer edge is ____; the changed input is ____.

### Three-Input Grouping

#### 2. Day and night lighting

For a reading light, `A = 1` means night mode, `B = 1` means motion detected, and `C = 1` means the manual switch is on.
In night mode the light follows motion; otherwise it follows the manual switch.

Fill the output map, circle the largest useful groups of 1s, and complete a minimal sum of products (SOP).

| A \ BC | 00 | 01 | 11 | 10 |
|---|---|---|---|---|
| 0 | ____ | ____ | ____ | ____ |
| 1 | ____ | ____ | ____ | ____ |

`Light = ____`. Draw the corresponding AND/OR/NOT circuit.

### Four-Input Grouping

#### 3. Two ways to charge a phone

`A = 1`: a wireless pad is present. `B = 1`: the wired cable is missing. `C = 1`: the wireless pad has power. `D = 1`: the wired socket is off.
Charging is available when the wired cable and powered socket are both available, or when the powered wireless pad is present.

| AB \ CD | 00 | 01 | 11 | 10 |
|---|---|---|---|---|
| 00 | ____ | ____ | ____ | ____ |
| 01 | ____ | ____ | ____ | ____ |
| 11 | ____ | ____ | ____ | ____ |
| 10 | ____ | ____ | ____ | ____ |

Circle a group crossing both outer edges, plus any other necessary group. Minimal SOP: `Charge = ____`. Number of groups: ____.

### SOP and POS

#### 4. Pack both food and a drink

`A = 1`: sandwiches packed. `B = 1`: fruit packed. `C = 1`: water packed. `D = 1`: juice packed.
The picnic bag is ready when it has at least one food and at least one drink.

| AB \ CD | 00 | 01 | 11 | 10 |
|---|---|---|---|---|
| 00 | ____ | ____ | ____ | ____ |
| 01 | ____ | ____ | ____ | ____ |
| 11 | ____ | ____ | ____ | ____ |
| 10 | ____ | ____ | ____ | ____ |

Group 1s for a minimal SOP: `Ready = ____`. Group 0s for a minimal product of sums (POS): `Ready = ____`.
Draw both direct, unfactored implementations using only two-input AND/OR gates. Gates needed by your SOP: ____; by your POS: ____.

### NAND Implementation

#### 5. Use one gate type

Use the charging rules and signal meanings from activity 3. Complete this network using two-input NAND gates only, then draw it. `NAND(X,Y)` means `(XY)'`.

```text
nB = NAND(B, ____)
nD = NAND(D, ____)
wired_bar = NAND(____, ____)
wireless_bar = NAND(____, ____)
Charge = NAND(____, ____)
```

Total gates: ____. For `ABCD = 0101`, the output is ____; for `1010`, it is ____.

### Group Validity

#### 6. Check a proposed corner group

Return to the charging map in activity 3. A sketch groups only cells `0000` and `1010` as a pair.

- Inputs that change between these cells: ____.
- Is this two-cell group legal? ____.
- List all four cells of the valid corner rectangle containing them: ____.
- Product term for that rectangle: ____.

Another sketch covers that rectangle but omits the wireless group. Give one input word where that incomplete circuit fails: ____. Required output: ____; incomplete output: ____.

### Circuit Verification

#### 7. Find a misconnected branch

Use the reading-light rules from activity 2. A circuit was wired as `Wrong = AB + A'B`.

| ABC | Required Light | Wrong |
|---|---|---|
| 000 | ____ | ____ |
| 001 | ____ | ____ |
| 010 | ____ | ____ |
| 011 | ____ | ____ |
| 100 | ____ | ____ |
| 101 | ____ | ____ |
| 110 | ____ | ____ |
| 111 | ____ | ____ |

Number of mismatching rows: ____. Replace one input on the second AND gate so that `Repaired = AB + ____`. Draw the repaired circuit.
