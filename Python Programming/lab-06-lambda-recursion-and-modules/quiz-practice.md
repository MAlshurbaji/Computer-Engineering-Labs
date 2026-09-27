# Python Programming

## Lab 06 · Lambda, Recursion, and Modules: Practice Quiz

Write the requested recursive function and assignment. The given variables already exist. Do not use `input()` or `print()`.

### Divide dough into small enough pieces

Define `piece_count(weight_g, maximum_g)`. Both arguments are positive integers from 1 to 1000 at the initial call.

If a piece weighs at most `maximum_g`, keep it as one piece. Otherwise divide it into two equal halves and apply the same rule to each half. Return the final number of pieces. Halves may have fractional weights. Use recursion with a clear base case; do not use loops.

Given `weight_g` and `maximum_g`, call your function and store its result in `pieces_ready`. Leave the given variables unchanged.
