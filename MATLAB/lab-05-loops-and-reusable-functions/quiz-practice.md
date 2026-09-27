# MATLAB — Lab 05: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

A loop must store one numeric result for each element of a 5-by-1 vector `v`. Which initialization preserves that shape?

A. `zeros(1,5)`

B. `zeros(size(v))`

C. `zeros(5)`

D. `[] + v(1)`

## 2. MCQ

A running total is reset to zero at the start of every loop iteration. What does this usually lose?

A. The loop index definition

B. The last input value

C. Contributions from earlier iterations

D. The ability to multiply numbers

## 3. MCQ

Why place `idx<=numel(v)` before `v(idx)<=limit` in a `while` condition joined by `&&`?

A. To sort `v` automatically

B. To make the loop run exactly twice

C. To change a column into a row

D. To avoid evaluating an out-of-range index

## 4. MCQ

For MATLAB R2022b, where should local function definitions go in a script containing ordinary executable statements?

A. After the last executable script statement

B. Inside a for loop

C. Before every variable assignment

D. In the Command Window between iterations

## 5. MCQ

A local function needs a rate stored in the script. Which interface is clearest and avoids relying on the script workspace?

A. Use the variable without declaring an input

B. Pass `rate` as an explicit argument

C. Rename `rate` to a built-in function name

D. Declare a second script with the same variable name

## 6. MCQ

After `rate=3; f=@(x) rate.*x; rate=7;`, what does `f(2)` return?

A. 14

B. 7

C. 6

D. An error because `rate` changed

## 7. Coding

Create shelfLoads=[4 7 2 6 3] books. Write local function alternatingTotals(loads) that uses a for loop and returns two totals: entries at odd positions and entries at even positions. The input is a numeric row vector and may be empty. Call it for the supplied vector and for []. Retain oddBooks, evenBooks, emptyOdd and emptyEven. Initialize both totals to zero and place the local function at the end of the script.

## 8. Coding

Create trayCounts=[3 0 5 2] plants. Preallocate a row vector startPosition of the same size. Position numbering starts at one; startPosition(k) records the next unused position before tray k is added, then that tray reserves trayCounts(k) consecutive positions. Use a loop, including the zero-count tray. Retain nextFree after all trays. Define an anonymous function labelWidth(n)=4+0.5*n millimetres and evaluate it on trayCounts into widthMm. Use element-wise arithmetic.
