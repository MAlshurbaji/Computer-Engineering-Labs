# MATLAB — Lab 02: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

A rack has recorded counts `counts = [8 4 9 2];`. Which expression selects the final two positions in their existing order?

A. `counts(2:3)`

B. `counts([4 3])`

C. `counts(end-1:end)`

D. `counts(end)`

## 2. MCQ

Lengths are a 1-by-3 row and widths are a 3-by-1 column. You want one area for each corresponding pair. Which change expresses that intention?

A. Use `lengths * widths` to get three areas.

B. Use `lengths + widths` to get three areas.

C. Use `lengths .* widths` without changing orientation.

D. Use `lengths .* widths.'` to align corresponding positions.

## 3. MCQ

For `minutes = [6 9 3 9];`, what does `minutes(minutes < 9)` contain?

A. `[6 3]`

B. `[6 9 3 9]`

C. `[9 9]`

D. `[1 3]`

## 4. MCQ

Each row of a 4-by-3 matrix describes one picnic basket; columns describe counts of three snack kinds. What does `sum(counts,2)` represent?

A. One total for each snack kind.

B. One total for each basket.

C. The largest count in each basket.

D. The second basket only.

## 5. MCQ

After `old = [2 7 5]; revised = old; revised(2) = 0;`, which pair of arrays remains?

A. Both are `[2 0 5]`.

B. Both are `[2 7 5]`.

C. `old` is `[2 7 5]`; `revised` is `[2 0 5]`.

D. `old` is `[2 0 5]`; `revised` is `[2 7 5]`.

## 6. MCQ

Two recipe plans have ingredient counts `plans = [2 1; 0 3];` and per-portion masses `grams = [50; 20];`. What does `plans * grams` produce?

A. `[100 20; 0 60]`

B. `[70; 70]`

C. `[100; 60]`

D. `[120; 60]`

## 7. Coding

Rows of counts = [4 2 1; 3 5 2; 6 1 4] describe three shelves; columns describe mugs, bowls, and plates in that order. Write a standalone script that preserves counts and creates correctedCounts with only the shelf-2 bowl count changed to 7. Create displayCounts from the corrected matrix with shelf order 3, 2, 1, leaving the column order unchanged. Calculate one total per item kind from correctedCounts. Keep all three matrices and the total row vector available for inspection.

## 8. Coding

Cut marks along one ribbon are at positions [0 0.45 1.10 1.60 2.50 3.00] metres, in increasing order. Each consecutive pair defines one piece. Write a standalone script that calculates the five piece lengths using array indexing and subtraction, identifies pieces strictly shorter than 0.60 m, and stores their piece numbers in original order. Number pieces 1 through 5 from left to right. Also store the short lengths and the total length of all five pieces. Preserve the original marks and use no loop.
