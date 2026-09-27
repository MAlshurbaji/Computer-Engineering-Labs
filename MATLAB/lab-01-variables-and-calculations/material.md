# MATLAB — Lab 01: Variables and Calculations

Turn a familiar quantity into a small, readable calculation, then change one input and explain the result.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Write a script that declares its inputs before calculating results.
- Translate scalar calculations into MATLAB expressions with consistent units.
- Choose rounding functions that match a practical requirement.
- Present a numerical result with a label and appropriate decimal places.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Create a new script in the MATLAB Editor and save it with a descriptive .m name, such as bottle_plan.m. Avoid names of built-in functions.
- Copy one complete guided example into the script and run it from the top. Each example supplies all its own inputs.
- A semicolon suppresses automatic display; a percent sign starts a comment. Read values in the Workspace or display a variable by entering its name in the Command Window.

## Scripts and Scalar Variables

A script records commands in the order MATLAB should execute them. Begin with the information you know, then calculate what you need. This makes a calculation repeatable: another person can run the same file without first creating variables by hand. A scalar is one value, such as a bottle capacity. Give that value a name that conveys its meaning and, where useful, its unit. The equals sign assigns the result on its right to the name on its left; it does not state a permanent mathematical relationship. MATLAB distinguishes uppercase and lowercase names. Use letters first, followed by letters, digits, or underscores, and avoid spaces. Names such as totalLitres are easier to review than unexplained single letters. A semicolon keeps intermediate assignments quiet without changing their values. Comments explain why a quantity exists. They are especially helpful when a physical assumption, such as every bottle being full, determines how the calculation should be interpreted. A successful run is the starting point; also check whether the answer makes sense in the situation.

### Task 1 — Water for a short outing

1. Run the complete script and inspect totalLitres in the Workspace.
2. Explain why multiplying the capacity by the number of full bottles gives litres.

```matlab
% Each of the three bottles is full.
bottleLitres = 0.75;
bottleCount = 3;
totalLitres = bottleLitres * bottleCount;
```

**Check the result**

- The result is a scalar quantity in litres.
- The input values remain available after the script finishes.

**Try a change:** Change bottleCount to 4 and run the whole script again.

## Units and Conversion Factors

MATLAB calculates with numbers; a variable name does not make a number carry a physical unit. You must keep the units consistent. For example, dividing a quantity in litres by a quantity in millilitres does not directly give a useful count. Convert one quantity first so both refer to the same unit. A conversion factor is a number that expresses the relationship between units. Here, one litre contains one thousand millilitres. Naming the converted quantity helps you check the calculation without repeatedly remembering what a number means. Work through the units on paper: millilitres divided by millilitres per wash leaves a number of washes. An ordinary division result can include a fraction. That fraction describes the amount available relative to a full dose, not an additional complete wash. Later in this lesson you will deliberately choose a rounding rule when a whole count is required. For now, keep the unrounded result and separate conversion from interpretation. This habit becomes even more useful when a script grows to several calculation stages.

### Task 2 — Laundry detergent quantity

1. Run the conversion and division.
2. Identify which variable is a volume and which is a dimensionless number of doses.

```matlab
detergentLitres = 1.35;
millilitresPerLitre = 1000;
doseMillilitres = 45;
detergentMillilitres = detergentLitres * millilitresPerLitre;
availableDoses = detergentMillilitres / doseMillilitres;
```

**Check the result**

- availableDoses describes the available quantity relative to one 45 mL dose.

**Try a change:** Use 1.4 litres and explain why the result need not be a whole number.

## Arithmetic and Parentheses

Translate a sentence into smaller named quantities before combining them. Addition and subtraction describe increases and decreases in the same unit. Multiplication can repeat a quantity a specified number of times, and division can split a total into equal portions. MATLAB follows operator precedence: powers are evaluated before multiplication and division, which are evaluated before addition and subtraction. Parentheses let you state a grouping explicitly. They can also make a correct expression easier to read, even where precedence would already give the intended result. Consider a routine repeated several times. Decide which parts occur during every repetition and which happen only once. Multiplying everything by the number of repetitions silently changes the story. The task below separates a one-time preparation period from a repeated block. All durations use minutes, so no conversion is needed before addition. Once the total is correct, it can be converted into another unit. Check the scale of the result by estimating it mentally before trusting the displayed digits.

### Task 3 — An evening craft session

1. Calculate the session duration from the supplied plan.
2. Explain why preparationMinutes is outside the multiplication.

