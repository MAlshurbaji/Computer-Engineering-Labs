# MATLAB — Lab 09: Numerical Methods and Reliability

Connect numerical calculations to measurements you can interpret and check.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Interpolate within an observed range and identify unsupported queries.
- Integrate rates and estimate interval rates with consistent units.
- Find a bracketed root and verify its residual.
- Solve linear systems and distinguish a small residual from sensitivity to input changes.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Run each guided task independently. Supplied models are teaching approximations with stated domains.
- Keep units explicit and compare floating-point results using tolerances.
- All examples use base MATLAB; no symbolic or optimization tools are needed.

## Linear Interpolation

Interpolation estimates a value between recorded input locations. Linear interpolation joins each neighboring pair of observations with a straight segment. It uses the two endpoints of the segment containing a query, so unequal spacing between observations is allowed. In this lesson, input positions are strictly increasing and each position has exactly one measured value. Sorting positions without moving their paired measurements would change the meaning of the data.

The example records water temperature at three elapsed times. An estimate halfway through a ten-minute interval is halfway between that interval's endpoint temperatures. A query in a different interval uses a different slope. This is a local approximation, not evidence that the water actually changed at a constant rate between measurements. A denser set of query points makes the drawn line smoother without adding new observations. Keep the original samples visible alongside the estimated curve so that the distinction remains clear. The function output follows the query array's shape here; using column vectors throughout makes matching queries and estimates straightforward in a table or later calculation.

### Task 1 — Estimate water temperature between checks

1. Interpolate at the two requested times.
2. Plot observations and estimates with distinct markers.

```matlab
timeMin = [0;10;30];
tempC = [20;30;26];
queryMin = [5;20];
estimateC = interp1(timeMin,tempC,queryMin,'linear');
fig = figure;
ax = axes('Parent',fig);
plot(ax,timeMin,tempC,'o-');
hold(ax,'on');
h = scatter(ax,queryMin,estimateC);
xlabel(ax,'Elapsed time (minutes)');
ylabel(ax,'Water temperature (degrees C)');
```

**Check the result**

- The two query points use different neighboring pairs.

**Try a change:** Move the first query from 5 to 8 minutes and inspect the estimate.

## Domain Boundaries and Unsupported Queries

An interpolation method has an observed domain, from the first input location to the last. A query outside that domain asks a different question: how should the pattern continue beyond the data? That is extrapolation, and its answer depends on an additional modeling assumption. Do not silently introduce that assumption merely because a plotting grid extends beyond the observations.

For linear interp1 without an extrapolation argument, out-of-range queries return NaN. This is useful because unsupported results remain visible instead of becoming plausible-looking numbers. Endpoints themselves are supported and reproduce their recorded values. Build an explicit in-range mask if a later report needs to distinguish why a value is missing. In this example all source measurements are present, so missing query results mean outside the domain. With missing source measurements, that simple interpretation would need revision. Keep the boundary inclusive on both sides, and inspect the exact endpoints as well as one point beyond each end. Boundary checks often reveal mistakes that are invisible when testing only comfortable interior queries.

### Task 2 — Respect the range of a shelf measurement

1. Evaluate interior, endpoint, and outside queries.
2. Compare the range mask with the returned missing values.

```matlab
positionCm = [0;40;100];
heightCm = [12;16;10];
queryCm = [-5;0;70;100;105];
inside = queryCm>=positionCm(1) & queryCm<=positionCm(end);
estimateCm = interp1(positionCm,heightCm,queryCm,'linear');
report = table(queryCm,inside,estimateCm);
disp(report);
```

**Check the result**

- Both endpoints are supported; the two outside queries remain missing.

**Try a change:** Choose a query exactly 40 cm and compare it with the original measurement.

## Trapezoidal Integration of Measurements

Integration accumulates a rate over an interval. If a tap's flow is measured in liters per minute and time is measured in minutes, the accumulated area has units of liters. Multiplying every sample by the same step works only for a particular sampling rule and regular spacing. Supplying the actual time coordinates to trapz makes the interval widths explicit, including unequal gaps.

The trapezoidal rule treats the rate as changing linearly between each neighboring pair. Each interval contributes its width multiplied by the average of its endpoint rates. Summing those pieces estimates the total volume. This assumption is a model of what happened between measurements; a brief unrecorded spike would not be recovered by the calculation. The first and last timestamps delimit the estimated accumulation, so do not interpret the result as a whole-day total unless those are the intended boundaries. Check that time is increasing before integrating. Reversing the order reverses the sign mathematically, but a negative poured volume would usually signal a data-order mistake in this application.

### Task 3 — Estimate water poured from sampled flow

1. Integrate using the actual observation times.
2. Calculate each trapezoid separately and compare their sum.

