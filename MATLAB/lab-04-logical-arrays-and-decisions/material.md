# MATLAB — Lab 04: Logical Arrays and Decisions

Turn everyday rules into clear selections and decisions, one carefully defined condition at a time.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Build masks with explicit inclusive and exclusive boundaries.
- Reduce array conditions to one decision using any or all.
- Choose between if branches, switch cases and masked assignments.
- Guard empty inputs before indexing them.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Use one fresh scratch script for each task; every example supplies its own data.
- For practice, copy one entire section into its own scratch script, complete every blank, then run that script. Other unfinished sections can cause parsing errors even when you try Run Section.

## Relational Masks

A comparison asks a question at each position in an array. The result is a logical array of true and false values with the same shape as the compared data when the other operand is a scalar. It records which entries qualify; it does not contain their original values. Use that logical array as an index to retrieve the qualifying entries. Keeping the mask in a named variable makes the rule easy to inspect and reuse. In a row vector, the selected values remain a row vector, including their original order. Equality at a boundary deserves an explicit choice: at most includes equality, while less than excludes it. Use == to compare values and = to assign a result. The example treats travel times as complete, finite measurements in minutes. It does not rank routes or account for traffic uncertainty; it simply selects the recorded times that satisfy a stated limit.

### Task 1 — Choose short errands

1. Create the five travel times and run the comparison before the selection.
2. Display both the logical mask and the selected minutes; identify the entry exactly on the limit.

```matlab
minutes = [12 25 18 31 25];
withinLimit = minutes <= 25;
chosenMinutes = minutes(withinLimit);
chosenCount = sum(withinLimit);
disp(withinLimit)
disp(chosenMinutes)
```

**Check the result**

- The two entries equal to 25 remain included.

**Try a change:** Change the limit to 24 and explain which entries disappear.

## Combining Element-Wise Conditions

A useful choice often requires more than one fact about the same item. The element-wise operator & keeps positions where both masks are true; | keeps positions where either mask is true; ~ reverses a logical mask. Write each comparison separately and put parentheses around it when combining conditions. Do not write a mathematical chained comparison such as 10 <= x <= 20: MATLAB evaluates operations in sequence rather than interpreting that expression as an interval. Separate masks can also name the reasons behind a decision, such as a shelf being wide enough or already reserved. Corresponding entries must describe the same objects in the same order. Here every input is a one-by-five row vector. Mixing a row vector with a column vector can produce a larger comparison grid through implicit expansion, which answers a different question. Check shapes before accepting a plausible-looking count. The logical combination expresses a policy; changing & to | changes that policy substantially.

### Task 2 — Find space for a storage box

1. A box needs a shelf width from 30 through 45 cm inclusive, and the shelf must not be reserved.
2. Compare the separate width mask with the final available mask.

```matlab
widthCm = [28 30 38 45 50];
reserved = logical([0 0 1 0 0]);
fitsWidth = (widthCm >= 30) & (widthCm <= 45);
available = fitsWidth & ~reserved;
availableWidths = widthCm(available);
```

**Check the result**

- Only shelves satisfying both the size and reservation rules remain.

**Try a change:** Predict the effect of marking the 45 cm shelf reserved, then try it.

## Reducing Conditions with any and all

An array of answers and a single overall decision are different outputs. any asks whether at least one entry is true; all asks whether every entry is true. For a matrix, specify the dimension so the result matches the question. Dimension 2 combines entries across each row and returns one result per row. Dimension 1 combines down each column and returns one result per column. Using the option all combines every element into a scalar logical value. Give the rows and columns concrete meanings before choosing a dimension. In this example, each row represents a picnic bag and each column represents a required item. A bag is complete only when all its item entries are true. A separate question asks which items appear in at least one bag. Neither summary preserves all the information in the original matrix, so keep the matrix when you also need to locate a missing item or explain why a bag failed.

### Task 3 — Check picnic bags

1. Interpret columns as cup, napkin and spoon; one means packed and zero means absent.
2. Compute a completeness result for each bag and a coverage result for each item.

```matlab
packed = logical([1 1 1; 1 0 1; 0 1 0]);
completeBags = all(packed,2);
itemAvailable = any(packed,1);
everythingPacked = all(packed,'all');
```

**Check the result**

