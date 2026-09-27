# MATLAB — Lab 07: Files and Time-Based Data

Turn small everyday logs into reliable files and time-based summaries.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Write and read CSV and MAT files in a fresh scratch folder.
- Preserve identifiers and parse date text using explicit types and formats.
- Sort complete observations and calculate elapsed time.
- Build regular timetables while keeping missing observations separate from measured zeros.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Run each guided task as its own script; all required data are included.
- Every file-writing task creates a new temporary folder; inspect scratch for its path. These are disposable practice outputs.
- Times in this lab are local clock readings without time zones; no daylight-saving transitions are modeled.

## CSV Tables and File Paths

A file makes the results of a script available after MATLAB closes. Before saving, decide what one row represents and put the unit in each measurement name. Here a row is one shelf inspection, and the measurement is a count of available jars. A CSV file stores a rectangular text representation that many programs can open. It does not preserve every MATLAB property, so reading it back is part of the workflow, not an optional afterthought.

Use a fresh scratch directory for each run. The path returned by tempname is a proposed new location; mkdir creates it. fullfile joins that location with a filename without assuming a particular path separator. Keeping the destination explicit prevents a script from quietly writing into whichever directory happens to be current. After writing, inspect the imported table, its variable names, and its number of rows. Matching dimensions are useful, but also compare the values: a file can have the correct size while containing the wrong observations.

### Task 1 — Save a shelf inspection

1. Create the three-row table and write it into a fresh folder.
2. Read the file back and compare the shelf and jar columns.

```matlab
scratch = tempname;
mkdir(scratch);
Shelf = [1;2;3];
Jars = [6;0;9];
stock = table(Shelf,Jars);
csvPath = fullfile(scratch,'shelf.csv');
writetable(stock,csvPath);
restored = readtable(csvPath);
disp(scratch);
disp(restored);
```

**Check the result**

- The zero is retained as a measured empty shelf.
- The printed directory identifies this run's output.

**Try a change:** Add a fourth shelf and check that both the in-memory and imported tables gain one row.

## Explicit Import Types

An identifier can look numeric without representing a quantity. Locker 007 is a label; it is not seven items. If an importer treats that label as a number, the leading zeros disappear and cannot be recovered without a separate formatting rule. Decide the intended meaning before importing. A table can hold string labels beside numeric measurements, so there is no need to force every column into one numeric matrix.

An import-options object separates these decisions from the act of reading. detectImportOptions examines the file, and setvartype changes a selected variable to the intended type. The options are then passed to readtable. This is especially useful when a sample happens to contain only digits but future identifiers may also contain letters. Check a representative value and its class after importing. Do not convert an identifier with str2double merely to simplify comparisons; string equality already supports selecting a named record. Explicit types document what a column means and help keep its interpretation stable across repeated runs.

### Task 2 — Keep locker labels intact

1. Write the labels exactly as supplied.
2. Override the Locker import type, then select locker 042.

```matlab
scratch = tempname;
mkdir(scratch);
Locker = ["007";"042";"105"];
Minutes = [12;8;15];
visits = table(Locker,Minutes);
csvPath = fullfile(scratch,'lockers.csv');
writetable(visits,csvPath);
opts = detectImportOptions(csvPath);
opts = setvartype(opts,'Locker','string');
imported = readtable(csvPath,opts);
selected = imported(imported.Locker == "042",:);
disp(selected);
```

**Check the result**

- The label 007 keeps all three characters.

**Try a change:** Replace one label with A07 and confirm that the same import contract still applies.

## MAT Files and Named Variables

CSV is useful for exchanging simple tables, but it is not a complete record of MATLAB values. A MAT file can preserve an array or table in its MATLAB representation, including numeric missing values. Use it when continuing a MATLAB analysis is the main purpose of the saved file. Choose the variables deliberately: saving an entire workspace can collect unrelated intermediate results and make it unclear which values belong to the report.

The save call below names just the two variables to retain. Loading into a structure gives those variables an explicit container. Accessing archive.counts is clearer than relying on load to introduce names directly into the workspace, where they might replace variables already in use. The structure also makes it easy to see what the file contains. Comparing data with missing numeric entries requires care: NaN is not equal to itself under ordinary equality. isequaln is appropriate for a round-trip check when matching missing locations are an intended part of the saved result.

### Task 3 — Archive a short watering record

1. Save only the count vector and its unit label.
2. Load into a structure and compare both values and missing locations.

```matlab
scratch = tempname;
mkdir(scratch);
counts = [2;NaN;0;3];
unit = "watering visits";
matPath = fullfile(scratch,'watering.mat');
save(matPath,'counts','unit');
archive = load(matPath,'counts','unit');
sameValues = isequaln(archive.counts,counts);
disp(archive);
```

