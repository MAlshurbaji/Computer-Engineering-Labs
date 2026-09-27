# MATLAB — Lab 10: An Integrated Laundry Planning Project

Bring your MATLAB skills together to produce a clear, checkable laundry-room planning report.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Define project rows, units, validity rules, and outputs.
- Preserve raw records while importing, cleaning, and ordering observations.
- Evaluate a simple model and communicate its limits with tables and plots.
- Package reusable analysis steps and save a reproducible report.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Each guided task includes all its data and runs independently.
- A row describes one towel-folding session, with elapsed time in minutes.
- Training uses the first six valid chronological sessions; evaluation uses the remaining two.

## Project Questions and Data Contracts

A useful project begins with a question its data can answer. This project asks how recorded towel counts relate to folding time and how a simple model performs on two later sessions. It does not measure staff productivity, explain differences between people, or promise a schedule for every future session. Keeping the question narrow makes the required measurements and outputs easier to specify.

One row represents one session, with a string identifier, a full timestamp, a nonnegative whole towel count, and nonnegative elapsed minutes. Missing times are unknown observations; zero is a valid recorded value. A repeated identifier is a duplicate session record, and this project keeps its first occurrence. The supplied duplicate is exact. Conflicting duplicates would need investigation before adopting that rule elsewhere. Preserve the raw table so each cleaning choice can be traced to a row. Define the evaluation split before inspecting model errors: the first six valid chronological sessions train the model, and the next two evaluate it. Final outputs include coverage, a model comparison, a plot, and saved report files.

### Task 1 — Construct the session log

1. Construct the raw table without correcting it.
2. Identify row meaning, units, and problematic records.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
rawRows = height(raw);
variableNames = raw.Properties.VariableNames;
disp(raw);
```

**Check the result**

- Duplicate, missing, and invalid records require different decisions.

**Try a change:** Name an additional question that needs another measurement.

## Explicit Import and Round-Trip Checks

Moving data through a file tests whether the project's meaning survives outside the workspace. CSV is convenient for sharing a rectangular record, but its text representation does not preserve every MATLAB type. Treat importing as a deliberate conversion stage. Session identifiers remain strings, and date text is parsed with a stated format instead of asking the reader to guess its intended order.

This example creates a scratch folder, writes a copy of the raw table, and imports it with explicit types. A formatted text column carries timestamps through CSV; datetime reconstructs the time values afterward. The raw table is not modified. Check identifiers, timestamps, and numeric data after the round trip, including the missing-value location. Checking only row count would miss an incorrect conversion. The scratch variable names the output location, and fullfile forms the file path. A new directory per run avoids replacing earlier results and keeps the exercise independent of existing working-directory files. Verify values before cleaning so that an import defect cannot be mistaken for a problem already present in the supplied records.

### Task 2 — Round-trip the raw log through CSV

1. Write a timestamp-text copy to a new scratch folder.
2. Import explicit text types and reconstruct timestamps.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
scratch = tempname;
mkdir(scratch);
Time.Format = 'yyyy-MM-dd HH:mm';
TimeText = string(Time);
exported = table(Session,TimeText,Towels,Minutes);
csvPath = fullfile(scratch,'folding-raw.csv');
writetable(exported,csvPath);
opts = detectImportOptions(csvPath);
opts = setvartype(opts,{'Session','TimeText'},'string');
imported = readtable(csvPath,opts);
imported.Time = datetime(imported.TimeText,'InputFormat','yyyy-MM-dd HH:mm');
roundTrip = isequal(imported.Time,raw.Time) && isequaln(imported.Minutes,raw.Minutes);
disp(scratch);
```

**Check the result**

- The missing numeric observation remains missing after reading.

**Try a change:** Inspect the CSV text and compare its date representation with the datetime display.

## Cleaning Rules and Audit Counts

Cleaning is a sequence of decisions, not a command that makes data automatically correct. Apply the declared duplicate rule first, then validate retained records. unique returns indices for distinct identifiers; stable ordering retains their first appearances in source order. Indexing the complete table preserves relationships among identifiers, times, counts, and durations. A project needing the latest correction would require another policy, such as selecting the last occurrence after ordering revisions.

