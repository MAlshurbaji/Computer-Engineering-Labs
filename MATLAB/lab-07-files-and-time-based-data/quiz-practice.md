# MATLAB — Lab 07: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

A shop code "004" is imported as numeric 4. Which change directly preserves the code as written?

A. Multiply the imported number by 100.

B. Set that CSV variable's import type to string before reading.

C. Sort the imported rows.

D. Use a shorter filename.

## 2. MCQ

archive = load(path) reads a MAT file containing only a variable named costs. How is that saved variable accessed?

A. path.costs

B. load.costs

C. archive(1)

D. archive.costs

## 3. MCQ

A full datetime start is 22:50 on one day and finish is 00:20 on the next. What is minutes(finish-start)?

A. 90

B. -1350

C. 1.5

D. 70

## 4. MCQ

A complete table contains Time and Kilograms columns. Which operation keeps weights attached to their recorded times?

A. Sort each column independently.

B. Sort only the Time vector and reuse the original weights.

C. Sort the table by Time.

D. Replace Time with sorted row numbers.

## 5. MCQ

An exact regular time grid contains one unrecorded slot between measured counts 0 and 5. With fillwithmissing, what belongs in that slot?

A. 0

B. NaN

C. 2.5

D. 5

## 6. MCQ

A day has recorded readings [0;NaN;6]. A mean omits missing values, and coverage counts observed readings. Which pair is correct?

A. Mean 2, coverage 3

B. Mean 3, coverage 3

C. Mean 6, coverage 1

D. Mean 3, coverage 2

## 7. Coding

A rehearsal log has labels ["01";"09"] and durations [25;40] minutes. Write a complete script that creates a fresh scratch folder, writes rehearsal.csv, imports labels explicitly as strings, selects durations at least 30 minutes, and prints the selected label and duration. Save the selected table as chosen in a MAT file, load it into a structure, and check that the loaded table matches. Keep all outputs inside the fresh folder.

## 8. Coding

A towel counter is checked from 10:00 through 11:00 on 20 October 2026 at expected 20-minute intervals. Supplied minute offsets are [60;0;40] with paired towel counts [7;0;3]. Write a script that sorts complete observations, constructs a timetable, and fills the expected grid with missing markers only. Report observed-slot count, missing-slot count, measured-zero count, and mean observed towels. Keep the absent observation distinct from the measured zero.
