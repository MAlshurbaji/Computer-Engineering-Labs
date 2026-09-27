# MATLAB — Lab 05: Loops and Reusable Functions

Build repeated calculations you can follow by hand, then package useful rules into small reusable functions.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Trace bounded loops and preserve the intended output shape.
- Preallocate vectors and matrices before filling them.
- Pass data into local functions and collect explicit outputs.
- Use validation and element-wise anonymous functions.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Use one fresh scratch script for each task; every example supplies its own data.
- For practice, copy one entire section into its own scratch script, complete every blank, then run that script. Other unfinished sections can cause parsing errors even when you try Run Section.
- In MATLAB R2022b, local functions belong at the end of a script. Copy the whole example or practice section, including its function definitions, into one scratch script.

## for Loops and Accumulators

A for loop repeats its body for a supplied sequence of index values. Using 1:numel(data) visits every entry of a vector by position, regardless of whether the input is stored as a row or a column. An accumulator keeps a running result, so initialize it before entering the loop and update it inside. Moving that initialization into the body would erase earlier work at every iteration. The final accumulator describes the whole processed sequence; it does not automatically preserve intermediate results. Trace a short example by writing down the index, current input and updated total after each pass. That reveals skipped entries and double counting more clearly than looking only at the last number. Do not modify the loop index inside the body to control the next pass: the for statement supplies its values. To distinguish odd and even positions, mod(k,2) returns the remainder after division by two: one for odd and zero for even. A built-in reduction could also compute this example’s final total.

### Task 1 — Count folded towels

1. Process the four basket counts in their listed order.
2. Trace totalTowels after each iteration, then compare with the final value.

```matlab
basketCounts = [3 5 2 4];
totalTowels = 0;
for k = 1:numel(basketCounts)
    totalTowels = totalTowels + basketCounts(k);
end
```

**Check the result**

- The total includes each basket exactly once.

**Try a change:** Try an empty basketCounts vector and explain why the initialized total remains meaningful.

## Preallocation and Output Shape

When a loop will produce a known number of results, allocate the output array first. zeros(size(input)) creates a numeric array with the same dimensions as the input, while zeros(rows,columns) chooses dimensions explicitly. The loop then fills existing locations rather than repeatedly expanding the array. Preallocation makes the intended shape visible and avoids unnecessary growth, but it is not proof that every location receives a meaningful value. Check that the loop covers the full output and that its index matches the corresponding input. A zero left behind might look like a valid result and hide a skipped assignment. In the example, one output belongs to each batch of labels. The fixed preparation time is added once per batch, while printing time depends on that batch’s label count. This distinction belongs in the formula, not in a total added after all batches. Preserve units in variable names so a count cannot be mistaken for elapsed seconds.

### Task 2 — Estimate label-printing batches

1. Each batch takes 15 setup seconds plus two seconds per label.
2. Fill an output with one duration per supplied batch.

```matlab
labelCounts = [4 1 7 0];
durationSeconds = zeros(size(labelCounts));
for k = 1:numel(labelCounts)
    durationSeconds(k) = 15 + 2*labelCounts(k);
end
```

**Check the result**

- The zero-label batch still receives the stated 15-second setup allocation.

**Try a change:** Change labelCounts to a column vector and check the output shape.

## Nested Loops and Two-Dimensional Results

Two independent choices often call for a matrix with one axis for each choice. A nested loop uses one index for rows and another for columns, making their meanings explicit. Preallocate the matrix with the number of row choices and the number of column choices. The inner loop completes one row for a particular outer-loop choice before the outer loop advances. The order of execution does not change which output cell belongs to which pair, provided the assignment uses the correct indices. Confusing row and column indices may produce a transposed answer or an indexing error when their lengths differ. Deliberately use unequal numbers of choices while learning; a square matrix can conceal the mistake. The example records how much ribbon each combination of box count and wrapping style would require. It does not choose the best combination or model waste between boxes. Those would be additional requirements, separate from calculating this small grid of defined possibilities.

### Task 3 — Compare ribbon plans

1. Rows correspond to one, three and five boxes; columns correspond to 40 or 65 cm per box.
2. Build the three-by-two ribbon requirement matrix with nested loops.

```matlab
boxCounts = [1 3 5];
cmPerBox = [40 65];
ribbonCm = zeros(numel(boxCounts),numel(cmPerBox));
for r = 1:numel(boxCounts)
    for c = 1:numel(cmPerBox)
        ribbonCm(r,c) = boxCounts(r)*cmPerBox(c);
    end
end
```

**Check the result**