The validity mask rejects missing timestamps, nonfinite or negative numeric values, and fractional towel counts. It accepts measured zeros. Each condition corresponds to an explicit contract, without unexplained thresholds for discarding inconvenient observations. Sort valid complete rows by time after cleaning, then count how many rows each stage removed. These audit counts explain why the analysis contains fewer sessions than the input and distinguish duplicate removal from invalid-measurement removal. Keeping the raw table lets a reader revisit those rules without reconstructing the original data. A clean table is therefore a documented view of supplied records, not a replacement for their history. Inspect removed records whenever a count is unexpectedly large.

### Task 3 — Build an auditable clean table

1. Apply the first-identifier rule and validity conditions.
2. Sort retained rows and report removals by stage.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
[~,firstRow] = unique(raw.Session,'stable');
uniqueRows = raw(firstRow,:);
valid = ~isnat(uniqueRows.Time) & isfinite(uniqueRows.Towels) & uniqueRows.Towels>=0 & uniqueRows.Towels==floor(uniqueRows.Towels) & isfinite(uniqueRows.Minutes) & uniqueRows.Minutes>=0;
clean = sortrows(uniqueRows(valid,:),'Time');
duplicatesRemoved = height(raw)-height(uniqueRows);
invalidRemoved = height(uniqueRows)-height(clean);
retained = height(clean);
audit = table(duplicatesRemoved,invalidRemoved,retained);
disp(audit);
```

**Check the result**

- Eleven raw rows remain available while eight sessions support analysis.

**Try a change:** Set one valid Minutes entry to 0 and verify that the contract retains it.

## Descriptive Summaries Before Modeling

Before fitting, inspect what the retained data cover. Report the number of observations, the input and output ranges, and simple output summaries. These checks can reveal a mismatch between the intended question and the available evidence. A model intended for large laundry batches cannot be assessed from a few small ones, regardless of how neatly a line fits them.

This task summarizes eight retained sessions. Mean and median describe recorded folding minutes, while minimum and maximum expose their observed range. The chronological span describes when sessions occurred; it is not the sum of folding time. Separating those quantities prevents confusion between elapsed calendar time and accumulated work time. The plot uses actual session timestamps so the reader sees that later measurements form a separate part of the sequence. It is descriptive: no line in this plot is a forecast. Use the same cleaned records for every summary and state units instead of relying on memory. A summary can be numerically correct but answer a different question if its rows or its time interpretation change halfway through a report.

### Task 4 — Describe coverage and measured times

1. Calculate count, center, range, and calendar span.
2. Plot measured durations against timestamps.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
[~,firstRow] = unique(raw.Session,'stable');
uniqueRows = raw(firstRow,:);
valid = ~isnat(uniqueRows.Time) & isfinite(uniqueRows.Towels) & uniqueRows.Towels>=0 & uniqueRows.Towels==floor(uniqueRows.Towels) & isfinite(uniqueRows.Minutes) & uniqueRows.Minutes>=0;
clean = sortrows(uniqueRows(valid,:),'Time');
count = height(clean);
meanMin = mean(clean.Minutes);
medianMin = median(clean.Minutes);
rangeMin = [min(clean.Minutes) max(clean.Minutes)];
countRange = [min(clean.Towels) max(clean.Towels)];
spanDays = days(clean.Time(end)-clean.Time(1));
fig = figure;
ax = axes('Parent',fig);
h = plot(ax,clean.Time,clean.Minutes,'o-');
xlabel(ax,'Session date');
ylabel(ax,'Recorded folding time (minutes)');
```

**Check the result**

- Calendar span and accumulated work time answer different questions.

**Try a change:** Calculate total recorded folding minutes and contrast it with calendar span.

## Temporal Splits and Model Evaluation

The evaluation split is part of the project design. Here the first six valid sessions estimate a line, and the remaining two stay aside until predictions are ready. Sorting observations makes that rule reproducible. Keep the split fixed while calculating scores so that the comparison does not silently change between methods.

A training-mean baseline predicts the same time for every evaluated session. It provides a simple reference for judging whether the input-dependent line helps on these observations. Both predictors must be formed without evaluation outcomes and scored on the same rows. Calculate residuals as observed minus predicted time, then report MAE and RMSE in minutes. The later towel counts exceed the training range, so the exercise explicitly evaluates extrapolation over a small extension of that range. Even small errors would not justify estimates for arbitrarily large loads. With only two evaluation sessions, the result demonstrates a workflow rather than establishing strong evidence of future performance. Report the split, its row counts, and its input ranges beside the errors so that this limitation remains visible in the final output. For a planning table, NaN(size(requests)) creates unavailable estimates with the same shape as requests; fill only positions allowed by the declared range policy.

