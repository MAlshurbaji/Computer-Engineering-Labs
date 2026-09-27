# Lab 06 · Functions and Recursion

Build confidence breaking everyday calculations into small, reusable functions.

Fill each `____` using the comments. Compile each complete program separately and try the stated boundary cases.

Use zero for numeric input initializers. In `main`, return 0 for success and 1 for failed input or allocation. String buffers may be larger than the minimum stated capacity.

## Function Parameters and Return Values

Read a photo count from 0 to 200. Each sheet holds four photos. Print the number of sheets needed; try zero, a full sheet, and a partly filled sheet.

```c
#include <stdio.h>
int sheets_needed(int photos) {
    return (photos + ____) / 4;  // Round upward to a whole sheet; zero needs none.
}
int main(void) {
    int photos = ____;
    if (scanf("%d", ____) != 1) return ____;
    printf("%d\n", ____);
    return ____;
}
```

## Function Prototypes

Read walking distance in metres (0–5000) and speed in metres per minute (10–200). Print travel time with two decimal places.

```c
#include <stdio.h>
double travel_minutes(int metres, ____ speed);  // Speed may have a fraction.
int main(void) {
    int metres = ____;
    double speed = ____;
    if (scanf("%d %lf", &metres, ____) != 2) return ____;
    printf("%.2f\n", ____);
    return ____;
}
double travel_minutes(int metres, double speed) {
    return metres ____ speed;
}
```

## Pointer Parameters and Multiple Results

Read a cooking duration from 0 to 600 minutes. Use two distinct output variables for its whole hours and remaining minutes. Print both integers.

```c
#include <stdio.h>
void split_time(int total, int *hours, int *minutes) {
    ____ = total / 60;
    ____ = total % 60;
}
int main(void) {
    int total = ____, hours = ____, minutes = ____;
    if (scanf("%d", ____) != 1) return ____;
    split_time(total, ____, ____);
    printf("%d %d\n", hours, ____);
    return ____;
}
```

## Changing Two Caller Variables

Read two seat numbers from 1 to 50. Exchange the numbers through pointers and print them in their new order. Try equal numbers too.

```c
#include <stdio.h>
void exchange(int *left, int *right) {
    int saved = ____;
    *left = ____;
    *right = ____;
}
int main(void) {
    int first = ____, second = ____;
    if (scanf("%d %d", &first, ____) != 2) return ____;
    exchange(____, &second);
    printf("%d %d\n", first, ____);
    return ____;
}
```

## Conditional Updates Through Pointers

Read a requested screen brightness from −50 to 150. Keep values inside 0–100 unchanged and move values outside that range to the nearest boundary.

```c
#include <stdio.h>
void limit_brightness(int *level) {
    if (*level ____ 0) {
        *level = ____;
    } else if (*level ____ 100) {
        *level = ____;
    }
}
int main(void) {
    int brightness = ____;
    if (scanf("%d", ____) != 1) return ____;
    limit_brightness(____);
    printf("%d\n", ____);
    return ____;
}
```

## Recursive Base Cases

Read a parcel number from 0 to 999999. Return how many decimal digits it has. Zero has one digit; use recursion without a loop.

```c
#include <stdio.h>
int digit_count(unsigned number) {
    if (number < ____) return ____;
    return 1 + digit_count(number ____ 10);
}
int main(void) {
    unsigned number = ____;
    if (scanf("%u", ____) != 1) return ____;
    printf("%d\n", ____);
    return ____;
}
```

## Recursive Reduction

A paper stack contains 1, 2, 4, 8, 16, 32, or 64 sheets. Read its size and return how many equal halvings reduce it to one sheet. Use recursion.

```c
#include <stdio.h>
int halvings(int sheets) {
    if (sheets == ____) return ____;
    return ____ + halvings(sheets / 2);
}
int main(void) {
    int sheets = ____;
    if (scanf("%d", ____) != 1) return ____;
    printf("%d\n", ____);
    return ____;
}
```

## Recursive Array Checks

Read four packing flags, each 0 (missing) or 1 (packed). Recursively return 1 only when every item is packed. An empty list is complete. Inspect the final item, then recurse on the shorter prefix; do not use a loop inside the function.

```c
#include <stdio.h>
int all_packed(const int flags[], int count) {
    if (count == ____) return ____;
    if (flags[count-1] == ____) return ____;
    return all_packed(flags, count ____ 1);
}
int main(void) {
    int flags[4] = {____};
    for (int i=0; i<4; ____) if (scanf("%d", ____) != 1) return ____;
    printf("%d\n", all_packed(flags, ____));
    return ____;
}
```