**Check the result**

- The unknown second observation stays NaN; the observed third count stays zero.

**Try a change:** Add a note variable to the workspace without naming it in save, then inspect the fields loaded from the file.

## Datetime Parsing and Display

A timestamp is a point on a calendar and clock. Plain text can display a timestamp but does not automatically provide reliable calendar arithmetic. Convert text to datetime before sorting it or measuring elapsed time. Write the input format explicitly, because a date such as 04/05 can otherwise be interpreted in more than one way. Uppercase MM represents the month, while lowercase mm represents minutes in the format used here. These symbols have different jobs even though they look similar.

InputFormat explains how to read the source text. Format controls how an existing datetime is displayed; changing that property does not move the recorded event. Keeping those two purposes separate helps avoid apparent corrections that only change presentation. The example uses a full year, month, day, and 24-hour clock to avoid ambiguity. Each timestamp is a local clock value with no time-zone conversion. For a real log spanning regions or daylight-saving changes, the time-zone policy would need to be part of the data contract before calculating elapsed time.

### Task 4 — Read pickup timestamps

1. Parse both full timestamps with the stated input format.
2. Change only their displayed format and inspect the minute component.

```matlab
textTime = ["2026-10-04 09:05";"2026-10-04 10:20"];
Time = datetime(textTime,'InputFormat','yyyy-MM-dd HH:mm');
original = Time;
Time.Format = 'dd-MMM-yyyy HH:mm';
unchanged = isequal(Time,original);
minuteOfHour = minute(Time);
disp(Time);
```

**Check the result**

- The display changes, but both underlying datetime values remain equal to the originals.

**Try a change:** Display seconds as well, without changing the input text.

## Durations and Elapsed Time

Subtracting two datetime values produces a duration, which describes elapsed clock time. That result is different from a timestamp: twelve minutes is an interval, while 09:12 on a particular date is a point in time. Convert a duration to numeric minutes or hours only when a calculation needs that unit. Use a variable name such as elapsedMin to keep the choice visible later in the script.

The date matters when an activity crosses midnight. Subtracting only the clock-hour numbers would make a late-evening start and next-day finish appear negative. Full timestamps retain the day boundary. Vector subtraction also requires correctly paired rows: row one must describe the start and finish of the same session. The example therefore uses equally sized column vectors and checks for negative durations before summarizing them. A nonnegative result is necessary, but it does not prove a log is correct; the values should also be plausible for the activity. This small validation step is a useful habit before converting durations into costs, speeds, or daily totals.

### Task 5 — Measure overnight charging sessions

1. Calculate one elapsed duration per paired session.
2. Convert to minutes and total the valid intervals.

```matlab
startTime = datetime(["2026-10-04 23:50";"2026-10-05 08:10"],'InputFormat','yyyy-MM-dd HH:mm');
finishTime = datetime(["2026-10-05 00:25";"2026-10-05 09:00"],'InputFormat','yyyy-MM-dd HH:mm');
elapsed = finishTime-startTime;
elapsedMin = minutes(elapsed);
validOrder = all(elapsedMin >= 0);
totalMin = sum(elapsedMin);
disp(elapsedMin);
```

**Check the result**

- The midnight-crossing session is a positive interval.

**Try a change:** Move the second finish to 08:10 and examine the zero-length boundary.

## Sorting Complete Observations

Time-based summaries usually need chronological order, but a timestamp never travels alone. It belongs to the value, location, or identifier recorded in the same row. Sorting the time vector separately from the measured values breaks those relationships and can produce a convincing but false trend. Put the observations in one table and sort the whole table by its Time variable. The associated values then move together.

After sorting, diff applied to datetime values produces the intervals between neighboring rows. The result has one fewer element than the input because each interval joins two observations. A zero interval indicates repeated timestamps; a negative interval indicates that the sequence is not increasing. Neither duplicates nor irregular spacing should be silently repaired without deciding what the records mean. In this example the three readings are distinct observations of available umbrellas. The time gaps describe the sampling schedule, not how long each count remained true. Treating each count as valid throughout the following gap would be an additional assumption that this task does not make.

### Task 6 — Order an umbrella rack log

1. Sort the complete table by Time.
2. Inspect the gaps between the sorted observations.

```matlab
Time = datetime(2026,10,6,9,0,0)+minutes([40;0;15]);
Umbrellas = [3;8;5];
logTable = table(Time,Umbrellas);
ordered = sortrows(logTable,'Time');
gapsMin = minutes(diff(ordered.Time));
strictlyIncreasing = all(gapsMin > 0);
disp(ordered);
```

**Check the result**

