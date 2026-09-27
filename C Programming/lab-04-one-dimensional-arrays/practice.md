# C Programming - Foundations in Computer Science

## Lab 04 · One-Dimensional Arrays: Practice

Build confidence storing, comparing, and rearranging a list of values. Replace each `____` using the comments, then try one activity at a time.

Each block is an independent `main` body. Put it inside `int main(void) { ... return 0; }` and add `#include <stdio.h>` above it. Inputs stay within each activity's stated domain.

### Initialization and Indexing

#### 1. Drawer stock

Five drawers start with 2 items in the first, 4 in the second, and none elsewhere. Put three items in the last drawer. Display the middle and last drawer counts.

```c
int drawers[5] = {____};          // Unspecified entries start at zero.
drawers[____] = 3;                  // The last drawer has index 4.
printf("%d %d\n", drawers[2], drawers[____]);
```

### Input and Traversal

#### 2. Long walks

Read four walking durations, each 0–120 minutes, into an array. Then display only durations greater than 30, in their original order, one per line.

```c
int minutes[____];                  // Four recorded walks.
for (int i = 0; i < ____; i++) {
    scanf("%d", &minutes[____]);
}
for (int i = 0; i < ____; i++) {
    if (minutes[i] ____ 30) {
        printf("%d\n", minutes[____]);
    }
}
```

### Adjacent Elements

#### 3. Changes in reading time

Read five daily reading times, each 0–100 minutes. Store the four changes from one day to the next in a second array; an increase is positive. Display the changes one per line.

```c
int minutes[____], changes[4];
for (int i = 0; i < ____; i++) {
    scanf("%d", &minutes[____]);
}
for (int i = 0; i < ____; i++) {
    changes[i] = minutes[i + 1] ____ minutes[i];
    printf("%d\n", changes[____]);
}
```

### Moving Elements

#### 4. Rotate a chore queue

Read four household member numbers, each 1–9. Move the first number to the end, shifting the others left. Display the new queue one number per line.

```c
int queue[____];
for (int i = 0; i < ____; i++) {
    scanf("%d", &queue[____]);
}
int first = queue[____];             // Save the value that would be overwritten.
for (int i = 0; i < ____; i++) {
    queue[i] = queue[____];
}
queue[3] = ____;
for (int i = 0; i < ____; i++) {
    printf("%d\n", queue[____]);
}
```

### Searching for a Suitable Minimum

#### 5. Choose a measuring cup

Read four cup capacities (1–1000 mL), then the required amount (1–1000 mL). Find the smallest cup that holds the amount; ties use the earliest cup. Print its one-based cup number, or `None`. Include `<limits.h>`.

```c
int capacity[____], needed;
for (int i = 0; i < ____; i++) {
    scanf("%d", &capacity[____]);
}
scanf("%d", ____);
int best = ____, chosen = -1;  // INT_MAX is the largest int; no cup is selected yet.
for (int i = 0; i < ____; i++) {
    if (capacity[i] >= needed ____ capacity[i] < best) {
        best = capacity[____];
        chosen = ____;
    }
}
if (chosen ____ -1) {
    printf("____\n");
} ____ {
    printf("%d\n", chosen ____ 1);
}
```

### Extrema and Positions

#### 6. Best disk-space change

Read five daily changes in free disk space, each from -100 to 100 MB. Print the one-based day of the largest change. If changes tie, choose the earliest day; negative values are valid.

```c
int change[____];
for (int i = 0; i < ____; i++) {
    scanf("%d", &change[____]);
}
int best_day = ____;                 // The first observation is the starting candidate.
for (int i = 1; i < ____; i++) {
    if (change[i] ____ change[best_day]) {
        best_day = ____;
    }
}
printf("%d\n", best_day ____ 1);
```

### Repeated Neighbours

#### 7. Repeated journey codes

Read six journey codes, each 1–9. Count equal neighbouring pairs. Three equal consecutive codes contribute two pairs. Display only the count.

```c
int journeys[____];
for (int i = 0; i < ____; i++) {
    scanf("%d", &journeys[____]);
}
int pairs = ____;
for (int i = 1; i < ____; i++) {
    if (journeys[i] ____ journeys[i - 1]) {
        pairs = pairs ____ 1;
    }
}
printf("%d\n", ____);
```

### Sorting

#### 8. Order short errands

Read four errand durations, each 0–60 minutes. Sort them from shortest to longest using adjacent swaps. Keep duplicates and display one duration per line.

```c
int minutes[____];
for (int i = 0; i < ____; i++) {
    scanf("%d", &minutes[____]);
}
for (int pass = 0; pass < ____; pass++) {
    for (int i = 0; i < ____; i++) {
        if (minutes[i] ____ minutes[i + 1]) {
            int saved = minutes[____];
            minutes[i] = minutes[____];
            minutes[i + 1] = ____;
        }
    }
}
for (int i = 0; i < ____; i++) {
    printf("%d\n", minutes[____]);
}
```

### In-Place Reversal

#### 9. Turn a shelf around

Read five book labels, each an integer 1–99. Reverse their order in the same array by swapping opposite ends. Keep the middle label in place; display one label per line.

```c
int labels[____];
for (int i = 0; i < ____; i++) {
    scanf("%d", &labels[____]);
}
for (int left = 0; left < ____; left++) {
    int right = 4 ____ left;
    int saved = labels[____];
    labels[left] = labels[____];
    labels[right] = ____;
}
for (int i = 0; i < ____; i++) {
    printf("%d\n", labels[____]);
}
```