```matlab
preparationMinutes = 8;
activityMinutes = 12;
tidyMinutes = 3;
rounds = 4;
totalMinutes = preparationMinutes + rounds * (activityMinutes + tidyMinutes);
totalHours = totalMinutes / 60;
```

**Check the result**

- The repeated block includes both the activity and its tidy-up period.
- totalHours is not a clock time; it is a duration.

**Try a change:** Move the one-time preparation into the repeated block on paper and calculate how much extra time that would imply.

## Powers and Built-in Mathematical Functions

A function accepts information inside parentheses and returns a result. You can assign that result to a variable or use it in another expression. The square-root function is written sqrt, while a scalar power uses the caret operator. Writing a power is different from multiplying a number by the exponent: squaring a length multiplies the length by itself. Geometry provides useful checks on these operations because the result has a predictable unit and size. The diagonal of a rectangle must be longer than either side, while its area is measured in square units. MATLAB also provides the constant pi for circular calculations; use its stored approximation instead of typing a short decimal when calculating a circumference or an area. Parentheses after a function name enclose its input, and parentheses within an expression can group arithmetic. These uses look similar but have different roles. Keep each intermediate quantity named while learning, so a surprising final value can be traced to the stage that produced it.

### Task 4 — A rectangular noticeboard and a circular sticker

1. Calculate the noticeboard diagonal in metres and its area in square metres.
2. Calculate the sticker circumference from its radius.

```matlab
boardWidthMetres = 1.2;
boardHeightMetres = 1.6;
diagonalMetres = sqrt(boardWidthMetres^2 + boardHeightMetres^2);
areaSquareMetres = boardWidthMetres * boardHeightMetres;
stickerRadiusMetres = 0.04;
stickerCircumferenceMetres = 2 * pi * stickerRadiusMetres;
```

**Check the result**

- The diagonal has the same unit as the side lengths.
- The area and circumference measure different properties and have different units.

**Try a change:** Double the sticker radius and compare the new circumference with the original.

## Whole Counts and Remainders

A fractional calculation may be correct while still being unsuitable as an action. A shelf cannot contain a fraction of a complete box if you are counting full boxes. Conversely, ordering enough boxes to hold every item may require one partly filled box. For positive quantities, floor rounds down to a whole number and ceil rounds up. These choices answer different questions, so select them from the wording of the task rather than from which result looks convenient. The function mod returns the remainder after division; with nonnegative whole item counts and a positive whole capacity, it gives the number left after filling complete groups. An exact multiple has a zero remainder and does not require an extra partly filled group. Keep count calculations separate from measurement calculations, where rounding too early can lose useful information. The example uses whole counts so that the interpretation is direct. Inspect the full-group count, the remainder, and the capacity of the final plan together to check that no item has disappeared.

### Task 5 — Packing postcards into sleeves

1. Calculate both the complete sleeves and the sleeves needed for every postcard.
2. Check what the remainder represents before changing the data.

```matlab
postcardCount = 47;
cardsPerSleeve = 6;
completeSleeves = floor(postcardCount / cardsPerSleeve);
leftoverCards = mod(postcardCount, cardsPerSleeve);
sleevesNeeded = ceil(postcardCount / cardsPerSleeve);
unusedSpaces = sleevesNeeded * cardsPerSleeve - postcardCount;
```

**Check the result**

- completeSleeves and sleevesNeeded answer different questions.
- The last sleeve may contain unused spaces.

**Try a change:** Try 48 postcards, then 0 postcards, and interpret both cases.

## Formatted Numerical Output

A readable result needs context as well as digits. The fprintf function can combine fixed text with numerical values and display the result in the Command Window. Its first argument is a format specification inside quotes. A conversion such as %.2f requests two digits after the decimal point, while %d is suitable for a whole-number count. The remaining arguments supply values in the same order as those conversions. The sequence backslash-n starts a new output line. Choose decimal places that help the reader understand the quantity; additional displayed digits do not establish that a measurement is more accurate. Formatting changes the displayed representation, not the numeric variable used in later calculations. The related sprintf function uses the same style of specification but returns the formatted text, which can be stored and inspected. This is useful when preparing a message before displaying it. Keep the numeric value and the message in different variables so that arithmetic continues to use the number rather than a text representation.

### Task 6 — A ribbon length label

1. Run the script and compare the numeric metresPerPiece with the displayed message.
2. Inspect labelText to see the stored formatted text.

