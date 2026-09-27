# MATLAB — Lab 06: Tables, Strings, and Data Cleaning

Turn a small collection of everyday records into a clear, trustworthy summary, one visible decision at a time.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Construct mixed-type tables and select rows without separating their fields.
- Normalize text and distinguish missing measurements from genuine zeros.
- Apply a stated duplicate policy and sort complete records.
- Produce grouped counts and totals from deliberately cleaned data.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Use one fresh scratch script for each task; every example supplies its own data.
- For practice, copy one entire section into its own scratch script, complete every blank, then run that script. Other unfinished sections can cause parsing errors even when you try Run Section.

## Constructing mixed-type tables

A shopping list contains several kinds of information: an item name, a quantity, and perhaps a yes-or-no flag. A numeric matrix cannot naturally keep those meanings and types together. A table gives each variable a name while keeping the fields for one record on the same row. In this lesson, every variable is a column vector, and every row describes one item or event. All variables supplied to the constructor must have the same number of rows.

Double quotes create string values, numbers remain numeric, and logical values represent true or false. Use meaningful variable names rather than remembering that the second column happens to contain a quantity. The `VariableNames` option makes those names explicit. The braces around its name list create a list of character vectors; they do not turn the resulting table into a numeric matrix.

Use `height` to count records and `width` to count variables. These are different questions from summing a quantity column. Three rows might describe eighteen objects. Keep units in names or task comments, and examine the displayed table before attempting calculations.

### Task 1 — Packing picnic supplies

1. Create the three supplied item records; Reusable is true when the item can be washed and used again.
2. Run the script and compare the record count with the number of individual objects.

```matlab
Item = ["plate"; "cup"; "spoon"];
Quantity = [4; 6; 8];
Reusable = logical([1; 1; 0]);
supplies = table(Item,Quantity,Reusable,'VariableNames',{'Item','Quantity','Reusable'});
recordCount = height(supplies);
variableCount = width(supplies);
objectCount = sum(supplies.Quantity);
disp(supplies)
```

**Check the result**

- The table has three rows and three named variables.
- The object count is larger than the record count.

**Try a change:** Add a matching fourth value to all three input columns, then compare the two counts again.

## Selecting table rows and variable contents

A table supports several kinds of indexing because sometimes you need complete records and sometimes you need the data inside a variable. Parentheses preserve the table container. For example, selecting certain rows and named variables returns a smaller table with its names and row associations intact. A colon in the second position keeps every variable. A logical row mask must describe the table's rows, just as a vector mask describes vector elements.

Dot notation accesses one named variable directly. If Quantity is numeric, `T.Quantity` is a numeric array. Curly braces can also extract contents, such as the numeric entries from selected rows of Quantity. Combining several variables inside braces requires compatible contents; a mixture of strings and numbers is better kept in a table.

Choose the form by considering the next operation. A printed shortlist benefits from retained names. A numerical total needs numeric values. Avoid sorting or filtering each column separately: doing so can attach one item's quantity to another item's name. Build the row mask once and apply it to the entire record when the relationship matters.

### Task 2 — Making a stationery shortlist

1. Keep records with at least five items.
2. Compare the types of shortlist and quantitiesOnly in the Workspace.

```matlab
Item = ["book"; "folder"; "pen"];
Quantity = [2; 5; 8];
T = table(Item,Quantity);
keep = T.Quantity >= 5;
shortlist = T(keep,{'Item','Quantity'});
quantitiesOnly = T{keep,'Quantity'};
selectedTotal = sum(quantitiesOnly);
disp(shortlist)
```

**Check the result**

- The shortlist remains a table; quantitiesOnly is a two-row numeric column.
- Both selected quantities contribute to selectedTotal.

**Try a change:** Change the threshold to nine and inspect the empty table and empty numeric column.

## Normalizing string labels

A string array stores each quoted piece of text as one element. In a column such as `["tea";"cocoa"]`, there are two labels, even though their lengths differ. This differs from a character array, which stores individual characters. Use string arrays for the record labels in this lesson so comparisons and transformations operate on labels rather than on separate letters. The equality operator compares each string with the requested value and returns a logical mask.

Real lists often contain inconsistent capitalization or accidental spaces at their edges. `strtrim` removes leading and trailing whitespace, and `lower` changes letter case. Combining them creates a consistent comparison form. Preserve the original labels in a separate variable if you may need to show exactly what was entered. Cleaning a copy makes the transformation easier to inspect.

These operations do not decide whether two different words have the same meaning. They do not repair spelling mistakes or remove an extra space inside a phrase. Use them when the stated policy treats case and edge spaces as insignificant. Apply that policy before comparing labels or grouping records, and document any stronger substitutions separately.

### Task 3 — Reconciling drink labels

1. Normalize case and edge whitespace while preserving rawLabels.
2. Count the labels matching the exact normalized text "green tea".

```matlab
rawLabels = ["  Green tea "; "GREEN TEA"; "cocoa "];
labels = lower(strtrim(rawLabels));
isTea = labels == "green tea";
teaCount = sum(isTea);
labelLengths = strlength(labels);
disp(labels)
```

