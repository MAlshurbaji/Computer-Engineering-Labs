# Lab 09 · Number Systems and Signed Integers quiz practice

Show the calculation or bit grouping for each result. State the base and keep the requested bit width.

## 1. A Counter and Three Displays

A machine must count every integer from 0 through 380. Determine the minimum unsigned bit width and its maximum representable value.
For a true count of 380, its displays show `101111100₂`, `574₈`, and `17D₁₆`.
Identify the inconsistent display, correct it, and justify the correction with place values.
Then write the count after one additional item in binary using the same minimum width.

## 2. Timer Resolution

Timer A shows `5.A₁₆` seconds. Timer B shows `101.1010₂` seconds.
Determine whether their times agree, showing both in decimal.
Both timers advance by 1/16 second. Write each display after one tick.
How many such ticks make 3/8 second? Give the binary fraction for that duration.

## 3. Signed Bytes in a Temperature Log

A log stores `D9₁₆` as an 8-bit two’s complement value. An app mistakenly reads it as unsigned.
Find both displayed decimal values and the difference between them.
A correction adds +39 to the signed value. Write the two input bytes and resulting byte in binary, and determine whether signed overflow occurs.
Finally, sign-extend the original reading to 16 bits and give the hexadecimal word.

## 4. Checking a Storage Design

A designer proposes three bits for a setting with nine values: every integer from 0 through 8.
Explain the problem, give the minimum bit width, and encode the largest setting at that width.
Separately, a sensor stores 0.45 decimal with six fractional binary bits by truncation. Its draft record is `0.011101₂`.
Check that record against the truncation rule. Give the corrected six-bit fraction and the two adjacent representable decimal values that bracket 0.45.
