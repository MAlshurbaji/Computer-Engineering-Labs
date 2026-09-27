# MATLAB — Lab 04: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

For `x=[5 8 8 12]`, which expression selects entries strictly above 5 and at most 8?

A. `x((x>5) & (x<=8))`

B. `x(5<x<=8)`

C. `x((x>5) || (x<=8))`

D. `x(x<5 & x>8)`

## 2. MCQ

`M` is a 4-by-3 logical matrix: rows are drawers, columns are required tools. Which expression returns one completeness result per drawer?

A. `all(M,1)`

B. `all(M,2)`

C. `any(M,1)`

D. `M && true`

## 3. MCQ

The scalar `minutes` is 20. In `if minutes<=20 ... elseif minutes<=40 ... else ...`, which block runs?

A. Both the first and second blocks

B. Only the `else` block

C. Only the first block

D. No block because the tests overlap

## 4. MCQ

Why is `~isempty(v) && v(1)>0` safe when `v=[]`?

A. `&&` fills an empty vector with zero

B. `v(1)` is always defined in MATLAB

C. `isempty` deletes missing values

D. The false left condition skips the right operand

## 5. MCQ

A mask has two true entries. After `copy=original; copy(mask)=0;`, which statement is correct?

A. Only those two positions in `copy` change; `original` is retained

B. The two positions are deleted from both arrays

C. Every position in `original` becomes zero

D. `copy` must become a scalar

## 6. MCQ

A `switch` has one matching string case followed by more cases. What happens after its block finishes?

A. All later cases run automatically

B. Execution continues after the `switch` end

C. A `break` statement is required to avoid an error

D. The controlling string becomes empty

## 7. Coding

Create visitorIds=[101 102 103 104 105], morning=logical([1 0 1 0 1]) and evening=logical([0 1 1 0 0]), all row vectors. A true entry means that visitor attended that session. Produce onceIds for visitors attending exactly one session, twiceIds for those attending both, and absentCount for those attending neither. Use combinations of &, | and ~ without loops. Preserve the ID order.

## 8. Coding

Create reservations=logical([1 0 0;1 1 0;0 1 1]), with rows rooms and columns time slots. A room is free for the entire plan only when its whole row is false. Produce freeAllDay as a column and busySlots as a row indicating any reservation in each slot. Set message to ROOM AVAILABLE if any room is free for the whole plan, otherwise NO FULL-DAY ROOM. Do not interpret a partly free room as free all day.