- Each row contains two wrapping-style estimates for one box count.

**Try a change:** Add a third wrapping style and check which dimension grows.

## Bounded while Loops

A while loop repeats while its condition remains true, checking that condition before each pass. It is appropriate when the stopping point depends on earlier results rather than a predetermined iteration count. State clearly what changes on every successful pass and why the loop must eventually stop. This example can process at most the finite number of listed pieces. The index advances after each accepted piece, so it cannot continue forever. The left part of the short-circuit guard confirms that an item exists before the right part reads it. The second part tests whether the next whole piece fits the remaining material. Equality is allowed: a piece that uses the roll exactly should be accepted. The task processes the listed order and stops at the first piece that does not fit; it does not skip that piece to look for a smaller later one. Describing that policy is essential because another perfectly reasonable packing algorithm would produce a different result.

### Task 4 — Cut consecutive ribbon pieces

1. A roll contains 250 cm; process requests [80 60 90 40] cm without reordering.
2. Stop before the first request that would exceed the roll.

```matlab
rollCm = 250;
pieceCm = [80 60 90 40];
nextIndex = 1;
usedCm = 0;
while nextIndex <= numel(pieceCm) && usedCm + pieceCm(nextIndex) <= rollCm
    usedCm = usedCm + pieceCm(nextIndex);
    nextIndex = nextIndex + 1;
end
piecesCut = nextIndex - 1;
remainingCm = rollCm - usedCm;
```

**Check the result**

- The unused amount is not enough for the next requested piece.

**Try a change:** Try a roll length of 230 cm, then 79 cm, and compare the boundary behavior.

## Local Functions and Explicit Inputs

A function gives a calculation a name and a clear interface. Its input arguments are the information it receives, and its output variables are the results it returns. A local function in a script has its own workspace: it should not rely on a variable merely because that variable exists in the surrounding script. Pass every required value through the argument list. The script chooses the data and stores results; the function implements one reusable rule. In MATLAB R2022b, place all script statements before the local function definitions at the end of the file. The function name is usable within that script, not automatically from a different file or the Command Window. Save the scratch script with a name different from the local function name. Here the same calculation handles two lunch-box orders, avoiding duplicated arithmetic. A change to the rule would have one implementation to edit, while both calls would still state their own inputs explicitly.

### Task 5 — Calculate container needs

1. A local function returns the ceiling of portions divided by portions per container.
2. Call it for 17 portions in containers of six and 12 portions in containers of four.

```matlab
boxesA = containerCount(17,6);
boxesB = containerCount(12,4);
function boxes = containerCount(portions,perContainer)
    boxes = ceil(portions/perContainer);
end
```

**Check the result**

- Both calls use the same rule with different arguments.

**Try a change:** Try zero portions with a positive container capacity and interpret the result.

## Multiple Outputs and Calling Contracts

One function can return related results in a specified order. List those outputs inside square brackets in the function definition and request them in the same order when calling it. Variable names at the call site need not match the names inside the function, but their roles must match. Assigning the outputs in the wrong order can produce numbers that look reasonable while changing their meaning. Document units and the accepted input domain alongside the rule. The example divides a whole-number count of stickers into complete sheets and leftover individual stickers. floor obtains the number of full sheets, and the remainder is what remains after those sheets are accounted for. Both results refer to the same input count and sheet size, making them a natural pair of outputs. A multiple-output interface is clearer than packing the two meanings into an unlabeled vector. Test an exact multiple and a smaller-than-one-sheet count as well as the ordinary mixed case.

### Task 6 — Separate full sticker sheets and leftovers

1. Use a positive integer sheet size and a nonnegative integer sticker count.
2. Request both outputs for 29 stickers on sheets of eight and for 16 stickers on sheets of eight.

```matlab
[fullSheets,leftovers] = sheetSplit(29,8);
[exactSheets,exactLeftovers] = sheetSplit(16,8);
function [whole,remainder] = sheetSplit(stickers,sheetSize)
    whole = floor(stickers/sheetSize);
    remainder = stickers - whole*sheetSize;
end
```

**Check the result**

- The exact-multiple case has no leftover individual stickers.

**Try a change:** Call the function with three stickers and explain both outputs.

## Simple Function Validation

