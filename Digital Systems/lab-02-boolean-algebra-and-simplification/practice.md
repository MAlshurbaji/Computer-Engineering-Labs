# Digital Systems

## Lab 02 · Boolean Algebra and Circuit Simplification: Practice

Work through one expression at a time. Complete the blanks, then check that each reduced circuit keeps the same output for every input combination. Equivalent expressions are acceptable unless a particular form is requested.

Use `1` for true/on and `0` for false/off. `+` means OR, `·` means AND, and a prime (`'`) negates the preceding signal or parenthesized expression. Use two-input AND/OR gates and one-input NOT gates. Signals may branch to several gates; an inverted signal may be shared within one circuit. Assume ideal gates and read outputs after inputs have settled.

### Identity and Complement Laws

#### 1. Remove fixed inputs

`L=1` means a bedside lamp is requested. Each row is an independent draft of an indicator circuit. Reduce each expression to one signal or constant.

| Draft expression | Reduced expression |
| --- | --- |
| L+0 | ____ |
| L·1 | ____ |
| L+1 | ____ |
| L·0 | ____ |

Which two drafts follow the request exactly? ____.

#### 2. Remove redundant inversions

`B=1` means a bag is packed; `T=1` means a tag is attached. A draft packed-bag indicator is `F=((B')')·(T+T')+B·B'`.

`(B')' = ____`; `T+T' = ____`; `B·B' = ____`; therefore `F = ____`.

| B | T | F |
| --- | --- | --- |
| 0 | 0 | ____ |
| 0 | 1 | ____ |
| 1 | 0 | ____ |
| 1 | 1 | ____ |

### Factoring and Absorption

#### 3. Share an enable signal

`P=1` means a music player has power. `A`, `B`, and `C` each equal 1 when a different play button is pressed. Its request circuit is `F=P·A+P·B+P·C`.

Factor out `P`: `F=P·(____)`.

Draw the literal three-product circuit and the factored circuit. Use the given order of terms and combine each three-way OR with two gates.

| Circuit | Two-input AND gates | Two-input OR gates |
| --- | --- | --- |
| Three-product circuit | ____ | ____ |
| Factored circuit | ____ | ____ |

#### 4. Remove a repeated requirement

`B=1` means bread is available; `T=1` means toast is available. A breakfast indicator uses `F=B·(B+T)+B'·T`.

Reduce the first product, then finish: `F=B+____=____`.

Give a Boolean law that justifies removing the repeated `B` requirement: ____.

| B | T | F |
| --- | --- | --- |
| 0 | 0 | ____ |
| 0 | 1 | ____ |
| 1 | 0 | ____ |
| 1 | 1 | ____ |

### De Morgan's Laws and Sum of Products

#### 5. Move the complement to the inputs

`M=1` means music is playing, `T=1` means the television is on, and `A=1` means its amplifier is on. A quiet indicator follows `Q=(M+T·A)'`.

Apply De Morgan's laws. Fill each blank with one literal, keeping input order `M,T,A`:

`Q=____·(____+____)`.

Draw both forms and complete `Q`.

| M | T | A | Q |
| --- | --- | --- | --- |
| 0 | 0 | 0 | ____ |
| 0 | 0 | 1 | ____ |
| 0 | 1 | 0 | ____ |
| 0 | 1 | 1 | ____ |
| 1 | 0 | 0 | ____ |
| 1 | 0 | 1 | ____ |
| 1 | 1 | 0 | ____ |
| 1 | 1 | 1 | ____ |

#### 6. Build an expression from a table

`B=1` means bread is packed, `F=1` means fruit is packed, and `S=1` means salad is packed. A lunch label `Y` is on when bread and fruit are both packed, or when salad is packed with neither bread nor fruit.

For each row with `Y=1`, write a product containing all three variables in `B,F,S` order. A dash means no product is needed.

| B | F | S | Y | Product for this row |
| --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | — |
| 0 | 0 | 1 | 1 | ____ |
| 0 | 1 | 0 | 0 | — |
| 0 | 1 | 1 | 0 | — |
| 1 | 0 | 0 | 0 | — |
| 1 | 0 | 1 | 0 | — |
| 1 | 1 | 0 | 1 | ____ |
| 1 | 1 | 1 | 1 | ____ |

Combine the three products, then reduce to two product terms. Put the bread-and-fruit term first:

`Y=____+____`.

Draw the reduced AND/OR/NOT circuit.

### Gate Counts and Equivalence Checks

#### 7. Buy chips for five fan controls

Each independent fan has enable input `E` and request inputs `A,B`; 1 means enabled or requested. Its original circuit is `F=E·A+E·B`. Factor it as `F=____`.

Use the original two-product circuit before simplification and the factored circuit after. All five fans have separate inputs; do not share signal-producing gates between fans. Unused gates in one chip may serve another fan.

Fill total gate counts and the smallest whole-chip quantities. The table supplies each chip's capacity.

| Chip | Gates per chip | Gates before, all 5 fans | Gates after, all 5 fans | Chips before | Chips after |
| --- | --- | --- | --- | --- | --- |
| 7404 NOT | 6 | ____ | ____ | ____ | ____ |
| 7408 two-input AND | 4 | ____ | ____ | ____ | ____ |
| 7432 two-input OR | 4 | ____ | ____ | ____ | ____ |

#### 8. Check a proposed rewrite

`A=1` means a hot drink is requested, `B=1` means a cold drink is requested, and `C=1` means cleanup mode is selected. An idle indicator must light when neither drink is requested, or whenever cleanup mode is selected.

The intended expression is `Y=A'·B'+C`. A proposed rewrite is `Z=(A+B+C)'`. Complete both columns; do not assume the rewrite is correct.

| A | B | C | Y | Z |
| --- | --- | --- | --- | --- |
| 0 | 0 | 0 | ____ | ____ |
| 0 | 0 | 1 | ____ | ____ |
| 0 | 1 | 0 | ____ | ____ |
| 0 | 1 | 1 | ____ | ____ |
| 1 | 0 | 0 | ____ | ____ |
| 1 | 0 | 1 | ____ | ____ |
| 1 | 1 | 0 | ____ | ____ |
| 1 | 1 | 1 | ____ | ____ |

Are the circuits equivalent for all inputs? ____. Give any one row where they differ: `(A,B,C)=____`.
