# Lab 08 · Strings and Text Files

Build confidence working with readable labels and saving small records in files.

Fill each `____` using the comments. Compile each complete program separately and try the stated boundary cases.

Use zero for numeric input initializers. In `main`, return 0 for success and 1 for failed input or allocation. String buffers may be larger than the minimum stated capacity.

## Bounded String Input

Read a shopping label containing at most 30 characters, including spaces. Remove its final newline if present. Print the label length. A blank line is allowed.

```c
#include <stdio.h>
#include <string.h>
int main(void) {
    char label[____];  // 30 characters, newline, and terminator.
    if (fgets(label, sizeof label, ____) == NULL) return ____;
    label[strcspn(label, ____)] = '\0';
    printf("%zu\n", ____);
    return ____;
}
```

## Character Counting

Read a line of at most 60 characters. Count its commas, which separate entries in a packing note. Count only commas; do not infer the number of entries.

```c
#include <stdio.h>
int main(void) {
    char note[____];  // At least 60 characters, newline, and terminator.
    if (fgets(note, sizeof note, ____) == NULL) return ____;
    int commas = ____;
    for (int i=0; note[i] != ____; ++i) {
        if (note[i] == ____) ++commas;
    }
    printf("%d\n", ____);
    return ____;
}
```

## String Copying and Joining

Read one grocery word with at most 10 letters. Build a new label by appending ` bags`, including its leading space. Print the new label; the destination has room for the whole result.

```c
#include <stdio.h>
#include <string.h>
int main(void) {
    char item[____], label[____];  // 10 + 5 characters, plus the terminator.
    if (scanf("%10s", ____) != 1) return ____;
    strcpy(label, ____);
    strcat(label, ____);
    printf("%s\n", ____);
    return ____;
}
```

## Character Classification

Read a shelf label of at most 40 characters. Count alphabetic characters, including both cases. Keep the input unchanged. Pass ctype functions an unsigned-char value.

```c
#include <stdio.h>
#include <ctype.h>
int main(void) {
    char label[____];  // At least 40 characters, newline, and terminator.
    if (fgets(label, sizeof label, ____) == NULL) return ____;
    int letters = ____;
    for (int i=0; label[i]!='\0'; ____) {
        if (isalpha((____)label[i])) ++letters;
    }
    printf("%d\n", ____);
    return ____;
}
```

## String Comparison

Read two lowercase grocery words, each at most 12 letters. Print whichever word comes first according to strcmp; if equal, print `Same label`.

```c
#include <stdio.h>
#include <string.h>
int main(void) {
    char first[____], second[____];  // Each needs 12 letters plus its terminator.
    if (scanf("%12s %12s", first, ____) != 2) return ____;
    int order = strcmp(first, ____);
    if (order ____ 0) puts(first);
    else if (order ____ 0) puts(second);
    else puts(____);
    return ____;
}
```

## Recursive String Traversal

Read a line of at most 50 characters. Recursively count its semicolons. Move one character forward on each call and stop at the string terminator; do not use a loop.

```c
#include <stdio.h>
int separators(const char *text) {
    if (*text == ____) return ____;
    return (*text == ____) + separators(text + 1);
}
int main(void) {
    char line[____];  // At least 50 characters, newline, and terminator.
    if (fgets(line, sizeof line, ____) == NULL) return ____;
    printf("%d\n", separators(____));
    return ____;
}
```

## Writing and Appending Files

Create `packing.txt` in the program’s working folder, write `hat` on its first line, close it, then reopen it to append `bottle` on the next line. Check both opens and close each stream.

```c
#include <stdio.h>
int main(void) {
    FILE *out = fopen("packing.txt", ____);  // Begin a fresh file.
    if (out == ____) return ____;
    fputs(____, out);
    fclose(____);
    out = fopen("packing.txt", ____);  // Append without erasing the first line.
    if (out == ____) return ____;
    fputs(____, out);
    fclose(____);
    return ____;
}
```

## Reading Text Lines

Create `notes.txt` containing short lines, at most 40 characters each. Print each line with a one-based line number and a colon. An empty line still gets a number. Print `Missing file` if opening fails.

```c
#include <stdio.h>
int main(void) {
    FILE *in = fopen("notes.txt", ____);
    if (in == ____) { puts("Missing file"); return ____; }
    char line[____];  // At least 40 characters, newline, and terminator.
    int number = ____;
    while (fgets(line, sizeof line, ____) != NULL) {
        printf("%d:%s", ____, line);
        ++____;
    }
    fclose(____);
    return ____;
}
```

## Reading Numeric Records

Create `stops.txt` containing cumulative travel minutes as nondecreasing integers from 0 to 1000. Print the duration from one stop to the next, one per line. A file with fewer than two records prints nothing. Print `Missing file` if it cannot be opened.

```c
#include <stdio.h>
int main(void) {
    FILE *in = fopen("stops.txt", ____);
    if (in == ____) { puts("Missing file"); return ____; }
    int previous = ____, current = ____;
    if (fscanf(in, "%d", ____) == 1) {
        while (fscanf(in, "%d", ____) == 1) {
            printf("%d\n", current ____ previous);
            previous = ____;
        }
    }
    fclose(____);
    return ____;
}
```