```matlab
timeMin = [0;2;5];
flowLpm = [1;3;2];
assert(all(diff(timeMin)>0),'Times must increase.');
volumeL = trapz(timeMin,flowLpm);
piecesL = diff(timeMin).*(flowLpm(1:end-1)+flowLpm(2:end))/2;
disp(volumeL);
```

**Check the result**

- The two intervals have different widths.

**Try a change:** Double all time coordinates while retaining rates and explain the change in units and volume.

## Integrating a Rate Function

Sometimes a task supplies a mathematical rate model rather than a collection of samples. integral evaluates such a function over stated bounds using numerical quadrature. An anonymous function keeps the model next to the calculation. Its expression should accept vector inputs because the integrator may evaluate several positions together. Use element-wise powers, multiplication, and division wherever the formula acts independently on those positions.

The example describes a dispenser whose modeled flow increases linearly during its first four minutes. This is a supplied approximation on a finite interval, not a physical rule to extend indefinitely. The result has liters as its unit because the modeled rate is liters per minute. A separate trapezoidal calculation on a curved function demonstrates that sample spacing can affect an estimate; refining a grid gives more information about that chosen function, but does not improve the truth of the model itself. Requested numerical tolerances control the integration calculation, not uncertainty in measured inputs. Always distinguish agreement with a mathematical model from agreement with the real dispenser.

### Task 4 — Accumulate a modeled dispenser flow

1. Integrate the dispenser model on its stated domain.
2. Compare coarse and fine trapezoids against a curved-function integral.

```matlab
flow = @(t) 2+0.5.*t;
volumeL = integral(flow,0,4,'AbsTol',1e-10,'RelTol',1e-10);
curved = @(t) 1+t.^2;
coarseTime = [0 1 2];
fineTime = 0:0.1:2;
coarseArea = trapz(coarseTime,curved(coarseTime));
fineArea = trapz(fineTime,curved(fineTime));
modelArea = integral(curved,0,2);
```

**Check the result**

- Smaller intervals reduce the discretization error for this smooth example.

**Try a change:** Halve the fine-grid step and compare the remaining discrepancy.

## Finite Differences and Interval Rates

A finite difference estimates change between measurements. Dividing the change in an accumulated quantity by the change in time gives an average rate over that interval. The result belongs to the interval, not automatically to either endpoint. A midpoint is a useful plotting location as long as the graph is labeled as an interval-average estimate rather than an exact instantaneous rate.

Here a small delivery cart's cumulative distance is recorded at irregular times. diff(distance) and diff(time) both have one fewer element than their inputs, and element-wise division pairs corresponding intervals. Dividing by a single assumed time step would be wrong because the gaps differ. Keep the distance and time units consistent to obtain meters per second. Positive time gaps are required; a repeated timestamp would create division by zero. Differencing can amplify measurement noise, especially across very short intervals, so a fluctuating rate does not necessarily prove abrupt physical changes. Inspect the original cumulative measurements alongside the derived rates, and retain the interval boundaries when reporting a notable change.

### Task 5 — Estimate a cart's interval speeds

1. Compute one average speed per time interval.
2. Place each result at its interval midpoint.

```matlab
timeSec = [0;2;5;9];
distanceM = [0;3;9;13];
dt = diff(timeSec);
assert(all(dt>0),'Times must increase.');
speedMps = diff(distanceM)./dt;
midSec = (timeSec(1:end-1)+timeSec(2:end))/2;
report = table(midSec,speedMps);
disp(report);
```

**Check the result**

- Four position readings produce three interval speeds.

**Try a change:** Shorten only the first time gap and explain which derived rate changes.

## Bracketed Roots and Residual Checks

A root is an input where a function equals zero. To find when a modeled temperature reaches a target, subtract the target from the temperature model and solve for the zero of that difference. The root then has time units, while the function value at the root has temperature units. These are different quantities and need different tolerances if both are checked.

A two-endpoint bracket gives fzero a bounded interval whose function values have opposite signs. For a continuous function, this sign change supports the existence of at least one crossing. A sign change across a discontinuity would not justify that conclusion, and an interval containing several crossings would not specify which crossing the application wants. The supplied cooling model is continuous and strictly decreasing, so its bracket contains one target crossing. Verify the returned residual instead of trusting the displayed digits alone. The bracket also keeps the search within the stated useful time domain. A target that is never reached in that domain requires a different outcome, not an unbounded search or a fabricated time.

### Task 6 — Find a modeled cooling time

1. Form the target residual and verify the bracket.
2. Solve and inspect both the time and remaining temperature difference.

```matlab
temperature = @(t) 20+60.*exp(-t./10);
residualFunction = @(t) temperature(t)-35;
bracket = [0 30];
assert(residualFunction(bracket(1))*residualFunction(bracket(2))<0,'A sign change is required.');
[timeMin,residual,exitflag] = fzero(residualFunction,bracket);
```

