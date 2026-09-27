# Lab 10 · Bitwise Operations and Floating Point quiz practice

Show the calculation or bit grouping for each result. State the base and keep the requested bit width.

## 1. Updating a Control Byte

Start with the eight-bit state `01100001₂`. Apply these actions in order:
1. Enable bit 3 using OR.
2. Clear bit 5 using AND and an eight-bit NOT mask.
3. Toggle bits 0 and 6 using XOR.

Give each mask and each intermediate eight-bit state. Give the final value in decimal.
Bit 0 is the rightmost bit. Preserve bits that an action does not mention.

## 2. Finding a Minimal Change

A remote control changes its byte from `35₁₆` to `B1₁₆`.
Write both values in eight-bit binary and use XOR to locate the changed bit positions.
Identify which bit must be cleared and which must be set.
Give an AND mask to clear the required bit and an OR mask to set the required bit, preserving all other bits.
Explain why OR alone is insufficient and why AND alone is insufficient.

## 3. Repairing a Floating-Point Record

Use normal IEEE 754 binary32: one sign bit, an eight-bit exponent with bias 127, and a 23-bit stored fraction.
A recorded value is **10.25**, whose normalized binary value is `1.01001₂ × 2³`.
A draft stores exponent `00000011₂` and includes the leading `1` in its fraction field.
Describe both errors, then give the corrected sign, exponent, and all 23 fraction bits.
Join the fields and give the complete word as eight hexadecimal digits.

## 4. Comparing Two Readings

Two normal binary32 readings have these fields:

| Reading | Sign | Exponent | Fraction |
|---|---|---|---|
| A | `0` | `10000000` | `10000000000000000000000` |
| B | `1` | `01111111` | `10000000000000000000000` |

Decode both values into decimal and identify the smaller reading.
Would interpreting the two raw words as unsigned integers give the same ordering? Explain using the sign bit position.
Finally, give the fields for twice reading B without changing its sign or fraction.
