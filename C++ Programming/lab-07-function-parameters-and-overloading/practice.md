# C++ Programming

## Lab 07 · Function Parameters and Overloading: Practice

Build small functions that return useful results and update the right values.

Replace each `____` and run each block as a separate program. Initialize input/output variables to zero, or `false` for a Boolean. Return zero from `main`.

### Parameters and Return Values

#### 1. Check an exact payment

```cpp
#include <iostream>
using namespace std;
// Return true only when notes plus coins exactly equal the price, all in cents.
____ exactPayment(int price, int notes, int coins);
int main() {
    // Read price, notes and coins: whole cents, each 0-2000. Print 1 for exact, else 0.
    int price = ____, notes = 0, coins = 0;
    cin >> price >> notes >> ____;
    cout << exactPayment(price, notes, ____) << '\n';
    return ____;
}
bool exactPayment(int price, int notes, ____ coins) {
    return notes + coins ____ price;
}
```

#### 2. Preview a thermostat change

```cpp
#include <iostream>
using namespace std;
// Adjust a value copy and return the preview; leave the caller's setting unchanged.
double preview(double setting, ____ change) {
    setting ____ change;
    return ____;
}
int main() {
    // Read a setting (0-30 degrees C) and signed change (-5 to 5 degrees C).
    // Both may have one decimal place; the resulting setting is also in 0-30.
    // Print the unchanged setting, then the preview, separated by a space.
    double setting = ____, change = 0;
    cin >> setting >> ____;
    double proposed = preview(setting, ____);
    cout << setting << ' ' << ____ << '\n';
    return ____;
}
```

### Reference Parameters

#### 3. Use reward points

```cpp
#include <iostream>
using namespace std;
// Subtract used points from the caller's balance. The function prints nothing.
void redeem(int ____ points, int used) {
    points ____ used;
}
int main() {
    // Read a point balance (0-1000), then points to use (0 up to that balance).
    // Call redeem and print the changed balance.
    int points = ____, used = 0;
    cin >> points >> ____;
    redeem(____, used);
    cout << ____ << '\n';
    return ____;
}
```

#### 4. Share small chores

```cpp
#include <iostream>
using namespace std;
// Share total chores as evenly as possible. The first person gets any extra chore.
// Write the two counts through first and second; do not return a value.
____ shareChores(int total, int &first, int &second) {
    second = total ____ 2;
    first = total ____ second;
}
int main() {
    // Read a chore count (0-20). Print the first and second counts on one line.
    int total = ____, first = 0, second = 0;
    cin >> ____;
    shareChores(total, first, ____);
    cout << first << ' ' << ____ << '\n';
    return ____;
}
```

#### 5. Scale a recipe in place

```cpp
#include <iostream>
using namespace std;
// Multiply both of the caller's ingredient amounts by the number of batches.
void scaleRecipe(double ____ flour, double &milk, int batches) {
    flour ____ batches;
    milk ____ batches;
}
int main() {
    // Read flour (0-500 grams), milk (0-1000 mL), then whole batches (1-5).
    // Amounts may have one decimal place. Print the changed flour and milk amounts.
    double flour = ____, milk = 0;
    int batches = ____;
    cin >> flour >> milk >> ____;
    scaleRecipe(flour, milk, ____);
    cout << flour << ' ' << ____ << '\n';
    return ____;
}
```

### Loops and Helper Calls

#### 6. Two repeating kitchen timers

```cpp
#include <iostream>
using namespace std;
// Timers ring every first and second minutes. Both ring at minute zero.
// Return the first positive minute when both ring together.
int ringTogether(int first, ____ second) {
    int minute = ____;  // Start at the first timer's first positive ring.
    while (minute % second ____ 0) {
        minute ____ first;
    }
    return ____;
}
int main() {
    // Read two whole-minute intervals (1-12). Print the shared ring time in minutes.
    int first = ____, second = 0;
    cin >> first >> ____;
    cout << ringTogether(first, ____) << '\n';
    return ____;
}
```

#### 7. Cut from separate tape rolls

```cpp
#include <iostream>
using namespace std;
// Return the number of whole pieces cut from one roll; leftover tape is unused.
int piecesFrom(int length, ____ piece) {
    return length ____ piece;
}
// Use piecesFrom twice. The two rolls cannot be joined to make another piece.
int totalPieces(int first, int second, ____ piece) {
    return piecesFrom(first, piece) ____ piecesFrom(second, piece);
}
int main() {
    // Read two roll lengths (0-200 cm), then a piece length (1-50 cm), all whole cm.
    // Call totalPieces and print the total number of whole pieces.
    int first = ____, second = 0, piece = 0;
    cin >> first >> second >> ____;
    cout << totalPieces(first, second, ____) << '\n';
    return ____;
}
```

### Function Overloading

#### 8. Choose single- or double-sided printing

```cpp
#include <iostream>
using namespace std;
// One argument means one page per sheet.
____ sheets(int pages) {
    return ____;
}
// With twoSided true, put at most two pages on each sheet. Keep a final odd page.
// With twoSided false, call the one-argument overload.
int sheets(int pages, ____ twoSided) {
    if (____) {
        return (pages + 1) ____ 2;
    }
    return ____;
}
int main() {
    // Read pages (0-100), then twoSided (0 false, 1 true).
    // Print sheets(pages), followed by the chosen mode's count, on one line.
    int pages = ____;
    bool twoSided = ____;
    cin >> pages >> ____;
    cout << sheets(pages) << ' ' << sheets(pages, ____) << '\n';
    return ____;
}
```
