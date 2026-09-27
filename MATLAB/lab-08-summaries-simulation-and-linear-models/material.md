# MATLAB — Lab 08: Summaries, Simulation, and Linear Models

Use small data summaries and simple models to ask better questions about everyday measurements.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Choose descriptive summaries and state their units and dimensions.
- Repeat a random simulation while restoring its previous generator state.
- Fit and inspect a straight line with residuals.
- Evaluate predictions on observations kept separate from fitting.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Run each guided task independently with its supplied data.
- Missing values need an explicit policy; a missing observation is not zero.
- Simulations describe stated assumptions, and fitted trends do not establish causes.

## Center and Spread

A summary reduces many measurements to a few numbers, so choose those numbers according to the question. The mean balances the total across all observations. The median identifies the middle of the sorted values and is less affected by one unusually large value. Minimum and maximum describe the observed endpoints, while their difference gives the range. None of these numbers tells the whole story, and the range can change substantially when just one new observation is added.

Here each entry is the measured volume of one cup in milliliters. The larger serving raises the mean more than the median. That does not make the large value an error: it could represent a different cup size. Inspect the context before removing it. Report the sample count along with the summaries so the reader knows their support. Use explicit units in names and output. A mean in milliliters should not be compared directly with a value in liters, even if both variables happen to be stored as ordinary doubles.

### Task 1 — Describe a tray of drinks

1. Calculate center and range without deleting observations.
2. Compare the mean and median in the same units.

```matlab
volumeMl = [240;250;260;250;500];
count = numel(volumeMl);
meanMl = mean(volumeMl);
medianMl = median(volumeMl);
rangeMl = max(volumeMl)-min(volumeMl);
report = table(count,meanMl,medianMl,rangeMl);
disp(report);
```

**Check the result**

- The large serving affects the two measures of center differently.

**Try a change:** Replace 500 with 250 and explain which summaries change.

## Standard Deviation and Normalization

Standard deviation describes how far observations vary around their mean, expressed in the original measurement unit. Its calculation squares the deviations, so large deviations have a substantial influence. MATLAB offers two normalizations. For a vector with more than one element, std(x,0) divides the sum of squared deviations by N minus one before taking the square root. std(x,1) instead divides by N. State which convention you use when reporting a result.

The first convention is commonly used when measurements are treated as a sample from a broader process. The second can describe the spread of the complete finite collection in hand. Neither choice guarantees that a small or biased sample represents future events. The waiting times below are a tiny teaching example, not evidence about service performance. A standard deviation is also not the largest distance from the mean and not an error bound on every observation. Check the arithmetic on these three symmetric values, then compare the outputs while keeping their unit, minutes, visible.

### Task 2 — Compare waiting-time conventions

1. Calculate both conventions and the squared-deviation total.
2. Relate their denominators to the three observations.

```matlab
waitMin = [9;11;13];
centerMin = mean(waitMin);
sampleSD = std(waitMin,0);
collectionSD = std(waitMin,1);
squaredDeviations = sum((waitMin-centerMin).^2);
disp([sampleSD collectionSD]);
```

**Check the result**

- Both standard deviations have units of minutes.

**Try a change:** Add a fourth wait equal to the mean and recalculate.

## Summary Dimensions and Coverage

A matrix can hold several measurement series, but its orientation is part of the data meaning. Here rows are days and columns are two kitchen counters. A summary down dimension one produces one result for each column, answering a question about each counter across days. A summary across dimension two produces one result per row, answering a question about the daily observations instead. Write the dimension explicitly when it makes that distinction easier to see.

Missing values need a policy before aggregation. With omitnan, the mean uses only available numeric readings. Report the number of available readings beside each result rather than assuming equal coverage. A recorded zero remains a valid observation and belongs in that count. The missing measurement reduces the support for one counter while leaving the other intact. Comparing their means is possible, but the unequal support should remain visible. Shape checks are also valuable: a two-element row vector is expected for two counters, whereas three elements would indicate that the script summarized days instead.

### Task 3 — Summarize two kitchen counters

1. Compute column means and observed counts.
2. Compare the shape and meaning of the row means.

```matlab
counts = [4 8;6 NaN;8 12];
meanByCounter = mean(counts,1,'omitnan');
observedByCounter = sum(~isnan(counts),1);
meanByDay = mean(counts,2,'omitnan');
disp(meanByCounter);
disp(observedByCounter);
```

**Check the result**

- Counter and day summaries describe different groupings.

**Try a change:** Replace NaN with an observed zero and compare coverage and mean.

## Reproducible Random Sequences

