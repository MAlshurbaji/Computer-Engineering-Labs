# Lab 10 · Bitwise Operations and Floating Point

Practise changing selected flags and checking how a computer stores fractional values.

Fill each `____` and keep your working beside it. Subscripts or prefixes identify the number base.

## Bitwise AND and Selection Masks

Use **eight bits** throughout the bitwise activities. Number bits from 0 at the right to 7 at the left. NOT flips only these eight bits.

A control byte is `00101101₂`. Bits 2 and 3 control the radio and timer.

- A mask selecting just bits 2 and 3 is `____₂`.
- `control AND mask` gives `____₂`, which is ____ in decimal.
- Radio enabled? ____; timer enabled? ____.

## Bitwise OR and Setting Flags

Start with `01000010₂`. Enable bits **0, 2, and 4** without changing any other bit.

- Set mask: `____₂`.
- New state after OR: `____₂` = ____ in decimal.
- The original enabled bits that remain enabled are ____.
- Apply the same OR again: `____₂`. Did anything change on the second application? ____.

## Bitwise NOT and Clearing Flags

Start with `11100111₂`. Clear bits **1 and 5**, preserving all others.

- Bits-to-clear mask: `____₂`.
- Its eight-bit NOT: `____₂`.
- `state AND (NOT mask)` gives `____₂` = ____ in decimal.

Use an eight-bit complement here, independent of the integer width used by a programming language.

## Bitwise XOR and Toggling Flags

A button toggles the mask `00001011₂` in the initial state `00110010₂`.

- State after one press: `____₂` = ____ in decimal.
- State after a second identical press: `____₂`.
- Bit positions that the button can change: ____.
- Bit positions that remain unchanged after either press: ____.

## Detecting Changed Bits

A status byte changes from `00101110₂` to `01100110₂`.

- XOR of old and new states: `____₂`.
- Bit positions that changed: ____.
- Position changed from 0 to 1: ____; position changed from 1 to 0: ____.
- Could an OR operation alone make this change? ____; explain briefly: ____.

## Normalized Binary and Biased Exponents

Use **IEEE 754 binary32** for the remaining activities: **1 sign bit, 8 exponent bits with bias 127, and 23 fraction bits**. For normal numbers, the leading `1` is implied and is not stored in the fraction field. All values here are normal and exact.

A timer reports **6.5 seconds**.

- Binary value: `____₂`.
- Normalized form: `1.____₂ × 2^____`.
- Sign bit: ____; unbiased exponent: ____; stored exponent: ____ in decimal.
- Stored exponent as eight bits: `____`.
- Fraction field, padded on the right to 23 bits: `____`.

A draft uses stored exponent `10000000₂`. What value would that draft represent with the same sign and fraction? ____.

## Negative Normal Values

A correction of **−0.375** equals `−1.1₂ × 2⁻²`.

| Field | Required bits |
|---|---|
| Sign, 1 bit | ____ |
| Biased exponent, 8 bits | ____ |
| Fraction, 23 bits | ____ |

Join the fields into one 32-bit word: `____`.
For a positive correction of the same magnitude, the only field that changes is ____, to ____.

## Decoding and Changing an Exponent

A normal binary32 value has these fields:

`sign = 1`, `exponent = 10000001`, `fraction = 01100000000000000000000`.

- Unbiased exponent: ____.
- Signed normalized value: ____ × 2^____.
- Fixed-point binary value: ____; decimal value: ____.
- To double its magnitude while keeping its sign, change the exponent field to ____.
- The new decimal value is ____. The fraction field stays ____.
