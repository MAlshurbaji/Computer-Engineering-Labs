# Lab 07 · Dynamic Memory and Arrays

Practise choosing storage at runtime and keeping track of the memory your program owns.

Fill each `____` using the comments. Compile each complete program separately and try the stated boundary cases.

Use zero for numeric input initializers. In `main`, return 0 for success and 1 for failed input or allocation. String buffers may be larger than the minimum stated capacity.

## Allocation and Initialization

Create space for six watering reminders, initially all zero. Print the six values on separate lines, then release the storage.

```c
#include <stdio.h>
#include <stdlib.h>
int main(void) {
    int count = ____;  // Six reminders.
    int *reminders = calloc((size_t)count, sizeof ____);
    if (reminders == ____) return ____;
    for (int i=0; i ____ count; ++i) printf("%d\n", ____);
    free(____);
    return ____;
}
```

## Runtime Array Sizes

Read a label count. Accept 1–12; otherwise print `Invalid count` and exit successfully. Allocate that many integers and fill labels 10, 20, 30, … . Print one label per line and free the array.

```c
#include <stdio.h>
#include <stdlib.h>
int main(void) {
    int n = ____;
    if (scanf("%d", ____) != 1) return ____;
    if (n < 1 ____ n > 12) { puts("Invalid count"); return ____; }
    int *labels = malloc((size_t)n * sizeof ____);
    if (labels == ____) return ____;
    for (int i=0; i<n; ____) labels[i] = (i + 1) ____ 10;
    for (int i=0; i<n; ____) printf("%d\n", ____);
    free(____);
    return ____;
}
```

## Passing Dynamic Arrays to Functions

Read four bookmark states, each 0 (unread) or 1 (read). Return the index of the first unread bookmark, or −1 if all were read. The function must not change the array.

```c
#include <stdio.h>
#include <stdlib.h>
int first_unread(const int marks[], int count) {
    for (int i=0; i<count; ____) {
        if (marks[i] == ____) return i;
    }
    return ____;
}
int main(void) {
    int *marks = malloc(____ * sizeof *marks);
    if (marks == ____) return ____;
    for (int i=0; i<4; ____) {
        if (scanf("%d", ____) != 1) { free(marks); return ____; }
    }
    printf("%d\n", first_unread(marks, ____));
    free(____);
    return ____;
}
```

## Filtering into a Second Array

Read five pending print-job page counts from 0 to 20. Zero means cancelled. Copy only positive counts into a new dynamic array, preserving order. Print its used length, then one retained count per line.

```c
#include <stdio.h>
#include <stdlib.h>
int main(void) {
    int pages[5] = {____};
    for (int i=0; i<5; ____) if (scanf("%d", ____) != 1) return ____;
    int *active = malloc(____ * sizeof *active);
    if (active == ____) return ____;
    int used = ____;
    for (int i=0; i<5; ____) {
        if (pages[i] ____ 0) active[used++] = ____;
    }
    printf("%d\n", ____);
    for (int i=0; i<used; ____) printf("%d\n", ____);
    free(____);
    return ____;
}
```

## Contiguous Two-Dimensional Storage

A shelf has three rows and four positions per row, numbered from zero. Read a valid row and column, mark that one position as occupied, and print the twelve occupancy values row by row.

```c
#include <stdio.h>
#include <stdlib.h>
int main(void) {
    int row = ____, column = ____;
    if (scanf("%d %d", &row, ____) != 2) return ____;
    int *shelf = calloc(____, sizeof *shelf);
    if (shelf == ____) return ____;
    shelf[row * ____ + column] = 1;  // Four columns in each row.
    for (int r=0; r<3; ____) {
        for (int c=0; c<4; ____) printf("%d%c", shelf[r*4+____], c==3?'\n':' ');
    }
    free(____);
    return ____;
}
```

## Row Operations in Flat Storage

Allocate a two-row, three-column seating label table. Fill it with labels 1–6 in row order, exchange the two rows, and print the table.

```c
#include <stdio.h>
#include <stdlib.h>
int main(void) {
    int *seats = malloc(____ * sizeof *seats);
    if (seats == ____) return ____;
    for (int i=0; i<6; ____) seats[i] = ____;
    for (int c=0; c<3; ____) {
        int saved = ____;
        seats[c] = seats[____];
        seats[3+c] = ____;
    }
    for (int i=0; i<6; ____) printf("%d%c", ____, i%3==2?'\n':' ');
    free(____);
    return ____;
}
```

## Arrays of Row Pointers

Build a two-row, three-column board using one allocation for row pointers and a separate zero-filled allocation for each row. Mark row 1, column 2 with 9. Release any rows already allocated if a later allocation fails.

```c
#include <stdio.h>
#include <stdlib.h>
int main(void) {
    int **board = calloc(____, sizeof *board);
    if (board == ____) return ____;
    for (int r=0; r<2; ____) {
        board[r] = calloc(____, sizeof *board[r]);
        if (board[r] == ____) {
            for (int j=0; j<r; ____) free(____);
            free(____);
            return ____;
        }
    }
    board[1][____] = 9;
    printf("%d\n", ____);
    for (int r=0; r<2; ____) free(____);
    free(____);
    return ____;
}
```

## Ownership and Cleanup

Complete a helper that frees an integer buffer and resets its owner pointer to NULL. Calling the helper again must be safe. The pointer-to-pointer argument itself is always valid.

```c
#include <stdio.h>
#include <stdlib.h>
void release_buffer(int **owner) {
    free(____);
    *owner = ____;
}
int main(void) {
    int *buffer = malloc(____ * sizeof *buffer);  // Space for four integers.
    if (buffer == ____) return ____;
    release_buffer(____);
    release_buffer(____);
    printf("%d\n", buffer == ____);
    return ____;
}
```