### Task 5 — Evaluate a time-based holdout

1. Fit only the six training sessions.
2. Compare held-out errors with the training-mean baseline.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
[~,firstRow] = unique(raw.Session,'stable');
uniqueRows = raw(firstRow,:);
valid = ~isnat(uniqueRows.Time) & isfinite(uniqueRows.Towels) & uniqueRows.Towels>=0 & uniqueRows.Towels==floor(uniqueRows.Towels) & isfinite(uniqueRows.Minutes) & uniqueRows.Minutes>=0;
clean = sortrows(uniqueRows(valid,:),'Time');
train = clean(1:6,:);
evaluation = clean(7:end,:);
coeff = polyfit(train.Towels,train.Minutes,1);
predicted = polyval(coeff,evaluation.Towels);
residual = evaluation.Minutes-predicted;
mae = mean(abs(residual));
rmse = sqrt(mean(residual.^2));
baselineMAE = mean(abs(evaluation.Minutes-mean(train.Minutes)));
evaluationReport = table(evaluation.Session,evaluation.Towels,evaluation.Minutes,predicted,residual,'VariableNames',{'Session','Towels','ObservedMin','PredictedMin','ResidualMin'});
disp(evaluationReport);
```

**Check the result**

- Both evaluation counts exceed the training range.

**Try a change:** Change an evaluation duration and identify the fitted quantities that should remain unchanged.

## Plots That Separate Evidence and Estimates

A project plot should make observed data and model outputs easy to distinguish. Training observations, evaluation observations, and evaluated predictions have different roles even on the same axes. Use separate markers and a legend naming those roles. Restrict the displayed fitted line to the training input range so its extent does not imply support across all possible towel counts.

A second panel shows held-out residuals against towel count. Its zero reference separates underprediction from overprediction, while the vertical unit states the size of each discrepancy. Two residual points are insufficient to diagnose a dependable pattern, but displaying them is more informative than reporting one average alone. A technically correct chart can still mislead through an unlabeled axis or an unclear distinction between measurement and estimate. Keep the numeric plot values available in the report so readers can inspect them without reading pixels. Handle variables also let a script verify that the plotted data are the intended arrays rather than stale results from another analysis. Check the input range as well as the plotted vertical values when reviewing the figure.

### Task 6 — Display evidence and held-out errors

1. Use distinct markers for observations and predictions.
2. Show held-out residuals with units and a zero reference.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
[~,firstRow] = unique(raw.Session,'stable');
uniqueRows = raw(firstRow,:);
valid = ~isnat(uniqueRows.Time) & isfinite(uniqueRows.Towels) & uniqueRows.Towels>=0 & uniqueRows.Towels==floor(uniqueRows.Towels) & isfinite(uniqueRows.Minutes) & uniqueRows.Minutes>=0;
clean = sortrows(uniqueRows(valid,:),'Time');
train = clean(1:6,:);
evaluation = clean(7:end,:);
coeff = polyfit(train.Towels,train.Minutes,1);
predicted = polyval(coeff,evaluation.Towels);
residual = evaluation.Minutes-predicted;
mae = mean(abs(residual));
rmse = sqrt(mean(residual.^2));
baselineMAE = mean(abs(evaluation.Minutes-mean(train.Minutes)));
fig = figure;
layout = tiledlayout(fig,1,2);
ax1 = nexttile(layout);
scatter(ax1,train.Towels,train.Minutes,'o');
hold(ax1,'on');
scatter(ax1,evaluation.Towels,evaluation.Minutes,'s');
predictionPoints = scatter(ax1,evaluation.Towels,predicted,'x');
fitCounts = linspace(min(train.Towels),max(train.Towels),40);
fitLine = plot(ax1,fitCounts,polyval(coeff,fitCounts));
xlabel(ax1,'Towels');
ylabel(ax1,'Folding time (minutes)');
legend(ax1,{'Training observed','Evaluation observed','Evaluation predicted','Fit over training range'},'Location','northwest');
ax2 = nexttile(layout);
errorPoints = stem(ax2,evaluation.Towels,residual);
yline(ax2,0,':');
xlabel(ax2,'Towels in evaluated session');
ylabel(ax2,'Observed - predicted (minutes)');
```

