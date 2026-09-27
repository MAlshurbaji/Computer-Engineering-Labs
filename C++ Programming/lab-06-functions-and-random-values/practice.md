# C++ Programming

## Lab 06 · Functions and Random Values: Practice

Work through one small program at a time—you can build this step by step. Replace each `____`, then compile and run that block as its own C++ program. Initialize temporary input variables and counters to zero unless a comment gives another start value. `main` returns zero on success. All input follows the stated ranges.

### Predefined cmath Functions

#### 1. Ribbon across a gift box

```cpp
#include <iostream>
#include <cmath>
int main() {
    // The top is 12 by 5 cm. Lay ribbon across its diagonal and add two 3 cm tails.
    // A rectangle diagonal is sqrt(width squared + height squared). Use std::pow.
    double width = ____, height = 5.0, tail = 3.0;
    double diagonal = std::sqrt(std::pow(width, ____) + std::pow(height, 2));
    double ribbon = diagonal + ____;
    std::cout << ____ << '\n'; // Print the required centimetres.
    return ____;
}
```

#### 2. Repeated text resizing

```cpp
#include <iostream>
#include <cmath>
int main() {
    // A 16-pixel font becomes 1.5 times as large at each of three resize steps.
    // Compute the final size directly with std::pow, without a loop.
    double original = ____, factor = 1.5;
    int steps = ____;
    double pixels = original * std::pow(____, steps);
    std::cout << ____ << '\n';
    return ____;
}
```

### Function Parameters and Return Values

#### 3. Evenly space hooks

```cpp
#include <iostream>
// Place hooks between two ends of a rail; all gaps, including end gaps, are equal.
// lengthCm > 0 and hookCount >= 1. Return the distance between adjacent positions.
double gapSize(double lengthCm, int hookCount) {
    return ____;
}
int main() {
    // A 90 cm rail has two hooks. Print the gap in cm using gapSize.
    double rail = ____;
    int hooks = ____;
    double gap = ____;
    std::cout << ____ << '\n';
    return ____;
}
```

#### 4. Minutes until a clock time

```cpp
#include <iostream>
// start and finish are minutes since midnight, both in 0..1439.
// Return the forward wait; equal times mean zero, earlier finish means tomorrow.
int minutesUntil(int start, int finish) {
    if (____) {
        finish += ____; // One day has 1440 minutes.
    }
    return ____;
}
int main() {
    // Read start then finish. Call minutesUntil and print the wait in minutes.
    int start = ____, finish = 0;
    std::cin >> ____ >> finish;
    std::cout << ____ << '\n';
    return ____;
}
```

### Boolean Functions and Repeated Calls

#### 5. Quiet hours across midnight

```cpp
#include <iostream>
// minute is in 0..1439. Quiet hours include 22:00 and end just before 07:00.
// Those boundaries are minutes 1320 and 420 since midnight.
bool isQuietTime(int minute) {
    return ____;
}
int main() {
    // Read one minute value. Print 1 during quiet hours, otherwise 0.
    int minute = ____;
    std::cin >> ____;
    std::cout << ____ << '\n';
    return ____;
}
```

#### 6. Check three hanging cords

```cpp
#include <iostream>
// All lengths are cm. Each end uses knotCm of cord; exact remaining length is enough.
bool reachesHooks(int cordCm, int distanceCm, int knotCm) {
    return ____;
}
int main() {
    // Hooks are 80 cm apart. Each knot uses 5 cm. Read three cord lengths (1..200).
    // Use reachesHooks for each cord; print how many can reach both hooks.
    int suitable = ____, length = 0;
    for (int cord = 0; ____; ++cord) {
        std::cin >> ____;
        if (____) {
            ++____;
        }
    }
    std::cout << ____ << '\n';
    return ____;
}
```

### Random Values and Function Calls

#### 7. Pick a bookmark page

```cpp
#include <iostream>
#include <cstdlib>
// Return a page number from 1 through 12 using std::rand.
int bookmarkPage() {
    return ____;
}
int main() {
    // Seed once with 19, then print one call to bookmarkPage.
    // The particular page can differ across C++ implementations.
    std::srand(____);
    int page = ____;
    std::cout << ____ << '\n';
    return ____;
}
```

#### 8. Choose two different playlists

```cpp
#include <iostream>
#include <cstdlib>
// Playlists are numbered 1..6. Move 1..5 positions forward, wrapping after 6.
// Return a playlist different from first, which is already in 1..6.
int differentPlaylist(int first) {
    int offset = ____;
    return ____;
}
int main() {
    // Read a seed in 0..1000. Seed once; choose first with std::rand in 1..6.
    unsigned int seed = ____;
    std::cin >> ____;
    std::srand(____);
    int first = ____;
    int second = ____;
    std::cout << ____ << ' ' << second << '\n';
    return ____;
}
```
