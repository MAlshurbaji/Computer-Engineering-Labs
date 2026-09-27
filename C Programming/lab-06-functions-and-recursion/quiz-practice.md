# Lab 06 · Functions and Recursion quiz practice

Write a separate C program for each task. Use the stated inputs and outputs; assume numeric input has the stated type.

## 1. Overlapping Bookings

Write `int overlap_minutes(int start_a, int end_a, int start_b, int end_b)`.
Times are minutes after midnight, from 0 to 1440. Each start is no later than its end.
Return the duration common to both bookings; bookings that only touch have zero overlap.
In `main`, read the four integers in that order, call the function, and print its returned integer.


## 2. Rotating Three Labels

Write `void rotate_labels(int *left, int *middle, int *right)` for three distinct variables.
Move the old right value to the left, the old left value to the middle, and the old middle value to the right.
Read three label numbers from 0 to 999 in `main`, call the function, and print the new values separated by spaces.
Repeated label values are allowed. Do not use a global variable.

## 3. Buying Alternating Sticker Packs

Sticker packs arrive in a fixed order: a 3 AED pack, a 5 AED pack, then 3 AED again, and so on.
You buy from the front until the next pack costs more than your remaining budget; packs cannot be skipped.
Write the recursive function `int affordable_packs(int budget, int next_price)`. The next price is always either 3 or 5.
Return zero when the next pack is unaffordable; otherwise count that pack and recurse with the reduced budget and the other price.
Read a budget from 0 to 200 in `main`, call the function with starting price 3, and print the number of packs. Do not use a loop or a global variable.
