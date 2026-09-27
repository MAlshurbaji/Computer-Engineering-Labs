# MATLAB — Lab 02: Vectors, Matrices, and Indexing

Organize several related quantities at once, while keeping the meaning of every row and column visible.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Construct row vectors, column vectors, and rectangular matrices.
- Select and update values using positions, ranges, and logical masks.
- Match array shape to paired calculations and grouped totals.
- Distinguish element-wise arithmetic from a matrix product.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Run each guided script independently; it declares all its own arrays.
- Rows and columns have meanings supplied by each task. Write those meanings down before calculating.
- This lesson uses base MATLAB arrays. No spreadsheet, external file, loop, or user-defined function is required.

## Row Vectors and Regular Sequences

An array keeps several values together under one name. A vector has one row or one column. Use square brackets to create a row vector, separating its values with spaces or commas. The order matters: it might represent increasing time, shelf position, or the sequence in which observations were recorded. For a regularly spaced sequence, start:step:stop specifies the starting value, the increment, and the stopping boundary. The boundary is included only if the sequence reaches it. When you want a particular number of evenly spaced points including both endpoints, linspace(start,stop,count) expresses that requirement directly. These are different choices: one controls the step, while the other controls the number of points. Use numel to count all elements without assuming that the vector points in a particular direction. Build a small sequence first and inspect it before using it in a larger calculation. A regular numerical sequence can represent planned positions, but it does not by itself establish that measurements were actually collected at those positions.

### Task 1 — Marking a small windowsill

1. Create positions every 15 cm from 0 through 60 cm.
2. Compare that vector with five evenly spaced positions across the same span.

```matlab
positionsCentimetres = 0:15:60;
fivePositions = linspace(0,60,5);
positionCount = numel(positionsCentimetres);
```

**Check the result**

- Both methods produce a row vector for this particular span and spacing.
- The two endpoints are positions, so five positions define four gaps.

**Try a change:** Change the colon step to 18 and compare its final value with the linspace endpoint.

## Matrices and Dimensions

A matrix is a rectangular array. Spaces separate columns within a row, and semicolons separate the rows inside square brackets. Every row must contain the same number of values. Choose what the two directions mean before entering data. In the example, rows identify cupboards and columns identify kinds of tableware. That interpretation makes a row total meaningful. The expression size(A,1) gives the number of rows, while size(A,2) gives the number of columns. The function numel counts all entries. A total also needs a direction: sum(A,2) adds across the columns of each row, leaving one result per row as a column vector. In contrast, sum(A,1) adds down the rows and returns one result per column. Supplying the dimension explicitly prevents uncertainty when an array changes shape. A dimension check confirms structure, not data quality: a rectangular matrix can still contain a value entered in the wrong place. Keep a short comment identifying the row and column meanings beside the data declaration.

### Task 2 — Tableware in two cupboards

1. Inspect the array dimensions and calculate the total in each cupboard.
2. Compare cupboardTotals with totalsByKind and explain the different shapes.

```matlab
% Rows: upper, lower cupboard. Columns: mugs, bowls, plates.
tableware = [4 6 8; 3 5 7];
cupboardCount = size(tableware,1);
kindCount = size(tableware,2);
entryCount = numel(tableware);
cupboardTotals = sum(tableware,2);
totalsByKind = sum(tableware,1);
```

**Check the result**

- Each cupboard total occupies one row of a column vector.
- Each kind total occupies one column of a row vector.

**Try a change:** Add a third cupboard row with three counts, then inspect which output dimension grows.

## Positional and Linear Indexing

Indexing selects stored values without retyping them. MATLAB positions start at one. A vector entry can be selected with one index, while a matrix position is usually clearest as row followed by column. Parentheses perform the selection; square brackets construct an array of positions when several are needed. Inside an indexing expression, end refers to the last valid position along the dimension being indexed. It adapts to a changed array size, which is useful when you want the most recent entry rather than a fixed numbered entry. A single index applied to a matrix follows its columns from top to bottom, then moves to the next column. This linear order is different from reading a displayed table across its rows. Prefer two indices whenever the row and column meanings matter to the task. Use a small hand-drawn matrix to verify a linear position when it is necessary. An index outside the available range does not select an approximate value; reading that position produces an error.

### Task 3 — Finding a stored reading

1. Use the vector endpoints to calculate a change in a water-level reading.
2. Locate the same matrix value once by row and column and once by linear position.