Random numbers let a script explore a stated model many times, but debugging becomes difficult if every run changes all the inputs. A fixed generator and seed reproduce a sequence of draws. The seed identifies a starting state; it does not describe a physical measurement or guarantee a representative sample. Record model assumptions separately from the mechanism used to repeat them.

The example models a wait as a uniformly distributed value from two to six minutes. This is an explicit simplifying assumption, not a claim that real waits follow that distribution. rand supplies values between zero and one, and scaling plus shifting puts them in the chosen interval. Array size determines how many waits are generated. Save the prior random-generator state before setting the exercise seed and restore it afterward, so running the example does not alter later work. Resetting the same seed immediately before a second draw reproduces the first sequence. Drawing twice without resetting instead advances the sequence and produces a different batch. Reproducibility makes comparisons easier, but the model still needs justification.

### Task 4 — Replay a short queue simulation

1. Generate five waits with the stated seed and generator.
2. Replay the draw, then restore the previous state.

```matlab
previousState = rng;
rng(28,'twister');
waitA = 2+4*rand(5,1);
rng(28,'twister');
waitB = 2+4*rand(5,1);
rng(previousState);
replayed = isequal(waitA,waitB);
disp(waitA);
```

**Check the result**

- The two vectors agree because their generation steps agree.

**Try a change:** Change only the second seed and compare again.

## Variation Between Samples

A sample mean changes when a new sample is drawn. To see that variation, simulate many separate samples and summarize each one. Every row below is a separate imagined group of visitors; columns are individual waits within that group. Taking mean along dimension two produces one sample mean per group. The histogram describes those means, not individual waiting times.

Compare groups of four with groups of forty under the same independent uniform model. Larger groups usually produce means that vary less because individual high and low observations average together. This is a repeated-sampling pattern, not a promise that every larger group is closer to the model center than every smaller one. A particular simulation is finite, and another seed changes its details. The model center is four minutes because its uniform interval is symmetric from two to six. Identical histogram bins make the comparison interpretable. Neither histogram validates the assumed distribution against real queue data; that needs observations and a separate model check. Increasing the number of groups improves the simulation's description without changing each group's size.

### Task 5 — Compare group-average waits

1. Calculate one mean per simulated group.
2. Compare the histograms on identical bin edges.

```matlab
previousState = rng;
rng(36,'twister');
smallGroups = 2+4*rand(200,4);
largeGroups = 2+4*rand(200,40);
rng(previousState);
smallMeans = mean(smallGroups,2);
largeMeans = mean(largeGroups,2);
spread = [std(smallMeans,0) std(largeMeans,0)];
fig = figure;
ax = axes('Parent',fig);
h1 = histogram(ax,smallMeans,'BinEdges',2:0.2:6);
hold(ax,'on');
h2 = histogram(ax,largeMeans,'BinEdges',2:0.2:6);
xlabel(ax,'Group mean wait (minutes)');
ylabel(ax,'Number of simulated groups');
legend(ax,{'4 visitors','40 visitors'});
```

**Check the result**

- A distribution of means differs from a distribution of individual waits.

**Try a change:** Increase the number of groups while retaining their sizes.

## Straight-Line Least-Squares Fits

A straight-line model connects an input x to an approximate output y using a slope and intercept. The slope describes change in output per input unit. The intercept is the model output at zero input, which may lie outside the observed range and have no useful physical interpretation. Fitting a line does not establish that changing the input causes the output to change.

polyfit with degree one chooses coefficients that minimize the sum of squared vertical residuals for the supplied data. It returns the coefficient of x first and the constant term second. polyval evaluates the polynomial at selected inputs, keeping evaluation separate from coefficient estimation. Pair observations carefully and use matching vector shapes. Here the input is the number of small packages and the output is packing time in minutes. The sample is deliberately small so its calculations are easy to inspect. Predicting inside its range uses the fitted trend between observed inputs; predicting far beyond that range introduces an extrapolation assumption that these observations cannot verify. A numeric prediction alone does not indicate its practical reliability.

### Task 6 — Fit a packing-time trend

1. Fit a degree-one model to the paired observations.
2. Interpret slope units and evaluate the stated query.

```matlab
packages = [1;2;3;4];
minutesUsed = [4;7;8;11];
coeff = polyfit(packages,minutesUsed,1);
fitted = polyval(coeff,packages);
queryPackages = 2.5;
estimatedMin = polyval(coeff,queryPackages);
slope = coeff(1);
intercept = coeff(2);
disp(coeff);
```

**Check the result**

- The line need not pass through every observation.

**Try a change:** Evaluate at ten packages and discuss the weaker observational support.