**Check the result**

- The first two cleaned labels match.
- The internal space in "green tea" remains part of its nine-character length.

**Try a change:** Replace one label with "green  tea", containing two internal spaces, and inspect the comparison.

## Recognizing and standardizing missing values

A missing value means that information is unavailable. It is not automatically the same as zero. Zero objects on a shelf is a valid count; an unrecorded count should remain distinguishable. Numeric arrays commonly use `NaN` for missing entries. String arrays have a distinct missing string value. An empty string, written `""`, is still a string value and is not a standard missing string until you explicitly adopt that policy.

Some records use a special marker, such as minus ninety-nine, to mean unrecorded. `standardizeMissing` converts declared markers into the standard missing representation appropriate for the data type. This is a policy choice: use it only when the task defines that marker as missing. Never infer that every negative value in an arbitrary dataset must be invalid.

Use `ismissing` to locate missing entries. Comparing a number with `NaN` using equality is not a reliable missing-value test. After standardization, a logical mask can select the known values while retaining zeros. Count the missing entries before changing the dataset so the eventual summary can state how many observations were available. Converting a marker establishes meaning; it does not recover the lost measurement.

### Task 4 — Keeping an unknown count distinct from an empty shelf

1. Treat -99 as an unrecorded numeric count.
2. For labels only, treat empty text and "unknown" as missing.

```matlab
rawCounts = [2; NaN; 0; -99];
counts = standardizeMissing(rawCounts,-99);
missingCounts = ismissing(counts);
knownCounts = counts(~missingCounts);
rawLabels = ["green"; ""; "unknown"; "blue"];
labels = standardizeMissing(rawLabels,["","unknown"]);
missingLabels = ismissing(labels);
disp(knownCounts)
```

**Check the result**

- There are two missing numeric counts, while zero remains in knownCounts.
- The two declared text markers become missing strings.

**Try a change:** Replace -99 with a recorded count of one and check how the missing count changes.

## Removing records using required fields

Cleaning needs a reason, not just a command. A record may be usable for one question and incomplete for another. To total recorded task durations, the duration is required; a missing optional note would not necessarily justify removing that row. Select the required variables deliberately instead of discarding every row that has any missing field.

For a table, `rmmissing` removes rows with missing entries. Its `DataVariables` option limits the missing-value test to the named variables. The optional second output is a logical mask marking removed rows in the original table. That mask is useful for counting exclusions and checking which records were affected. It has the original row count, whereas the cleaned table is shorter.

Removal is different from replacing an unknown measurement with zero. Such a replacement would claim an event took no time, which the records do not establish. This lesson retains genuine zeros, excludes unavailable required measurements, and preserves the original table. A useful check is that retained rows plus removed rows equal the original height. You can also inspect excluded rows to understand what the summary no longer represents before presenting the total.

### Task 5 — Summarizing recorded household task times

1. Use Minutes as the only required field; values are minutes.
2. Keep a genuine zero-minute record and count the removed rows.

```matlab
Task = ["wash"; "fold"; "dry"; "pack"];
Minutes = [12; NaN; 0; 8];
T = table(Task,Minutes);
[clean,removed] = rmmissing(T,'DataVariables',{'Minutes'});
removedCount = sum(removed);
recordedMinutes = sum(clean.Minutes);
disp(clean)
```

**Check the result**

- Only the fold record is removed.
- The dry record remains even though its duration is zero.

**Try a change:** Set the fold duration to four minutes and compare the total and row counts.

## Resolving duplicates with a stated key

Repeated text does not necessarily mean a duplicate record. Two separate purchases can both contain a cup. A record identifier provides a more useful key when the data contract says that each identifier describes one purchase. Before removing duplicates, decide which fields identify the same event and which occurrence to retain. Keeping the first occurrence is one possible policy, not a universal correction for conflicting records.

`unique` can return the distinct values of a key and the original indices where those values occur. The stable option preserves the order in which keys first appear, instead of sorting the keys. With the default first-occurrence choice, the returned indices select the first row for each key. Applying those indices to the whole table preserves every retained record's associated fields. A tilde can discard an output that is not needed.

If duplicate keys disagree, a first-occurrence rule may discard newer or more accurate information. Such disagreements need a stated resolution rule; the function cannot infer the intended truth. Here, the repeated purchase is an exact duplicate. Keep the original table so you can compare record counts and verify that distinct purchases with the same item name survive.

### Task 6 — Removing a repeated receipt entry

1. ReceiptId identifies a purchase; keep the first row for each identifier.
2. Check that two different cup purchases are retained.

```matlab
ReceiptId = [41; 42; 41; 43];
Item = ["cup"; "plate"; "cup"; "cup"];
Quantity = [2; 1; 2; 3];
T = table(ReceiptId,Item,Quantity);
[~,firstIndex] = unique(T.ReceiptId,'stable');
deduplicated = T(firstIndex,:);
removedCount = height(T)-height(deduplicated);
disp(deduplicated)
```

**Check the result**

- Identifiers 41, 42, and 43 remain in first-seen order.
- The two retained cup rows describe different purchases.