```matlab
ribbonMetres = 2;
pieceCount = 3;
metresPerPiece = ribbonMetres / pieceCount;
labelText = sprintf('Each piece: %.2f m', metresPerPiece);
fprintf('%s\n', labelText);
fprintf('Pieces: %d\n', pieceCount);
```

**Check the result**

- The displayed length has two decimal places.
- metresPerPiece still stores the unrounded division result.

**Try a change:** Change only %.2f to %.3f and identify which numeric variables remain unchanged.

## Assignment Order and Reproducible Scripts

An assignment uses the values available at the moment the statement runs. If an input changes later, a previously calculated result stays as it was until its calculation is executed again. This behavior lets you preserve an earlier estimate and compare it with a revised one. It also explains a common source of confusion: running only the last line of a script may use an old input left in the Workspace. Put every required input in the example and run the complete script when checking it. Do not depend on a value that happened to be created during a previous experiment. Use distinct names for the earlier and revised result when both matter. Reusing an input name is allowed, but its new assignment should have a clear purpose. Read a script from top to bottom as a sequence of updates, not as a page of simultaneous equations. Comments near a deliberate change help the next reader understand which scenario each result belongs to.

### Task 7 — Comparing two poster layouts

1. Run the complete script and compare the original and revised areas.
2. Explain which assignment preserves the original result.

```matlab
widthCentimetres = 30;
heightCentimetres = 40;
areaSquareCentimetres = widthCentimetres * heightCentimetres;
originalArea = areaSquareCentimetres;
widthCentimetres = 35;
areaSquareCentimetres = widthCentimetres * heightCentimetres;
addedArea = areaSquareCentimetres - originalArea;
```

**Check the result**

- originalArea retains the earlier calculated value.
- The revised area is produced by executing the multiplication again.

**Try a change:** Use a revised width of 28 centimetres and explain the sign of addedArea.

## Combining Scalar Functions

Small functions can be composed to express a practical rule without creating a long calculation. With two scalar inputs, min returns the smaller value and max returns the larger. The abs function returns the nonnegative magnitude of a difference. These functions can be nested, but a named intermediate value often makes a beginner's script easier to explain. Imagine an adjustable setting that must stay within a stated interval. First prevent it from exceeding the upper limit, then prevent it from falling below the lower limit. Both limits are included. This numerical clipping rule changes the requested value; it is not the same as warning a user about an invalid request. The script below is only a model of a setting, not a connection to a real device. When reviewing such a rule, consider a request below the lower bound, inside the interval, and above the upper bound. Those cases reveal whether each stage performs its intended role and whether the final difference has a useful interpretation.

### Task 8 — A reading lamp brightness setting

1. Apply the allowed interval from 0 through 65 percent.
2. Calculate the size of the adjustment from the original request.

```matlab
requestedPercent = 82;
maximumPercent = 65;
upperLimitedPercent = min(requestedPercent, maximumPercent);
appliedPercent = max(0, upperLimitedPercent);
adjustmentPoints = abs(appliedPercent - requestedPercent);
```

**Check the result**

- The applied setting is inside the specified interval.
- adjustmentPoints measures percentage points, not a percentage change.

**Try a change:** Try requests of -4, 0, 31, and 65 percent and describe when the adjustment becomes zero.

## Independent builds

### Build 1 — A picnic drink plan

Write a standalone script for mixing 1.8 litres of concentrate with 3.6 litres of water. Empty bottles each hold 0.75 litres. Calculate the total drink, the number of completely full bottles, the drink remaining after filling those bottles, and the number of bottles needed to contain all the drink. Retain the unrounded volume calculations. Display one labelled report with whole-number bottle counts and volumes to two decimal places. Assume no drink is lost during pouring. Your script must declare every input before using it.

### Build 2 — A weekly study plan

Plan five identical days. Each day contains three 45-minute study periods and two 10-minute breaks. Write a standalone script that calculates study minutes, break minutes, and total minutes per day, followed by the total weekly duration. Split that weekly duration into complete hours and remaining minutes. Display the weekly result as labelled whole hours and minutes. Keep the daily and weekly quantities in separate, descriptive variables so the calculation remains easy to revise.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [Programming and Scripts](https://www.mathworks.com/help/matlab/learn_matlab/scripts.html)
- [Formatted output with fprintf](https://www.mathworks.com/help/matlab/ref/fprintf.html)
- [Rounding upward with ceil](https://www.mathworks.com/help/matlab/ref/double.ceil.html)