```matlab
levelsCentimetres = [12 15 14 18];
firstLevel = levelsCentimetres(1);
latestLevel = levelsCentimetres(end);
changeCentimetres = latestLevel - firstLevel;
% Room temperatures in degrees Celsius.
% Rows: Monday, Tuesday. Columns: morning, noon, evening.
roomReadings = [21 24 22; 20 23 21];
tuesdayNoon = roomReadings(2,2);
sameReading = roomReadings(4);
```

**Check the result**

- The vector change compares the final stored observation with the first.
- Linear position 4 is reached by walking down the first two columns.

**Try a change:** Append a fifth vector reading inside the literal and observe how end adapts.

## Subarrays and Selected Ordering

A selection can contain several positions. A colon used by itself inside parentheses means every position along that dimension. A range such as 2:4 means those consecutive positions, while a vector such as [3 1] requests a particular order. These choices can extract a rectangular portion of a matrix or present selected columns in a new order. The result is a separate array assigned to a new variable; the source matrix remains unchanged. Keep the labels or meanings aligned with that requested order. Selecting column three before column one means the first output column now has the meaning that belonged to column three. A useful check is to predict the number of output rows and columns before running the statement. Reading an entire row with A(row,:) returns a row vector; reading an entire column with A(:,column) returns a column vector. That orientation influences later arithmetic, so treat it as part of the result rather than as a display preference.

### Task 4 — Choosing shelves for a packing list

1. Extract all item kinds from shelves 1 and 3.
2. Create a separate view containing boxes first and jars second.

```matlab
% Rows: shelves 1 to 3. Columns: jars, tins, boxes, bags.
stock = [6 2 4 1; 3 5 2 7; 8 1 6 3];
selectedShelves = stock([1 3],:);
boxesThenJars = stock(:,[3 1]);
middleShelf = stock(2,:);
```

**Check the result**

- Reordering the output columns does not rearrange stock itself.
- middleShelf remains a row vector.

**Try a change:** Select bags and tins from shelves 2 and 3, in that order.

## Indexed Assignment and Copies

The left side of an assignment can identify only the positions you intend to change. This lets you correct a recorded value while preserving the surrounding entries. When several positions are selected, provide replacement values that fit the selection. A scalar can also be assigned to several selected positions, giving each the same value. Copying a numeric array to another variable first preserves the earlier values for comparison; changing the new array does not make the saved array change with it. Name the two versions according to their roles so that a later calculation uses the intended one. It is possible to grow an array by assigning beyond its current size, but that is not the goal here: these activities update existing entries only. Identify the affected positions before executing the assignment, then compare the entire result with the original. An unchanged total alone is not enough evidence that a correction was made in the correct positions, because different changes can cancel one another.

### Task 5 — Correcting a row of notebook counts

1. Preserve the original counts for five drawers.
2. Replace drawer 2 with 7 notebooks and drawer 5 with 4, leaving the other drawers unchanged.

```matlab
originalCounts = [3 6 2 5 1];
correctedCounts = originalCounts;
correctedCounts([2 5]) = [7 4];
addedNotebooks = sum(correctedCounts) - sum(originalCounts);
```

**Check the result**

- Only the selected positions change.
- The original array remains available for checking the correction.

**Try a change:** Assign zero to positions 1 and 3 in correctedCounts and inspect originalCounts again.

## Logical Selection

A comparison applied to an array produces a logical array: each position is true or false according to the corresponding input value. This array is often called a mask. Use the mask inside parentheses to select the matching entries. The values keep their original relative order; MATLAB does not sort them merely because a condition was applied. A mask can also select positions for an update. The comparison boundary matters: less than excludes equality, whereas less than or equal includes it. State that boundary in the task before choosing the operator. For a logical vector, sum counts the true entries because true contributes one and false contributes zero. An empty selection is a legitimate result when no value qualifies. This lesson uses one comparison at a time; combining several conditions and controlling program flow comes later. Notice that selection and replacement are different actions. Save the selected original readings before applying a replacement if you need both the recorded values and the revised planning values.

### Task 6 — Planning a water top-up

1. Select bottle levels strictly below 250 mL.
2. Copy the readings and set only those selected planning levels to 250 mL.

```matlab
levelsMillilitres = [250 180 420 0 300];
needsTopUp = levelsMillilitres < 250;
lowReadings = levelsMillilitres(needsTopUp);
lowCount = sum(needsTopUp);
plannedLevels = levelsMillilitres;
plannedLevels(needsTopUp) = 250;
```

**Check the result**

- The reading exactly at 250 mL is not selected.
- The zero reading is selected and remains visible in lowReadings.