- completeBags is a three-by-one column; itemAvailable is a one-by-three row.

**Try a change:** Add the missing items to the second bag and check which summary entries change.

## Updating Values with a Mask

Logical indexing can select the entries on the left side of an assignment as well as retrieve entries on the right. Start from a copy when the original measurements or plan should remain available. A scalar assigned through a mask replaces every selected entry with that value. An array assigned through a mask must provide the appropriate number of replacement values. To transform selected entries, use the same mask to retrieve them, calculate their replacements and assign them back. Unselected entries remain unchanged. This preserves positions, unlike filtering, which produces a shorter collection. The example applies a planning rule to task durations: every job shorter than ten minutes is allocated ten minutes on the schedule. The measured durations remain separate from the allocated durations. This is a stated scheduling assumption, not a correction to the observations. Keeping the two arrays makes the added allowance visible and avoids quietly treating an adjusted value as an original measurement.

### Task 4 — Add minimum schedule slots

1. Copy the recorded task minutes, then replace only allocations below ten minutes.
2. Calculate the extra minutes allocated across all jobs.

```matlab
recordedMinutes = [6 12 9 20 10];
allocatedMinutes = recordedMinutes;
shortSlots = allocatedMinutes < 10;
allocatedMinutes(shortSlots) = 10;
extraMinutes = sum(allocatedMinutes-recordedMinutes);
```

**Check the result**

- The original 6 and 9 remain in recordedMinutes; only their allocations change.

**Try a change:** Replace the minimum allocation with 12 minutes and check the equality boundary.

## Ordered if, elseif and else Branches

Use an if statement when the program must choose which block of statements to execute. An elseif adds another test only if the earlier test failed; else handles the remaining cases. The first successful condition wins, so the order matters when conditions overlap. Write the most restrictive applicable range first or make the conditions mutually exclusive. Define equality at each cutoff rather than leaving it to intuition. Unlike masked assignment, this example makes one decision for one scalar measurement. Although MATLAB permits certain nonscalar conditions, an explicit scalar condition is easier to reason about; use any or all when the decision concerns a collection. Assign the result in every branch so it never depends on an old workspace value. The example chooses a label for a supplied queue length. It is a small planning rule with exact integer boundaries, not a prediction of how long individual people will actually wait.

### Task 5 — Label a collection queue

1. Use SHORT for 0–3 waiting people, MEDIUM for 4–7 and LONG for eight or more.
2. Run the supplied scalar case, then test the stated boundary values.

```matlab
waitingPeople = 7;
if waitingPeople <= 3
    queueLabel = "SHORT";
elseif waitingPeople <= 7
    queueLabel = "MEDIUM";
else
    queueLabel = "LONG";
end
```

**Check the result**

- Seven belongs to MEDIUM rather than LONG.

**Try a change:** Try 3, 4, 7 and 8 separately and record each label.

## Scalar Short-Circuit Guards

The operators && and || combine scalar logical conditions and may skip their right operand when the answer is already determined. This behavior is useful when the second expression is safe only after the first check succeeds. For example, do not index the first entry of an empty vector. Test that the vector is nonempty before asking a question about that entry. With &&, a false left operand prevents evaluation of the right operand. With ||, a true left operand prevents evaluation of the right operand. These operators do not replace element-wise & and | when you need one answer per array element. Make the left-to-right dependency clear in the expression and keep it short enough to read. Here an empty appointment list is an ordinary case that needs a defined result. It should not fail merely because there is no first appointment, and it should not inherit a result from an earlier script run.

### Task 6 — Check the first appointment safely

1. An early appointment starts before minute 540 after midnight; exactly 540 is not early.
2. Run the empty case and the supplied nonempty case without changing the guard.

```matlab
appointmentMinutes = [];
hasEarlyFirst = ~isempty(appointmentMinutes) && appointmentMinutes(1) < 540;
secondList = [510 600 660];
secondHasEarlyFirst = ~isempty(secondList) && secondList(1) < 540;
```

**Check the result**

- The empty case returns false without attempting an invalid index.

**Try a change:** Set secondList to [540 600] and verify the strict boundary.

## Named Choices with switch