A reusable function should state which inputs it accepts and what it does when that contract is not met. A short validation expression can check scalar shape before a later scalar condition is evaluated. This example accepts a real, finite, nonnegative scalar distance and a real, finite, positive scalar pace in minutes per kilometre. It returns both a duration and a validity flag. Invalid input gives NaN and false, so the caller can distinguish an unusable result from a genuine zero-minute duration. The local function initializes the duration before the conditional calculation, ensuring that every path defines its outputs. This approach is one deliberate contract; another function could raise an error instead, but callers would then need a different handling strategy. Validation does not guarantee that a simplified real-world model is accurate. It only ensures that the supplied values meet the assumptions this calculation explicitly requires. Keep unusual cases visible in the script by storing their returned values for inspection.

### Task 7 — Validate a walking-time calculation

1. Compute minutes as distanceKm times paceMinutesPerKm.
2. Compare a normal walk, a zero-distance walk and a negative-distance input.

```matlab
[tripMinutes,tripOK] = walkingTime(2.5,12);
[zeroMinutes,zeroOK] = walkingTime(0,12);
[badMinutes,badOK] = walkingTime(-1,12);
[vectorMinutes,vectorOK] = walkingTime([1 2],12);
function [minutes,valid] = walkingTime(distanceKm,paceMinutesPerKm)
    valid = isnumeric(distanceKm) && isscalar(distanceKm) && isreal(distanceKm) && isfinite(distanceKm) && distanceKm >= 0;
    valid = valid && isnumeric(paceMinutesPerKm) && isscalar(paceMinutesPerKm) && isreal(paceMinutesPerKm) && isfinite(paceMinutesPerKm) && paceMinutesPerKm > 0;
    minutes = NaN;
    if valid
        minutes = distanceKm*paceMinutesPerKm;
    end
end
```

**Check the result**

- Zero distance is valid; a negative distance or nonscalar distance is not converted into a normal duration.

**Try a change:** Add a call with pace zero and inspect both outputs.

## Anonymous Functions and Captured Values

An anonymous function is a compact function handle built from one expression. The syntax @(x) introduces its input argument, and the following expression computes its result. Use element-wise operators when the input may be a vector or matrix: a squared size needs .^ rather than matrix power. The handle can also use values available when it is created. Those captured values remain associated with that handle even if a script variable with the same name changes later. Recreate the handle when you intend to use new captured settings, or pass the changing settings as additional arguments. Anonymous functions are useful for small formulas; a local function is usually clearer once validation, branches or several statements are needed. The example gives a simple display-card material estimate from a side length. It deliberately demonstrates two captured rates. Calling both handles on the same row vector makes their different settings visible while retaining the shape of that input vector.

### Task 8 — Compare two card-cost settings

1. Each square card costs two currency units plus rate times sideCm squared; rate is currency units per square centimetre.
2. Create one handle at rate 0.1, change the rate to 0.2, then create a second handle.

```matlab
rate = 0.1;
oldEstimate = @(sideCm) 2 + rate.*sideCm.^2;
rate = 0.2;
newEstimate = @(sideCm) 2 + rate.*sideCm.^2;
oldValues = oldEstimate([2 4]);
newValues = newEstimate([2 4]);
```

**Check the result**

- The first handle retains its original rate even after the script variable changes.

**Try a change:** Rewrite the estimate with rate as a second explicit argument.

## Independent builds

### Build 1 — Plan a sequence of craft jobs

Use jobMinutes=[12 8 15 10] and a five-minute cleanup after each job. Write local function finishTimes(jobMinutes,cleanupMinutes) that preallocates a row output, then uses a loop to return cumulative completion times including each cleanup. Call it for the supplied jobs with cleanup 5 and for an empty job vector with cleanup 5. Inputs are a row vector of nonnegative finite durations and a nonnegative scalar cleanup; no validation is required here. Place the function at the end of the script and retain both returned arrays.

### Build 2 — Fill a tray in order

A tray holds at most 18 cupcakes. Requests are [5 4 6 7 2] cupcakes in that order. Use a bounded while loop to accept consecutive whole requests while the next fits, stopping at the first failure without skipping it. Retain acceptedCount, usedCapacity and unusedCapacity. Put the calculation in local function acceptPrefix(requests,capacity) returning those three outputs. Also call it with requests [18 1] and capacity 18, and with an empty request vector. All request counts and capacity are nonnegative integers. Do not use an unbounded loop or access beyond the vector.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [MathWorks: for loops](https://www.mathworks.com/help/matlab/ref/for.html)
- [MathWorks: array preallocation](https://www.mathworks.com/help/matlab/matlab_prog/preallocating-arrays.html)
- [MathWorks: local functions in scripts](https://www.mathworks.com/help/matlab/matlab_prog/local-functions-in-scripts.html)
- [MathWorks: anonymous functions](https://www.mathworks.com/help/matlab/matlab_prog/anonymous-functions.html)
