# C++ Programming

## Lab 04 · Switch Statements and While Loops: Practice

Practice keeping a program’s decisions and repeated steps easy to follow.

Replace each `____` using the comments. Run each block separately inside `int main() { ... return 0; }`, with `#include <iostream>` and `using namespace std;` above it.

### Nested and Chained Decisions

#### 1. Complete a cash payment

```cpp
// Read price and cash offered (0-5000 whole cents), then changeAvailable (1 yes, 0 no).
// Too little cash: print Pay followed by the missing cents.
// Exact cash: print Exact. Excess cash: print Change and the cents returned if
// change is available; otherwise print Use card. Separate words and numbers with a space.
____ price, cash, changeAvailable;
cin >> price >> cash >> ____;
if (cash ____ price) {
    if (cash ____ price) {
        cout << "____\n";
    } else if (changeAvailable ____ 1) {
        cout << "Change " << cash ____ price << '\n';
    } ____ {
        cout << "____\n";
    }
} ____ {
    cout << "Pay " << price ____ cash << '\n';
}
```

#### 2. Choose a checkout lane

```cpp
// Read the waiting-customer counts for lanes 1, 2 and 3, each 0-20.
// Print the shortest lane's number; ties choose the lower lane number.
____ first, second, third;
cin >> first >> second >> ____;
if (first <= second ____ first <= third) {
    cout << ____ << '\n';
} else if (second ____ third) {
    cout << ____ << '\n';
} ____ {
    cout << ____ << '\n';
}
```

### Switch Statements

#### 3. Move a window blind

```cpp
// Read the blind's height (0-1000 whole mm), then one character button.
// U raises it by 50 mm; D lowers it by 50 mm. Other buttons leave it unchanged.
// Keep the final height within 0-1000 mm and print it.
____ height;
____ button;
cin >> height >> ____;
switch (____) {
case ____:
    height ____ 50;
    ____;
case ____:
    height ____ 50;
    ____;
____:
    ____;
}
if (height ____ 1000) {
    height = ____;
}
if (height ____ 0) {
    height = ____;
}
cout << ____ << '\n';
```

#### 4. Control a desk lamp

```cpp
// Read lamp state (0 off, 1 on), then a button character.
// O/o turns it on, F/f turns it off, and T/t toggles it. Others do nothing.
// Print the final state as 0 or 1.
____ on;
____ button;
cin >> on >> ____;
switch (____) {
case ____:
case ____:
    on = ____;
    ____;
case ____:
case ____:
    on = ____;
    ____;
case ____:
case ____:
    on = 1 ____ on;
    ____;
____:
    ____;
}
cout << ____ << '\n';
```

### Counter-Controlled While

#### 5. Measure a row of books

```cpp
// Read the number of books (0-10), then their thicknesses (1-80 whole mm).
// Leave a 2 mm gap between neighbouring books, with no gaps at the ends.
// Print the total shelf width needed; zero books need zero width.
____ books;
cin >> ____;
int index = ____, width = 0;  // Nothing measured yet.
while (index < ____) {
    ____ thickness;
    cin >> ____;
    width ____ thickness;
    if (index ____ 0) {
        width += ____;
    }
    index += ____;  // One more book measured.
}
cout << ____ << '\n';
```

### Sentinel-Controlled While

#### 6. Count floors travelled

```cpp
// Read the lift's first floor (0-20), then later floors (0-20), ending with -1.
// At most 20 later floors are supplied; -1 is guaranteed and is not a floor.
// Print the total floors travelled in either direction; repeated floors add zero.
____ previous, next;
cin >> previous >> ____;
int travelled = ____;  // No movement counted yet.
while (next ____ -1) {
    int change = next ____ previous;
    if (change ____ 0) {
        change = ____;
    }
    travelled ____ change;
    previous = ____;
    cin >> ____;
}
cout << ____ << '\n';
```

### Input Retries

#### 7. Choose suitcase wheels

```cpp
// Read integers from -10 to 10 until the first 2 or 4 appears.
// A valid wheel count is guaranteed within 10 entries.
// Print the accepted wheel count and number of rejected entries on one line.
____ wheels;
int rejected = ____;
cin >> ____;
while (wheels != 2 ____ wheels != 4) {
    rejected += ____;
    cin >> ____;
}
cout << wheels << ' ' << ____ << '\n';
```

### Repeated Decisions

#### 8. Adjust a vase water level

```cpp
// Read the starting water (0-1000 whole mL), then an adjustment count (0-10).
// Read that many signed whole-mL adjustments, each -1000 to 1000.
// Apply an adjustment only if the result remains within 0-1000 mL.
// Print the final water level and number of ignored adjustments on one line.
____ water, count;
cin >> water >> ____;
int processed = ____, ignored = 0;
while (processed < ____) {
    ____ adjustment;
    cin >> ____;
    int candidate = water ____ adjustment;
    if (candidate >= 0 ____ candidate <= 1000) {
        water = ____;
    } ____ {
        ignored += ____;
    }
    processed += ____;
}
cout << water << ' ' << ____ << '\n';
```
