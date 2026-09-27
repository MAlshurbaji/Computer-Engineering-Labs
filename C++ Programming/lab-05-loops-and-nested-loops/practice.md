# C++ Programming

## Lab 05 · Loops and Nested Loops: Practice

Work through one small program at a time—you can build this step by step. Replace each `____`, then compile and run that block as its own C++ program. Initialize temporary input variables and counters to zero unless a comment gives another start value. `main` returns zero on success. All input follows the stated ranges.

### while Loops and Changing State

#### 1. Meet on the staircase

```cpp
#include <iostream>
int main() {
    // Start on steps 0 and 11. Each round, the lower person climbs 2 steps;
    // the upper person descends 1. Count rounds until they meet or pass.
    int lower = ____, upper = 11, rounds = 0;
    while (____) {
        lower += ____;
        upper -= ____;
        ++____;
    }
    // Print rounds, then the two final step numbers.
    std::cout << ____ << ' ' << lower << ' ' << upper << '\n';
    return ____;
}
```

#### 2. Stop reviewing blurry photos

```cpp
#include <iostream>
int main() {
    // Read photo flags: 1 = clear, 0 = blurry. Stop after TWO blurry photos in a row.
    // A clear photo resets that streak. The input eventually ends the review.
    int blurryRun = ____, clearCount = 0, clear = 0;
    while (____) {
        std::cin >> ____;
        if (____) {
            ++____;
            blurryRun = ____;
        } else {
            ++____;
        }
    }
    // Print the total clear photos encountered.
    std::cout << ____ << '\n';
    return ____;
}
```

### do-while Loops and Input Validation

#### 3. Choose a label width

```cpp
#include <iostream>
int main() {
    // Read integer widths until one is in 1..6 cm, including both endpoints.
    // Count every entry, including the accepted one. A valid entry will occur.
    int width = ____, entries = 0;
    ____ {
        std::cin >> ____;
        ++____;
    } while (____);
    // Print the accepted width and number of entries.
    std::cout << ____ << ' ' << entries << '\n';
    return ____;
}
```

#### 4. Keep the final recording take

```cpp
#include <iostream>
int main() {
    // Each take supplies its duration (1..300 seconds), then y to retry or n to finish.
    // At least one take is made. Keep only the final duration; start retry as y.
    int seconds = ____, takes = 0;
    char retry = ____;
    ____ {
        std::cin >> ____ >> retry;
        ++____;
    } while (____);
    // Print take count and final duration, not the sum of durations.
    std::cout << ____ << ' ' << seconds << '\n';
    return ____;
}
```

### for Loops and Previous Values

#### 5. Count changes between plank widths

```cpp
#include <iostream>
int main() {
    // Read four plank widths in cm (1..50). Count unequal NEIGHBOURING pairs.
    int previous = ____, current = 0, changes = 0;
    std::cin >> ____;
    for (int plank = 2; ____; ++plank) {
        std::cin >> ____;
        if (____) {
            ++____;
        }
        previous = ____;
    }
    std::cout << ____ << '\n';
    return ____;
}
```

#### 6. Return to the starting point

```cpp
#include <iostream>
int main() {
    // Read six moves along a straight path: each is -1 (left) or 1 (right).
    // Start at position 0. Count returns to 0 AFTER a move, excluding the start.
    int position = ____, returns = 0, move = 0;
    for (int step = 0; ____; ++step) {
        std::cin >> ____;
        position += ____;
        if (____) {
            ++____;
        }
    }
    // Print the final position and return count.
    std::cout << ____ << ' ' << returns << '\n';
    return ____;
}
```

### Nested Loops and Per-Group State

#### 7. Pay with gift vouchers

```cpp
#include <iostream>
int main() {
    // Find all ways to pay exactly 14 AED using gift vouchers worth 2 AED or 5 AED.
    // Print the 2 AED voucher count then 5 AED voucher count for each combination.
    for (int twos = 0; ____; ++twos) {
        for (int fives = 0; ____; ++fives) {
            if (____) {
                std::cout << ____ << ' ' << fives << '\n';
            }
        }
    }
    return ____;
}
```

#### 8. Check windows before leaving

```cpp
#include <iostream>
int main() {
    // Check three rooms. For EACH room, read window count (1..4), then its flags:
    // 1 = closed, 0 = open. Count rooms where EVERY window is closed.
    int readyRooms = ____, windows = 0, closed = 0;
    for (int room = 0; ____; ++room) {
        std::cin >> ____;
        bool allClosed = ____; // Start true for each room; an open window cancels it.
        for (int window = 0; ____; ++window) {
            std::cin >> ____;
            if (____) {
                allClosed = ____;
            }
        }
        if (____) {
            ++____;
        }
    }
    std::cout << ____ << '\n';
    return ____;
}
```
