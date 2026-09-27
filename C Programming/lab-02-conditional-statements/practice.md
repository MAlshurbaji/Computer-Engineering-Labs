# Lab 02 · Conditional Statements in C

Build confidence making everyday decisions with conditions in C.

Fill each `____`, choosing clear text for message blanks. Run each block separately inside `main`, with `<stdio.h>` included.

## Comparison and Logical Operators

```c
// You have 12.50 AED; the groceries cost 10.00 AED. Print 1 if you can pay, otherwise 0.
float budget = ____;
float cost = ____;
int can_pay = budget ____ cost;  // Having exactly enough money also counts.
printf("%d\n", ____);
// Try equal amounts, then a cost above the budget.
```

```c
// Enter two flags: have_bread and have_cheese. Each is 0 (no) or 1 (yes).
int ____ = 0, ____ = 0;
scanf("%d %d", &have_bread, ____);
int can_make_sandwich = (have_bread == 1) ____ (have_cheese == 1);
printf("%d\n", ____);  // A cheese sandwich needs both ingredients.
```

## if Statements

```c
// Enter apples at home, then apples needed. Both counts are between 0 and 20.
int ____ = 0, ____ = 0;
scanf("%d %d", &at_home, ____);
if (at_home ____ needed) {
    int to_buy = needed ____ at_home;
    printf("Buy %d apples\n", ____);
}
// Print nothing when you already have enough.
```

```c
// Enter packed_water and packed_notebook: 0 means missing, 1 means packed.
int ____ = 0, ____ = 0;
scanf("%d %d", &packed_water, ____);
int missing = ____;  // Begin the missing-item count at zero.
if (packed_water ____ 0) {
    printf(____);
    missing = missing ____ 1;
}
if (packed_notebook ____ 0) {
    printf(____);
    missing = missing ____ 1;
}
printf("Missing items: %d\n", ____);
// Both messages should appear when both items are missing.
```

## if and else

```c
// Enter a battery percentage from 0 to 100. Your reminder appears below 20%.
int ____ = 0;
scanf("%d", ____);
if (battery ____ 20) {
    printf(____);
} ____ {
    printf(____);
}
// Compare 19%, 20%, and 21%.
```

```c
// Enter two weather flags: raining and too_hot, each 0 (no) or 1 (yes).
int ____ = 0, ____ = 0;
scanf("%d %d", &raining, ____);
if ((raining == 1) ____ (too_hot == 1)) {
    printf(____);  // Either condition is enough to stay inside.
} ____ {
    printf(____);
}
```

## else if

```c
// Enter washer_1_free and washer_2_free: 0 means busy, 1 means available.
int ____ = 0, ____ = 0;
scanf("%d %d", &washer_1_free, ____);
if (washer_1_free ____ 1) {
    printf(____);  // Prefer washer 1 when both are available.
} ____ (washer_2_free == 1) {
    printf(____);
} ____ {
    printf(____);
}
```

## Nested if Statements

```c
// Enter pass_valid (0 or 1), balance, and fare. Amounts are whole AED from 0 to 100.
int ____ = 0, ____ = 0, ____ = 0;
scanf("%d %d %d", &pass_valid, &balance, ____);
if (pass_valid ____ 1) {
    if (balance ____ fare) {
        balance = balance ____ fare;
        printf("Balance: %d AED\n", ____);
    } ____ {
        printf("Add %d AED\n", ____);
    }
} ____ {
    printf(____);
}
// An invalid pass is rejected even when its balance covers the fare.
```
