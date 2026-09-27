# Lab 09 · Number Systems and Signed Integers

Build confidence checking what a number means across different displays and storage formats.

Fill each `____` and keep your working beside it. Subscripts or prefixes identify the number base.

## Positional Notation

A counter contains **62 objects**. Check three labels copied from different displays.

| Label | Expansion in decimal place values | Decimal value | Matches the counter? |
|---|---|---|---|
| `00111110₂` | `32 + ____ + ____ + ____ + ____` | ____ | ____ |
| `3E₁₆` | `3 × 16 + ____` | ____ | ____ |
| `72₈` | `7 × 8 + ____` | ____ | ____ |

The label that needs correction is ____. Its corrected octal label is ____.

## Unsigned Range and Storage Width

A ticket counter must represent every integer from **0 through 220**.

- Seven bits hold values from 0 to ____; eight bits hold values from 0 to ____.
- The smallest sufficient width is ____ bits.
- At that width, 220 is `____₂`; the next value is `____₂`.
- The number of unused bit patterns above 220 is ____.

## Binary Grouping into Hexadecimal and Octal

A device sends the 12-bit record `101001110010₂`.

- Group into four-bit groups: `____ ____ ____`; hexadecimal label: ____.
- Group into three-bit groups: `____ ____ ____ ____`; octal label: ____.
- The first four bits encode the channel number ____ in decimal.
- The final eight bits encode the reading ____ in decimal.

Keep the channel bits separate when reporting the reading. Do not interpret all 12 bits as the reading.

## Exact Binary Fractions

A timer advances once every **1/8 second** and has counted **27 ticks**.

- Elapsed time as a fraction of a second: ____; decimal seconds: ____.
- Whole seconds: ____; remaining ticks: ____.
- Binary seconds: `____.____₂`, using three bits after the point.
- One further tick gives decimal ____ seconds and binary `____.____₂`.

## Hexadecimal Fractional Places

A small timer displays `2.B₁₆` seconds and advances in steps of **1/16 second**.

- The `B` contributes ____ / 16 second.
- Decimal time: ____; binary time with four fractional bits: `____.____₂`.
- After one tick, its hexadecimal display is ____ and its decimal time is ____.
- The tick size in binary is `0.____₂`.

## Truncating a Binary Fraction

Store **0.3 decimal** using exactly **six bits after the binary point**. Truncate; do not round.

Use repeated multiplication by 2 to find the six bits: `0.____₂`.

- Stored value as a fraction with denominator 64: ____ / 64.
- Stored decimal value: ____.
- The next larger value available in this format: ____ / 64.
- Complete the bound: ____ ≤ 0.3 < ____.
- The amount lost by truncation is ____.

## Two’s Complement Interpretation

A temperature record contains the byte `11011000₂`.

| Interpretation | Decimal value |
|---|---|
| Unsigned 8-bit integer | ____ |
| Signed 8-bit two’s complement | ____ |

For the signed reading, write the positive magnitude bits after inverting and adding one: `____₂`.
Write the same signed value in 16 bits: `____₂`. Extend with the original sign bit.
The 8-bit and 16-bit hexadecimal forms are ____ and ____.

## Signed Arithmetic and Overflow

An 8-bit signed record contains **−73**. A calibration step subtracts **64**.

- Exact mathematical result: ____.
- Allowed 8-bit signed range: ____ through ____.
- Stored input patterns: −73 = `____₂`; +64 = `____₂`.
- Perform subtraction using two’s complement. Keep eight result bits: `____₂`.
- Interpreted as signed, those result bits mean ____. Did overflow occur? ____.
- Use nine bits instead: the exact result is `____₂`.

Explain in one sentence why the eight-bit result cannot be used as the corrected reading: ____.