- Umbrella counts remain attached to their original times.

**Try a change:** Give the last two records the same timestamp and inspect the zero gap; decide what extra information would be needed to combine them.

## Timetables and Missing Time Slots

A timetable associates rows with datetime or duration values directly. Its row times describe when each observation occurred, while its variables contain measurements. An irregular log may skip some expected times. A regular display can make those gaps easier to see, but creating a row is not the same as creating an observation. Use a missing value when no measurement was recorded.

The newTimes vector below states the exact requested grid, including both endpoints. With fillwithmissing, retime copies values at matching times and places a missing numeric marker in unmatched slots. It does not estimate intermediate measurements. A recorded zero remains a zero, so an empty rack and an unobserved rack stay distinguishable. This distinction affects every later summary: replacing missing counts with zero would lower an average and claim that a measurement took place. The grid must be sorted and unique. The source times here are also sorted and unique, avoiding any question about which duplicate record should be used. Inspect both the resulting values and the missing mask before using the regularized log.

### Task 7 — Expose a missed bottle count

1. Build the irregular timetable and the exact ten-minute grid.
2. Compare the missing-slot mask with the measured-zero mask.

```matlab
t0 = datetime(2026,10,7,12,0,0);
Time = t0+minutes([0;20;30]);
Bottles = [5;0;4];
logTT = timetable(Time,Bottles);
newTimes = t0+minutes((0:10:30)');
regular = retime(logTT,newTimes,'fillwithmissing');
missingSlot = ismissing(regular.Bottles);
measuredEmpty = regular.Bottles == 0;
disp(regular);
```

**Check the result**

- The absent 12:10 reading and the recorded zero at 12:20 remain different.

**Try a change:** Extend the grid to 12:40 and identify the additional unobserved slot.

## Aggregation and Observation Coverage

A daily mean answers a question about the available readings in each day. It does not automatically describe every moment in that day, especially when observations are sparse or unevenly spaced. State what was averaged and report how many measurements supported it. A mean based on one recorded visit deserves a different interpretation from a mean based on many visits, even if the two numeric results match.

The mean aggregation used by retime omits missing measurements. To retain visibility of that omission, create a second numeric variable that is one for an observed value and zero for a missing value, then sum it over the same daily bins. An observed zero contributes to the count; NaN does not. Joining those two results gives a mean and coverage side by side. The supplied records include a whole day with no usable count, so its mean stays missing and its observed count is zero. The daily bins use their left edge, midnight, as the label. These are observation-based means, not time-weighted averages or complete daily inventories.

### Task 8 — Summarize daily bike rack checks

1. Aggregate the readings and the observation indicators separately.
2. Combine their daily results and inspect the unsupported day.

```matlab
Time = datetime(2026,10,8)+hours([9;15;33;57]);
Bikes = [0;4;NaN;8];
logTT = timetable(Time,Bikes);
Observed = double(~ismissing(Bikes));
coverageTT = timetable(Time,Observed);
dailyMean = retime(logTT,'daily','mean');
dailyCount = retime(coverageTT,'daily','sum');
summaryTT = [dailyMean dailyCount];
disp(summaryTT);
```

**Check the result**

- A recorded zero participates in both the mean and the coverage count.

**Try a change:** Add a second observed reading on the third day and compare its mean and coverage.

## Independent builds

### Build 1 — Library trolley log

Create a table from labels ["03";"11";"20"] and returned-book counts [0;7;4]. Write it to trolley.csv in a newly created tempname folder. Import Labels explicitly as string, retain the leading zero, and produce a table containing only positive counts. Save that filtered table and the unit label "books" in a MAT file in the same scratch folder. Load into a structure and verify the filtered rows and unit. Print the scratch path and a brief statement of what a zero means in this record.

### Build 2 — Pet feeder observation report

At 08:00 on 12 October 2026, observations are expected every 15 minutes through 09:00. Supplied offsets in minutes are [45;0;60;15] and bowl masses in grams are [0;80;60;50]. Sort paired records, create a timetable, and use the complete expected grid without estimating absent masses. Produce a report with the number of observed slots, the number of recorded empty bowls, and the mean of observed masses. Explain why the missing 08:30 slot cannot be counted as an empty bowl. Save the timetable and report to a MAT file in a fresh scratch folder.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [readtable: tables and import options](https://www.mathworks.com/help/matlab/ref/readtable.html)
- [datetime: parsing and display formats](https://www.mathworks.com/help/matlab/ref/datetime.html)
- [load: loading into a structure](https://www.mathworks.com/help/matlab/ref/load.html)
- [retime: missing slots and aggregation](https://www.mathworks.com/help/matlab/ref/timetable.retime.html)