**Check the result**

- The line ends at the training boundaries; later predictions stay separately marked.

**Try a change:** Temporarily remove the legend and identify the lost distinctions.

## Reusable Functions and Input Validation

A reusable function needs a smaller, clearer responsibility than the entire project. The function below accepts ordered count and time vectors plus a declared training size. It validates them, fits the training portion, and returns coefficients and held-out results in a structure. It does not import files, guess units, choose a split, or decide how duplicates should be treated. Those choices remain visible in the calling script.

Validation prevents a plausible result from being calculated for inputs that violate the contract. Checks require real numeric paired vectors, finite nonnegative values, whole towel counts, at least two training rows, varying training inputs, and a nonempty evaluation set. Converting accepted vectors to columns gives the calculation consistent shapes. A failed assertion raises an error rather than inventing a replacement result. The deliberate invalid calls are caught only to demonstrate that guards work; ordinary project code should address invalid data before retrying. For MATLAB R2022b, place all executable script statements before the local function definition. Copy the entire example, including the function at the end, into one script so its caller can access it.

### Task 7 — Package the fitting step

1. Call the function with the cleaned chronological data.
2. Confirm that negative-time and complex-time calls are rejected.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
[~,firstRow] = unique(raw.Session,'stable');
uniqueRows = raw(firstRow,:);
valid = ~isnat(uniqueRows.Time) & isfinite(uniqueRows.Towels) & uniqueRows.Towels>=0 & uniqueRows.Towels==floor(uniqueRows.Towels) & isfinite(uniqueRows.Minutes) & uniqueRows.Minutes>=0;
clean = sortrows(uniqueRows(valid,:),'Time');
result = foldingModel(clean.Towels,clean.Minutes,6);
rejected = false;
try
    foldingModel([1;2;3],[4;-1;6],2);
catch
    rejected = true;
end
complexRejected = false;
try
    foldingModel([1;2;3],[4;5+1i;6],2);
catch
    complexRejected = true;