**Check the result**

- The solution lies inside the stated interval.

**Try a change:** Raise the target to 90 degrees C and inspect the bracket signs before attempting a solve.

## Linear Systems and Backslash

Several measurements can constrain the same unknown quantities. Write one equation per measurement and place the coefficients in a matrix. In A*x=b, columns of A correspond to unknowns in x, and rows correspond to equations in b. Decide that ordering before constructing arrays; a numerically successful solve with swapped meanings still answers the wrong question.

The example uses two differently sized scoops for craft paint. Two blue scoops plus one yellow scoop contain 280 mL, while one blue scoop plus three yellow scoops contain 390 mL. The unknowns are the volume of each scoop, not the color quantities in a new mixture. Backslash solves the linear system directly without requiring an explicit inverse. After solving, multiply A*x and compare it with the recorded totals. This residual checks whether the proposed volumes satisfy the equations to numerical tolerance. Also check application constraints such as nonnegative volume. A small residual does not establish that the measurements are accurate or that the chosen two-equation model captures the real process; it verifies consistency with the supplied equations.

### Task 7 — Recover two scoop volumes

1. Define columns as blue-scoop and yellow-scoop volume.
2. Solve and check both equation residuals and nonnegative values.

```matlab
A = [2 1;1 3];
b = [280;390];
volumeMl = A\b;
residual = A*volumeMl-b;
maxResidual = norm(residual,Inf);
physical = all(volumeMl>=0);
disp(volumeMl);
```

**Check the result**

- The result contains two unknown volumes, one per matrix column.

**Try a change:** Change the second total and predict which equations must still be checked.

## Tolerances and Sensitivity

Floating-point calculations approximate real-number arithmetic. Testing a calculated quantity with exact equality can reject a mathematically correct result because of a tiny rounding difference. An absolute tolerance measures an allowed discrepancy in the quantity's units. A relative tolerance scales that allowance to the magnitude being compared. Choose tolerances according to the task rather than adding an arbitrary large allowance that hides mistakes.

A separate issue is conditioning: how strongly a solution changes when input measurements change slightly. Nearly redundant equations can have a solution that is very sensitive even when the solver's residual is tiny. rcond estimates a reciprocal condition number for a matrix; a smaller positive value signals greater potential sensitivity. The example deliberately uses two nearly matching mixture equations. A small change in one total moves the two recovered amounts noticeably, while both solutions still satisfy their respective equations. Better arithmetic alone cannot recover information absent from nearly redundant measurements. Interpret a solution together with its units, residual, and sensitivity, and consider collecting a more distinct measurement when the problem itself is fragile.

### Task 8 — Inspect nearly redundant mixture totals

1. Solve the original and slightly changed systems.
2. Compare input change, solution change, and residual size.

```matlab
A = [1 1;1 1.001];
b = [2;2.001];
changedB = b+[0;0.0001];
x = A\b;
changedX = A\changedB;
solutionChange = norm(changedX-x,Inf);
inputChange = norm(changedB-b,Inf);
reciprocalCondition = rcond(A);
residualSize = norm(A*changedX-changedB,Inf);
acceptableResidual = residualSize <= 1e-10+1e-10*norm(changedB,Inf);
```

**Check the result**

- A tiny residual can coexist with a sensitive solution.

**Try a change:** Replace A with [2 1;1 3] and compare the solution change for the same perturbation.

## Independent builds

### Build 1 — Garden hose measurement report

A hose has flow measurements [2;4;3;1] L/min at times [0;1;3;6] minutes. Interpolate flow at 2 and 4 minutes using linear interpolation. Estimate volume from 0 to 6 minutes with trapezoids using the actual unequal time gaps. Report every interval's volume contribution and the total. Plot original samples and interpolated estimates with units. Explain why the estimates do not recover unrecorded short spikes and why the result covers only the measured interval.

### Build 2 — A bounded filling calculation

A container starts empty. Its supplied accumulated-volume model is V(t)=3*t+0.25*t^2 liters for 0<=t<=10 minutes. Find when it reaches 20 L using a sign-changing bracket [0,10]. Verify the volume residual within 1e-8 L. Independently integrate the rate 3+0.5*t from zero to the computed time and compare the result with the target. Report the time, both volume calculations, and their difference. Check that the computed time remains within the model domain.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [interp1: interpolation methods and bounds](https://www.mathworks.com/help/matlab/ref/double.interp1.html)
- [integral: numerical quadrature](https://www.mathworks.com/help/matlab/ref/integral.html)
- [fzero: bracketed root finding](https://www.mathworks.com/help/matlab/ref/fzero.html)
- [mldivide: solving linear systems](https://www.mathworks.com/help/matlab/ref/double.mldivide.html)
