# Lab 09 · Two-Dimensional Arrays and Pointers quiz practice

Write a separate C++ program for each task. Use the stated inputs and outputs; all input follows the stated ranges.

## 1. Find space for a square tray

Read a fixed 3 × 4 shelf grid in row order (`0` for empty, `1` for occupied).
Write `bool find_space(const int shelf[][4], int &row, int &column)` to find a completely empty 2 × 2 square. If several fit, choose the one with the smallest top-left row, then the smallest top-left column.
Return true and set the reference outputs to that top-left position using zero-based coordinates. If none fits, return false and set both outputs to −1. Do not change the shelf.
Print `Found` or `No space`, then the two output coordinates separated by a space on the next line.

## 2. Crop a picture frame

Read rows and columns, each 3–7, then a rectangular picture in row order with values 0–9.
Dynamically allocate the picture and a second grid with two fewer rows and two fewer columns, using an array of row pointers for each grid.
Write `void copy_inside(int **picture, int rows, int columns, int **inside)` to copy all cells except the outermost border into the second grid, preserving their arrangement and leaving the original unchanged.
Print the smaller grid, one row per line with spaces between values. Assume allocation succeeds; release every allocated row and both row-pointer arrays.

## 3. Find the first small hill

Read `n` (1–10), allocate an integer array with `new[]`, and read `n` path heights (0–100).
Write `int *first_peak(int *begin, int *past_last)`. Return a pointer to the first interior height strictly greater than both its immediate neighbors, or `nullptr` if none exists. Endpoints are never peaks; equal-height neighbors do not form a strict peak.
Use pointer movement and dereferencing inside the function, without array subscripts. Print the zero-based index of the returned element, or −1 for `nullptr`. Release the original array once; do not delete the returned pointer.
