# MATLAB — Lab 06: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

`T` has a numeric variable `Kg`. A calculation needs its numeric values for rows selected by logical mask `keep`. Which expression extracts those values directly?

A. `T(keep,{'Kg'})`

B. `T(keep,:)`

C. `T{keep,'Kg'}`

D. `T.Properties.VariableNames`

## 2. MCQ

Before any standardization, which statement about a string array element `""` is correct?

A. It is automatically the numeric value zero.

B. It is automatically a standard missing string.

C. It removes its table row when displayed.

D. It is an empty string value; a cleaning policy may explicitly mark it missing.

## 3. MCQ

A household list treats capitalization and edge spaces as insignificant, but internal spaces must stay. Which expression implements that policy for string array `labels`?

A. `lower(strtrim(labels))`

B. `strlength(labels)`

C. `sortrows(labels)`

D. `labels == ""`

## 4. MCQ

Two rows share a booking identifier but have different quantities. A script keeps the first row for each identifier. What makes that result defensible?

A. The first row is always the newest one.

B. The task explicitly chooses first occurrence as its conflict policy.

C. Matching identifiers prove the quantities are equal.

D. Removing the larger quantity is always safer.

## 5. MCQ

A table stores a label beside its price. Why use `sortrows(T,'Price')` instead of replacing only the price column with sorted values?

A. It converts every price to text.

B. It deletes all equal prices.

C. It keeps each label attached to its own price.

D. It changes all labels into ascending price numbers.

## 6. MCQ

A group contains two rows with `Pieces` values 4 and 6. What does `GroupCount` represent in a grouped summary?

A. The total of ten pieces.

B. The larger quantity of six.

C. The average quantity of five.

D. The two member records.

## 7. Coding

Create a table from Bin = ["A";"A";"B";"B";"A"] and Count = [2;0;NaN;4;3]. Count records with missing Count in missingCount and records with a genuine zero in zeroCount. Remove only rows missing Count. Produce summary, sorted by Bin, with the number of retained records and the sum of Count for each bin. Store totalObjects from the retained counts. Zero means a recorded empty bin; it must contribute one record and zero objects.

## 8. Coding

Create a repair-job table from Ticket = [7;8;7;9], Revision = [1;1;2;1], and Minutes = [10;4;12;6]. A higher Revision replaces an earlier record for the same Ticket. Every Ticket–Revision pair is unique. Retain only the highest revision of each ticket and return latest sorted by increasing Ticket. Store totalMinutes for those retained records. Reorder whole rows so ticket, revision, and duration remain associated.