end
disp(result);
function result = foldingModel(towels,minutesUsed,trainCount)
assert(isnumeric(towels) && isreal(towels) && isnumeric(minutesUsed) && isreal(minutesUsed),'Counts and times must be real numeric arrays.');
assert(isnumeric(trainCount) && isreal(trainCount),'Training size must be real and numeric.');
assert(isvector(towels) && isvector(minutesUsed),'Inputs must be vectors.');
towels = towels(:);
minutesUsed = minutesUsed(:);
assert(numel(towels)==numel(minutesUsed),'Input lengths must match.');
assert(all(isfinite(towels) & towels>=0 & towels==floor(towels)),'Counts must be nonnegative whole values.');
assert(all(isfinite(minutesUsed) & minutesUsed>=0),'Times must be finite and nonnegative.');
assert(isscalar(trainCount) && trainCount==floor(trainCount) && trainCount>=2 && trainCount<numel(towels),'A nonempty evaluation set is required.');
assert(numel(unique(towels(1:trainCount)))>=2,'Training inputs must vary.');
result.coeff = polyfit(towels(1:trainCount),minutesUsed(1:trainCount),1);
result.predicted = polyval(result.coeff,towels(trainCount+1:end));
result.residual = minutesUsed(trainCount+1:end)-result.predicted;
result.mae = mean(abs(result.residual));
result.rmse = sqrt(mean(result.residual.^2));
end
```

**Check the result**

- The result structure keeps coefficients and evaluated errors together.

**Try a change:** Try equal training counts and explain why varying input values are required.

## Reports, Provenance, and Saved Results

A finished report should let another reader understand its conclusion and how it was obtained. Include training and evaluation counts, the fitting input range, model coefficients, evaluation errors, and cleaning rules. Omitting these details can make an error of one minute appear much more general than its supporting evidence allows.

Save a plain table for convenient inspection and a MAT archive for continuing the MATLAB analysis. Both outputs belong in a fresh scratch folder. The CSV contains observations, predictions, and residuals, not merely a final score. The MAT file also preserves raw and cleaned records and an explicit settings structure. Loading into a structure makes verification deliberate and avoids introducing saved names directly into the workspace. A round-trip comparison checks that reported values survive writing and reading. Printing the output directory connects the visible summary to its saved evidence. This final stage should communicate the same units, split, and limitations as the calculation. The report is ready to review when its numbers can be traced to the supplied rows and its interpretation stays within the question originally posed.

### Task 8 — Save a reproducible report

1. Save the report and its supporting project information.
2. Reload the archive and compare report values.

```matlab
Session = ["F01";"F02";"F03";"F04";"F05";"F06";"F07";"F08";"F08";"F09";"F10"];
Time = datetime(2026,11,1,9,0,0)+days([0;1;2;3;4;5;6;7;7;8;9]);
Towels = [4;6;8;10;12;14;16;18;18;20;22];
Minutes = [6;8;10;12;14;16;19;19;19;NaN;-2];
raw = table(Session,Time,Towels,Minutes);
[~,firstRow] = unique(raw.Session,'stable');
uniqueRows = raw(firstRow,:);
valid = ~isnat(uniqueRows.Time) & isfinite(uniqueRows.Towels) & uniqueRows.Towels>=0 & uniqueRows.Towels==floor(uniqueRows.Towels) & isfinite(uniqueRows.Minutes) & uniqueRows.Minutes>=0;
clean = sortrows(uniqueRows(valid,:),'Time');
train = clean(1:6,:);
evaluation = clean(7:end,:);
coeff = polyfit(train.Towels,train.Minutes,1);
predicted = polyval(coeff,evaluation.Towels);
residual = evaluation.Minutes-predicted;
mae = mean(abs(residual));
rmse = sqrt(mean(residual.^2));
baselineMAE = mean(abs(evaluation.Minutes-mean(train.Minutes)));
report = table(evaluation.Session,evaluation.Towels,evaluation.Minutes,predicted,residual,'VariableNames',{'Session','Towels','ObservedMin','PredictedMin','ResidualMin'});
settings = struct('TrainingRows',6,'EvaluationRows',2,'TimeUnit','minutes','DuplicateRule','first identifier','TrainingCountRange',[4 14]);
metrics = table(mae,rmse,baselineMAE);
scratch = tempname;
mkdir(scratch);
csvPath = fullfile(scratch,'evaluation.csv');
matPath = fullfile(scratch,'folding-project.mat');
writetable(report,csvPath);
save(matPath,'raw','clean','coeff','report','metrics','settings');
archive = load(matPath);
roundTrip = isequaln(archive.report,report) && isequaln(archive.metrics,metrics);
fprintf('Evaluation: %d sessions; MAE %.2f min; baseline MAE %.2f min.\n',height(report),mae,baselineMAE);
disp(scratch);
```

**Check the result**

- The archive retains both raw evidence and the cleaned analysis.

**Try a change:** Add the evaluation date range to settings while keeping the model unchanged.

## Independent builds

### Build 1 — Complete a second laundry shift

Create nine sessions D01 through D09 on consecutive days from 1 December 2026 at 10:00. Towel counts are [3;5;7;9;11;13;15;17;19] and minutes [5;7;9;11;13;15;18;18;NaN]. Write and import a CSV in a fresh folder, preserving identifiers as strings. Reject invalid durations without replacing them with zero. Fit using the first six valid chronological sessions and evaluate on the final two. Report coverage, predictions, residuals, MAE, RMSE, and training-mean baseline MAE. Save a MAT archive and plot observed and predicted evaluation times with units. State the training range and extrapolation limitation.

### Build 2 — A cautious planning interface

Use this lesson's original F01-F10 log, cleaning rules, and six-row training split. After evaluating the fitted line, consider proposed counts [0;8;15;24]. Produce a planning table with count, in-training-range flag, and estimated minutes. Permit estimates only if held-out MAE is at most 2 minutes and the proposed count lies within the inclusive training range. Store NaN for unsupported estimates, including valid zero-count requests outside that range. Save planning.csv in a fresh folder. Distinguish an unavailable estimate from a measured zero, and explain why this policy does not make the model certain.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [readtable: controlled table import](https://www.mathworks.com/help/matlab/ref/readtable.html)
- [writetable: saving table reports](https://www.mathworks.com/help/matlab/ref/writetable.html)
- [polyfit: fitting coefficients](https://www.mathworks.com/help/matlab/ref/polyfit.html)
- [Local functions in scripts](https://www.mathworks.com/help/matlab/matlab_prog/local-functions-in-scripts.html)