**Try a change:** Replace the levels with [250 300 400] and inspect the empty selection and its count.

## Element-wise Arithmetic and Orientation

When two arrays describe paired measurements, the intended calculation often acts on corresponding positions. Element-wise multiplication uses .*, division uses ./, and powers use .^. The dot is part of the operator. Addition and subtraction already act element by element and do not need an extra dot. For paired calculations, use the same shape for both arrays: matching lengths alone are not sufficient. A row and a column can expand into a grid of pairwise combinations, which is a different question from calculating one result per pair. The nonconjugating transpose operator, written dot followed by an apostrophe, exchanges rows and columns. In this lesson all values are real, and this operator communicates that the purpose is a shape change. Check size when a result unexpectedly becomes a matrix. For a simple positive measurement example, also inspect units: metres multiplied by metres produces square metres, while square metres divided by litres produces a coverage rate. A syntactically valid array calculation still needs this interpretation.

### Task 7 — Covering three small tabletops

1. Calculate one area per tabletop using paired widths and lengths.
2. Keep the paint amounts in the same row orientation before calculating coverage.

```matlab
widthsMetres = [0.5 0.8 0.6];
lengthsMetres = [1.2 1.0 1.5];
paintLitresColumn = [0.12;0.16;0.18];
paintLitres = paintLitresColumn.';
areasSquareMetres = widthsMetres .* lengthsMetres;
squareMetresPerLitre = areasSquareMetres ./ paintLitres;
squaredWidths = widthsMetres .^ 2;
```

**Check the result**

- Each result has one entry per tabletop.
- The dot operators preserve the intended pairing.

**Try a change:** Inspect the size of widthsMetres + paintLitresColumn without interpreting that mixed-unit result as a physical quantity.

## Matrix Products and Weighted Totals

Matrix multiplication combines rows with columns. For A*B, the number of columns in A must equal the number of rows in B. Each output entry adds the products of corresponding values from one row of A and one column of B. This is useful when rows describe different plans and columns describe the components of each plan. A column of per-component quantities can turn every plan into one total. The arrangement is part of the model: a count in the first column must multiply the first quantity, not a quantity from another category. Matrix multiplication and element-wise multiplication therefore answer different questions. A matrix product returns the combined totals here, while element-wise multiplication would expose individual contributions and may create a differently shaped result. Predict the output shape before calculating: a two-by-three count matrix times a three-by-one mass vector gives a two-by-one result. Manually check one row's weighted sum to confirm both the ordering and the physical unit.

### Task 8 — Comparing two picnic packing plans

1. Calculate the total mass of each plan in kilograms.
2. Check the first plan by adding its three contributions by hand.

```matlab
% Columns: flask, lunch box, blanket. Rows: two packing plans.
counts = [2 3 1;1 2 2];
kilogramsPerItem = [0.4;0.3;0.8];
planKilograms = counts * kilogramsPerItem;
differenceKilograms = planKilograms(2) - planKilograms(1);
```

**Check the result**

- The column result has one total per plan.
- The component order is shared by counts and kilogramsPerItem.

**Try a change:** Change only the blanket mass to 1.0 kg and explain why the two totals rise by different amounts.

## Independent builds

### Build 1 — A cupboard restocking sheet

Three cupboard rows contain four kinds of packaged food. Initial counts are [5 2 8 1; 3 6 4 2; 7 1 3 5], and planned use is [1 1 2 1; 2 3 1 0; 3 1 2 2] in the same arrangement. Write a standalone script that calculates remaining counts without changing the initial array. Preserve those remaining counts. Create a restocked copy in which every count strictly below 2 becomes 5; values equal to 2 stay unchanged. Calculate one final total per cupboard and the total number of packages added. Keep both the mask and the before/after matrices available for inspection.

### Build 2 — Choosing a carrying plan

Four bag plans contain counts of books, water bottles, and towels in that order: [2 1 1; 1 2 2; 3 0 1; 0 3 2]. The corresponding item masses are 0.6, 0.75, and 0.25 kg. Write a standalone script using a matrix product to calculate one mass per plan. Create a logical column selecting plans of at most 2.1 kg, including equality. Extract the matching rows of the count matrix in their original order and the matching masses. Also calculate each plan's total item count. Do not round masses before selection.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [Array indexing](https://www.mathworks.com/help/matlab/math/array-indexing.html)
- [Array versus matrix operations](https://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html)
- [Evenly spaced vectors with linspace](https://www.mathworks.com/help/matlab/ref/double.linspace.html)