## Residuals and Error Summaries

A residual is the observed output minus the model prediction. A positive residual means the model predicted too little; a negative residual means it predicted too much. Keep this sign convention consistent in calculations and plots. Looking only at an average signed residual is misleading because positive and negative errors can cancel even when each prediction is poor.

Mean absolute error averages residual magnitudes. Root mean squared error squares residuals, averages those squares, and takes a square root. Both have the output unit, but the squared-error measure gives larger errors more influence. Neither measure identifies why an error occurred. A residual plot can reveal structure concealed by a single number, such as a curved pattern across the input. Here errors are calculated on observations used for fitting. They describe that fit, not performance on new measurements. Keep the distinction visible in a report, and avoid choosing a complicated model solely because it reduces training errors. The zero line provides a visual reference for overprediction and underprediction; it does not mark an acceptable-error threshold for the application.

### Task 7 — Inspect a washing-time fit

1. Calculate residuals, MAE, and RMSE.
2. Plot residuals with a zero reference line.

```matlab
loads = [0;1;2;3];
minutesUsed = [2;4;5;9];
coeff = polyfit(loads,minutesUsed,1);
fitted = polyval(coeff,loads);
residual = minutesUsed-fitted;
mae = mean(abs(residual));
rmse = sqrt(mean(residual.^2));
fig = figure;
ax = axes('Parent',fig);
h = plot(ax,loads,residual,'o-');
yline(ax,0,':');
xlabel(ax,'Number of loads');
ylabel(ax,'Observed - fitted time (minutes)');
```

**Check the result**

- Signed errors can cancel while their magnitudes remain nonzero.

**Try a change:** Increase only the final measured time and compare MAE with RMSE.

## Held-Out Evaluation and Baselines

Evaluation data should remain separate from observations used to fit a model. Otherwise the error measures how closely the model reproduces information it already used. The split below is declared before fitting: four observations are training data, and two later observations are held out. This mimics using earlier records to estimate later work, although such a tiny example cannot establish dependable forecasting performance.

A simple baseline provides context. Here it always predicts the mean training time, without using package count. It is calculated from training data only, just like the line. Compare both methods on exactly the same held-out rows and in the same units. Do not refit coefficients with evaluation outcomes before calculating the evaluation score. Repeatedly changing a model after inspecting these outcomes would also weaken their independence. Report the number and range of evaluation observations, not just the winning error value. An apparent improvement on two rows is an observation about this exercise, not a guarantee about tomorrow's packages. Future data can differ from both the training and evaluation examples.

### Task 8 — Evaluate later packing jobs

1. Fit on training rows and evaluate held-out jobs.
2. Compare the line with a training-mean baseline.

```matlab
xTrain = [1;2;3;4];
yTrain = [3;5;7;9];
xTest = [5;6];
yTest = [12;12];
coeff = polyfit(xTrain,yTrain,1);
prediction = polyval(coeff,xTest);
baseline = repmat(mean(yTrain),size(yTest));
modelMAE = mean(abs(yTest-prediction));
baselineMAE = mean(abs(yTest-baseline));
report = table(xTest,yTest,prediction,baseline);
disp(report);
```

**Check the result**

- Both methods are scored on the same held-out observations.

**Try a change:** Change a test outcome without refitting and identify the unchanged quantities.

## Independent builds

### Build 1 — A drink-station summary

Rows represent four mornings and columns represent two refill stations. Use milliliter measurements [180 200;220 NaN;200 240;0 220]. Report observed counts, mean, median, and sample standard deviation by station, omitting NaN and retaining zero. Make a labeled bar chart of the means with a zero baseline. Explain the coverage difference and why the observed empty container remains in the data. Keep the original matrix.

### Build 2 — Bike-pump timing model

Training tire counts are [1;2;3;4] with minutes [4;6;8;10]. Reserve counts [2;5] and measured minutes [7;13] for evaluation. Fit a line and compare held-out MAE and RMSE with a constant training-mean baseline. Print inputs, observations, predictions, and residuals together. Plot training observations and the fitted line over the training range with units. Explain why the five-tire prediction is extrapolation and why two evaluation rows provide limited evidence.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [std: normalization and dimensions](https://www.mathworks.com/help/matlab/ref/double.std.html)
- [rng: seed and generator state](https://www.mathworks.com/help/matlab/ref/rng.html)
- [polyfit: polynomial coefficients](https://www.mathworks.com/help/matlab/ref/polyfit.html)
- [polyval: evaluating a fitted polynomial](https://www.mathworks.com/help/matlab/ref/polyval.html)
