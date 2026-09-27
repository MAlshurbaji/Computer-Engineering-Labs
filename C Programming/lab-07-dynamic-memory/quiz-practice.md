# Lab 07 · Dynamic Memory and Arrays quiz practice

Write a separate C program for each task. Use the stated inputs and outputs; assume numeric input has the stated type.

## 1. Duplicate a Playlist Queue

Read a queue length from 1 to 12, followed by that many track IDs (integers from 0 to 999).
For a length outside 1–12, print `Invalid count` and exit before allocating.
Allocate the input queue dynamically. Write `int *repeat_tracks(const int tracks[], int count)` that allocates a new array containing each input ID twice consecutively, in the same order. Return NULL if its allocation fails.
Print the resulting IDs, one per line. Leave the input queue unchanged. Check both allocations and release all successful allocations, including on failure.

## 2. Mirror a Seating Layout

Read a row count and column count, each from 1 to 5, then the row-major occupancy values, each 0 or 1.
If either dimension is invalid, print `Invalid size` and exit before allocating.
Store the layout in one dynamically allocated block. Write `void mirror_rows(int *seats, int rows, int cols)` to reverse the positions within every row without exchanging the rows.
Print one row per line with single spaces between values. Check allocation and free the block.
