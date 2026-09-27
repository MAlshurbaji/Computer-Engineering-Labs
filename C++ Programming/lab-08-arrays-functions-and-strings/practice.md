# Lab 08 · Arrays, Functions, and Strings

Build confidence passing arrays to functions and making small, controlled edits to text.

Fill each `____` and run each complete program separately. Use zero for numeric input initializers and return 0 on success. All indices start at zero.

## Array Parameters

### 1. Books in height order

Read five book heights, each 1–50 cm. Print `Ordered` if no book is shorter than the book immediately before it; equal heights are allowed. Otherwise print `Reorder`.

```cpp
#include <iostream>
bool in_order(const int heights[], int count) {
    for (int i=1; i<count; ____) {
        if (heights[i] ____ heights[i-1]) return ____;
    }
    return ____;
}
int main() {
    int heights[5] = {____};
    for (int i=0; i<5; ____) std::cin >> ____;
    std::cout << (in_order(____) ? "Ordered" : "Reorder") << '\n';
    return ____;
}
```

### 2. Reading progress

Read pages finished on four days, each 0–50. Fill a separate array with cumulative pages through each day. Print its four values separated by spaces; preserve the input array.

```cpp
#include <iostream>
void cumulative(const int daily[], int through[], int count) {
    int pages = ____;
    for (int i=0; i<count; ____) {
        pages += ____;
        through[i] = ____;
    }
}
int main() {
    int daily[4] = {____}, through[4] = {0};
    for (int i=0; i<4; ____) std::cin >> ____;
    cumulative(____);
    for (int i=0; i<4; ____) std::cout << through[i] << (i==3?'\n':' ');
    return ____;
}
```

## Reference Parameters

### 3. Cancel one queued ticket

Read five ticket numbers (1–99), then a position 0–4 to remove. Update `count` and `removed` through reference parameters. Print the removed number, then the four remaining tickets on one line in their original order.

```cpp
#include <iostream>
void cancel(int tickets[], int &count, int position, int &removed) {
    removed = ____;
    for (int i=position; i<count-1; ____) tickets[i] = ____;
    ____;
}
int main() {
    int tickets[5] = {____}, count = 5;
    int position = ____, removed = 0;
    for (int i=0; i<count; ____) std::cin >> ____;
    std::cin >> ____;
    cancel(tickets, ____);
    std::cout << ____ << '\n';
    for (int i=0; i<count; ____) std::cout << tickets[i] << (i==count-1?'\n':' ');
    return ____;
}
```

### 4. Where two routes first differ

Read two routes of four stop numbers each (1–20). Set `shared` to the number of matching stops from the beginning, stopping at the first difference. Print `shared`; leave both routes unchanged.

```cpp
#include <iostream>
void shared_start(const int first[], const int second[], int count, int &shared) {
    shared = ____;
    while (shared<count && first[shared] ____ second[shared]) ____;
}
int main() {
    int first[4] = {____}, second[4] = {0}, shared = 0;
    for (int i=0; i<4; ____) std::cin >> ____;
    for (int i=0; i<4; ____) std::cin >> ____;
    shared_start(first, second, ____);
    std::cout << ____ << '\n';
    return ____;
}
```

## Character Arrays and Terminators

### 5. Hide an optional recipe note

Read a recipe line of 0–40 characters. A semicolon starts an optional note. End the string at the first semicolon, if present, and print the remaining text inside square brackets. Preserve spaces before that semicolon.

```cpp
#include <iostream>
void hide_note(char line[]) {
    int i = ____;
    while (line[i]!='\0' && line[i] ____ ';') ____;
    line[i] = ____;  // End the visible string here.
}
int main() {
    char line[____] = {};  // At least 40 characters plus the terminator.
    std::cin.getline(line, ____);
    hide_note(____);
    std::cout << '[' << ____ << "]\n";
    return ____;
}
```

## The cstring Library

### 6. Fit a display label

Read a label of 0–40 characters, then a display width 0–20. Use `strlen` to decide whether the whole label fits. Print `Fits` or `Too long` without changing the label.

```cpp
#include <iostream>
#include <cstring>
bool fits(const char label[], int width) {
    return std::strlen(label) ____ static_cast<unsigned>(width);
}
int main() {
    char label[____] = {};  // Room for the longest label and its terminator.
    int width = ____;
    std::cin.getline(label, ____);
    std::cin >> ____;
    std::cout << (fits(____) ? "Fits" : "Too long") << '\n';
    return ____;
}
```

### 7. Undo one text edit

Read a nonempty label of at most 20 characters. Use `strcpy` to save it, replace its first character with `#`, and print it. Restore the saved text with `strcpy` and print the restored label.

```cpp
#include <iostream>
#include <cstring>
int main() {
    char label[____] = {}, saved[21] = {};  // Each buffer holds 20 characters and a terminator.
    std::cin.getline(label, ____);
    std::strcpy(____);
    label[____] = '#';
    std::cout << ____ << '\n';
    std::strcpy(____);
    std::cout << ____ << '\n';
    return ____;
}
```

### 8. Append only when there is room

A label starts as `Tea`. Read a suffix of 0–20 characters, including any desired spaces. Append it with `strcat` only if the result fits in 15 visible characters. Print `Added` or `Full`, then the final label. A rejected append must leave the label unchanged.

```cpp
#include <iostream>
#include <cstring>
bool append_if_room(char label[], int capacity, const char suffix[]) {
    if (std::strlen(label)+std::strlen(suffix) ____ static_cast<unsigned>(capacity)) return ____;
    std::strcat(____);
    return ____;
}
int main() {
    char label[____] = "Tea", suffix[21] = {};  // Capacity includes the terminator.
    std::cin.getline(suffix, ____);
    std::cout << (append_if_room(label, ____) ? "Added" : "Full") << '\n';
    std::cout << ____ << '\n';
    return ____;
}
```

### 9. Stop at a text command

Read one lowercase word per line, each at most eight characters; a line `done` is guaranteed. Use `strcmp` to stop before printing `done`. Print each earlier word on its own line.

```cpp
#include <iostream>
#include <cstring>
int main() {
    char word[____] = {};  // Eight letters plus the terminator.
    std::cin.getline(word, ____);
    while (std::strcmp(word, "done") ____ 0) {
        std::cout << ____ << '\n';
        std::cin.getline(word, ____);
    }
    return ____;
}
```
