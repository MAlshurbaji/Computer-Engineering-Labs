# C Programming - Foundations in Computer Science

## Lab 05 · Two-Dimensional Arrays: Practice

Build confidence working with rows and columns of everyday data. Replace each `____` using the comments, then try one activity at a time.

Each block is an independent `main` body. Put it inside `int main(void) { ... return 0; }` and add `#include <stdio.h>` above it. Inputs stay within each activity's stated domain.

### Initialization and Coordinates

#### 1. Fridge compartments

A fridge has two shelves with three compartments each. Start the first shelf with 2 and 1 cartons in its first two compartments; all other compartments are empty. Put four cartons in the final compartment of the second shelf and display the first and final compartment counts.

```c
int cartons[2][3] = {____}; // Two rows; omitted values become zero.
cartons[____][2] = 4;                 // Second shelf, third compartment.
printf("%d %d\n", cartons[0][0], cartons[1][____]);
```

### Input and Nested Traversal

#### 2. Two-week walking table

Read four whole-minute totals (0–1000) in row order: two weeks for one friend, then two weeks for the other. Store a 2×2 table. Print each friend’s second-week change from the first week, one per line.

```c
int walks[____][2];
for (int person=0; person < ____; person++) {
    for (int week=0; week < ____; week++) {
        scanf("%d", &walks[person][____]);
    }
}
for (int person=0; person < ____; person++) {
    int change = walks[person][1] ____ walks[person][0];
    printf("%d\n", ____);
}
```

### Column Summaries

#### 3. Laundry water use

Read a 3×2 table in row order: three households, two weeks, whole litres 0–500 per entry. Store totals for the two columns in a 1D array. Print week-one total, week-two total, and the combined total on separate lines.

```c
int litres[____][2], weekly[2] = {0};
for (int home=0; home < ____; home++) {
    for (int week=0; week < ____; week++) {
        scanf("%d", &litres[home][____]);
    }
}
for (int week=0; week < ____; week++) {
    for (int home=0; home < ____; home++) {
        weekly[week] ____ litres[home][week];
    }
    printf("%d\n", weekly[____]);
}
printf("%d\n", weekly[0] ____ weekly[1]);
```

### Row Summaries

#### 4. Compare nearby shops

Read a 2×3 table of whole-AED prices (1–100): rows are two products, columns are three shops. Print the one-based cheapest-shop number for each product; choose the earlier shop on ties.

```c
int prices[____][3];
for (int product=0; product < ____; product++) {
    for (int shop=0; shop < ____; shop++) {
        scanf("%d", &prices[product][____]);
    }
}
for (int product=0; product < ____; product++) {
    int best = ____;                 // Start with the first shop for this product.
    for (int shop=1; shop < ____; shop++) {
        if (prices[product][shop] ____ prices[product][best]) {
            best = ____;
        }
    }
    printf("%d\n", best ____ 1);
}
```

### Transposition

#### 5. Change a timetable view

Read a 2×3 table of study minutes (0–180): rows are two people and columns are three days. Copy it into a 3×2 table whose rows are days. Display each day’s two values on one line.

```c
int people[2][3], days[____][2];
for (int person=0; person < ____; person++) {
    for (int day=0; day < ____; day++) {
        scanf("%d", &people[person][____]);
        days[day][person] = people[person][____];
    }
}
for (int day=0; day < ____; day++) {
    printf("%d %d\n", days[day][0], days[day][____]);
}
```

### Moving Columns

#### 6. Swap recipe sizes

Read a 3×2 table of ingredient amounts (0–1000 grams). The first column is a small recipe; the second is a large recipe. Swap the columns in place and display each row as two values.

```c
int grams[____][2];
for (int item=0; item < ____; item++) {
    scanf("%d %d", &grams[item][0], &grams[item][____]);
}
for (int item=0; item < ____; item++) {
    int saved = grams[item][____];
    grams[item][0] = grams[item][____];
    grams[item][1] = ____;
    printf("%d %d\n", grams[item][0], grams[item][____]);
}
```

### Comparing Tables

#### 7. Baking plan changes

Read a 2×2 planned table, then a 2×2 actual table. Rows are two bakers and columns are two days; every entry is a cookie count 0–100. Store actual minus planned in a third table. Display its two rows.

```c
int planned[2][2], actual[2][2], change[____][2];
for (int row=0; row < ____; row++) {
    for (int col=0; col < ____; col++) {
        scanf("%d", &planned[row][____]);
    }
}
for (int row=0; row < ____; row++) {
    for (int col=0; col < ____; col++) {
        scanf("%d", &actual[row][____]);
        change[row][col] = actual[row][col] ____ planned[row][col];
    }
    printf("%d %d\n", change[row][0], change[row][____]);
}
```

### Index Validation

#### 8. Read a storage compartment

The fixed table holds quantities for two shelves and three compartments. Read one-based shelf and compartment numbers from -2 to 5. Display the quantity only if both coordinates are valid; otherwise display `Outside table`.

```c
int stock[2][3] = {____}; // Row values: 3,7,1 and 0,5,9.
____ shelf, compartment;
scanf("%d %d", &shelf, ____);
if (shelf >= 1 && shelf <= 2 && compartment >= 1 ____ compartment <= 3) {
    printf("%d\n", stock[shelf - 1][compartment ____ 1]);
} ____ {
    printf("____\n");
}
```