A switch statement chooses among named or discrete cases using one controlling value. It is useful when the alternatives are categories rather than ordered numeric intervals. Each case names a value to match, and otherwise provides an explicit fallback. MATLAB executes the matching case and does not fall through into later cases, so there is no break statement after each branch. String comparisons here use the exact supplied spelling and case. If an application wants to accept alternative spellings, it should define a separate normalization policy instead of assuming the switch will guess. Keep output meanings consistent across branches: the example returns a duration in minutes and a separate recognized flag. An unknown label produces NaN and false rather than an invented duration. The known categories are teaching inputs, not manufacturer settings for a real appliance. Choosing named cases keeps their different meanings visible without assigning arbitrary numeric codes that a reader would have to remember.

### Task 7 — Choose a room-cleaning plan

1. Use tidy = 12 minutes, sweep = 18 minutes and thorough = 35 minutes.
2. Keep the fallback so an unrecognized mode has an explicit status.

```matlab
mode = "sweep";
recognized = true;
switch mode
    case "tidy"
        plannedMinutes = 12;
    case "sweep"
        plannedMinutes = 18;
    case "thorough"
        plannedMinutes = 35;
    otherwise
        plannedMinutes = NaN;
        recognized = false;
end
```

**Check the result**

- The selected plan returns 18 minutes and a true recognized flag.

**Try a change:** Try an unknown label, then compare its result with the known modes.

## Validation Before a Collection Decision

A decision about a collection should distinguish invalid input from a valid collection that simply fails the rule. First build a validity mask, then ask whether enough valid information exists to proceed. isfinite marks values that are neither NaN nor positive or negative infinity. A further comparison can impose a domain rule such as nonnegative duration. Checking all of a validity mask is not enough to require actual observations, because all on an empty array is true. Combine the result with a nonempty check when absence should mean no decision. Once validation succeeds, a second mask or reduction can implement the application rule. Keep the result label separate from the diagnostic mask so you can explain why a decision was withheld. The example asks whether all supplied walks fit a planning limit. It refuses to convert an unknown or impossible duration into a normal yes/no answer, and it never silently replaces invalid data with zero.

### Task 8 — Decide whether every walk fits the plan

1. The list must be nonempty, finite and nonnegative before a decision is allowed.
2. If valid, every walk of at most 30 minutes means ALL FIT; otherwise use LONG WALK. Invalid input means CHECK DATA.

```matlab
walkMinutes = [18 30 NaN 24];
validEntries = isfinite(walkMinutes) & (walkMinutes >= 0);
validList = ~isempty(walkMinutes) && all(validEntries);
if ~validList
    decision = "CHECK DATA";
elseif all(walkMinutes <= 30)
    decision = "ALL FIT";
else
    decision = "LONG WALK";
end
```

**Check the result**

- The NaN prevents the application rule from being treated as a complete decision.

**Try a change:** Replace NaN with 30, then with 31, and compare the two valid outcomes.

## Independent builds

### Build 1 — Choose a delivery collection window

Create the row vectors startHour=[9 11 14 17], fee=[6 3 4 2] in currency units, and full=logical([0 1 0 0]). A window qualifies when its hour is from 10 through 16 inclusive, its fee is at most 4, and it is not full. Produce eligible, selectedHours and selectedFees without loops. Set status to NONE if no window qualifies, ONE if exactly one qualifies, otherwise SEVERAL. Preserve the original vectors and make all boundaries explicit.

### Build 2 — Audit activity supplies

Create stock=[4 0 3;2 1 0;5 2 2], with rows representing three activity stations and columns paper, glue and ribbon packs. Build available=stock>0. Produce readyStation using all across each row and itemMissingSomewhere using any on the missing mask down each column. Set setupStatus to READY only if every station is ready, otherwise NEEDS SUPPLIES. Make a copy toppedUp that changes zero entries to one while preserving every positive stock count. Retain stock for comparison.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [MathWorks: logical conditions and indexing](https://www.mathworks.com/help/matlab/matlab_prog/find-array-elements-that-meet-a-condition.html)
- [MathWorks: any and reduction dimensions](https://www.mathworks.com/help/matlab/ref/any.html)
- [MathWorks: short-circuit AND](https://www.mathworks.com/help/matlab/ref/shortcircuitand.html)
- [MathWorks: switch](https://www.mathworks.com/help/matlab/ref/switch.html)
