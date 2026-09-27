# C Programming - Foundations in Computer Science

## Lab 01 · Input, Output, and Arithmetic: Practice

Build confidence reading values and turning them into useful results. Replace each `____` using the comments, then try one activity at a time.

Each block is an independent `main` body. Put it inside `int main(void) { ... return 0; }` and add `#include <stdio.h>` above it. Inputs stay within each activity's stated domain.

### Variables and Output

#### 1. Bottle label

Prepare a label for two reusable bottles, each holding 0.75 litres. After one bottle is lent out, display the label letter, bottles left, and litres per bottle.

```c
char label = ____;                 // Bottle label B.
int bottles = ____;                  // Two bottles at home initially.
double litres = ____;             // Capacity of each bottle.
bottles = bottles ____ 1;            // One bottle leaves home.
printf("%c %d %.2f\n", label, bottles, ____);
```

### Formatted Input

#### 2. Pet-food portions

Read a whole-number portion count (1–20) and grams per portion (0.1–500.0). Display the total grams to one decimal place.

```c
____ portions;                      // A whole-number count.
____ grams;                      // A measurement with a fractional part.
scanf("%d ____", &portions, &grams);
double total = portions ____ grams;
printf("%.1f g\n", ____);
```

#### 3. Shelf labels

Read a shelf letter A–Z and a box number 0–999. Print `Shelf A / Box 007` for inputs A and 7; always use three digits for the box number.

```c
____ shelf;
____ box;
scanf(" %c %d", ____, &box);     // Read a letter, skipping leading whitespace.
printf("Shelf %c / Box ____\n", shelf, box);
```

### Integer Division and Remainders

#### 4. Audio duration

Read an audio duration from 0 to 5999 whole seconds. Display minutes and leftover seconds as `minutes:seconds`, with two digits for seconds.

```c
____ seconds;
scanf("%d", ____);
int minutes = seconds ____ 60;       // Sixty seconds make one minute.
int remainder = seconds ____ 60;     // Seconds after the full minutes.
printf("%d:%02d\n", minutes, ____);
```

### Type Conversion

#### 5. Ribbon shares

Read a ribbon length in whole centimetres (1–500) and a piece count (1–20). Display the length of each equal piece to two decimals, retaining fractional centimetres.

```c
____ length, pieces;
scanf("%d %d", &length, ____);
double each = (____)length / pieces;
printf("%.2f cm\n", ____);
```

#### 6. Whole and fractional distance

Read a nonnegative walking distance below 100 km, with at most two decimal places. Store its whole-kilometre part as an integer without rounding; also display the original distance.

```c
____ measured;
scanf("%lf", ____);
int whole = ____;             // Assignment discards the fractional part.
printf("Whole: %d km\nMeasured: %.2f km\n", whole, ____);
```

### Arithmetic and Precedence

#### 7. Shared craft supplies

Read two craft-supply costs, a returned-item refund, and a positive number of friends. Costs/refund are whole AED from 0 to 200; the refund does not exceed the combined costs. Divide the net cost equally and display two decimals.

```c
____ paper, paint, refund, friends;
scanf("%d %d %d %d", &paper, &paint, &refund, ____);
double share = (____) / (double)friends;
printf("%.2f AED each\n", ____);
```

### Storage Sizes

#### 8. Three individual values

Find the sum of the storage sizes of one char, one int, and one double variable. This is the sum of their individual sizes, not the size of a padded structure. Byte counts other than char may depend on the compiler.

```c
char code = ____;                  // Record code R.
int count = ____;                    // Six recorded items.
double litres = ____;             // Recorded amount: 1.25 litres.
size_t bytes = ____;
printf("%zu bytes\n", ____);
```