**Try a change:** Change only the third row quantity, then identify which conflicting value the stated rule retains.

## Sorting complete records with tie rules

Sorting is a presentation and selection tool, but it must preserve record relationships. Sorting a duration column alone and writing it back beside unchanged labels can create false records. `sortrows` reorders complete table rows using the selected variables as keys. A single key may be enough to list tasks from shortest to longest. When two values are equal, a second key can establish a clearer order.

The key list is ordered by priority. Sorting first by Minutes and then by Room means that room names only decide the order among equal durations. Ascending order goes from smaller to larger numbers and follows text ordering for names. Descending order reverses the chosen key's direction. You can supply a separate direction for each key, such as increasing identifier and decreasing revision number.

Sorting does not remove duplicates, fill missing measurements, or choose which record is correct. Those remain separate decisions. Save the sorted result in another variable so the input order is still available. State how ties are handled whenever later code selects the first row; otherwise an apparently simple choice may depend on an unstated ordering assumption.

### Task 7 — Ordering short tidying tasks

1. Sort by increasing duration in minutes; break equal-duration ties by ascending Room.
2. Inspect complete rows to confirm each room stays with its own duration.

```matlab
Room = ["study"; "kitchen"; "study"; "hall"];
Minutes = [12; 5; 8; 5];
T = table(Room,Minutes);
ordered = sortrows(T,{'Minutes','Room'},{'ascend','ascend'});
disp(ordered)
```

**Check the result**

- The two five-minute tasks come first, with hall before kitchen.
- The original first record is still the twelve-minute study task.

**Try a change:** Change only the Minutes direction to descend and inspect where the tied tasks move.

## Computing counts and totals by group

A grouped summary combines records that share a chosen label. For example, several cleaning sessions in the same room can contribute to one total duration. `groupsummary` creates a table with one row per group. Specify both the grouping variable and the numeric variable to summarize so the intended question is explicit. A sum of Minutes becomes a result variable named `sum_Minutes`.

The result also contains `GroupCount`, which counts member rows. It does not sum an item-count column or measure elapsed time. Three records can describe twelve minutes, while two other records describe seven minutes. Read the variable names and units instead of treating every numeric result as interchangeable. Sort the result explicitly when a report needs a particular presentation order.

Clean labels and apply the missing-data policy before grouping. Otherwise inconsistent spelling can split one intended group, and absent measurements can make a total's coverage unclear. In these examples, grouping inputs have known labels and recorded numeric values. Check conservation: group row counts should add up to the number of cleaned records, and group sums should add up to the cleaned numeric total. These checks help catch accidental exclusions or double counting.

### Task 8 — Adding cleaning minutes by room

1. Summarize the five recorded sessions by Room.
2. Compare grouped counts with grouped minutes, then check the combined totals.

```matlab
Room = ["hall"; "desk"; "hall"; "desk"; "desk"];
Minutes = [4; 6; 3; 5; 1];
T = table(Room,Minutes);
summary = groupsummary(T,'Room','sum','Minutes');
summary = sortrows(summary,'Room');
disp(summary)
```

**Check the result**

- The desk group contains three sessions, and hall contains two.
- The total duration remains nineteen minutes after grouping.

**Try a change:** Add a zero-minute hall record and compare its effect on the count and the sum.

## Independent builds

### Build 1 — Produce a grocery-unit summary

Create a table from Id = [201;202;201;203;204;205], Category = [" Fruit ";"snack";"FRUIT";"fruit";"snack";"snack"], and Units = [3;NaN;3;2;4;-1]. Units counts objects, and -1 means unrecorded. Preserve the original as raw. Normalize Category by trimming edge whitespace and changing to lower case. Standardize the -1 marker, then retain the first row for each Id in first-seen order. Exclude rows missing Units. Produce a summary sorted by Category that reports record counts and total units. Store duplicateCount and missingUnitCount separately; make their stages clear so no row is counted as both exclusions. Check that the group totals agree with the cleaned table.

### Build 2 — Keep an unknown room visible

Use Room = [" hall ";"desk";"";"hall";"desk"] and Minutes = [5;NaN;7;3;2] to create raw. Keep raw unchanged. Normalize Room by trimming edge whitespace and changing to lower case. Treat empty text as a missing room label, count those labels in missingRoomCount, and replace them with the reporting label "unassigned". This label means the room was not recorded. Count missing durations in missingMinuteCount and exclude only those rows from the duration summary; never replace them with zero. Group the remaining rows by Room, reporting counts and total Minutes, then sort the summary by Room. Explain in one sentence why an unassigned room can contribute known minutes without claiming a known room.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [Access data in a table](https://www.mathworks.com/help/matlab/matlab_prog/access-data-in-a-table.html)
- [Standardize missing-value markers](https://www.mathworks.com/help/matlab/ref/standardizemissing.html)
- [Unique values and first-occurrence indices](https://www.mathworks.com/help/matlab/ref/double.unique.html)
- [Grouped summary tables](https://www.mathworks.com/help/matlab/ref/double.groupsummary.html)
