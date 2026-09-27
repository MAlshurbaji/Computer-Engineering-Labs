# Python Programming

## Lab 04 · Nested Loops and Loop Control: Practice Quiz

Write one Python code block for each task. The given variables already exist. Do not use `input()` or `print()`.

### 1. Count affordable snack pairs

A stall has drink sizes numbered 1 through `drink_sizes` and dessert sizes numbered 1 through `dessert_sizes`. A drink costs its size number in AED; a dessert costs twice its size number in AED.

Given integers `drink_sizes` and `dessert_sizes` from 1 to 8 and `budget_aed` from 0 to 30, use nested `for` loops to count the different drink–dessert pairs whose combined cost is at most the budget. Store the count in `pair_count`. Leave the given variables unchanged.

### 2. Fill available shelf spaces

Given integer `slots` from 0 to 50, integer `books` from 0 to 50, and integer `blocked_slot` from 0 to `slots`, visit shelf spaces 1 through `slots` in order. A blocked slot holds no book; `blocked_slot = 0` means none is blocked. Put one book in each available space until the books run out or the shelf ends.

Use `continue` to skip the blocked space and `break` to stop once all books have been placed. Store the unplaced count in `books_left` and the final space used in `last_used`. Use `None` for `last_used` if no book is placed. Leave the given variables unchanged.
