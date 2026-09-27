# C++ Programming

## Lab 03 · Conditional Statements: Practice

Build confidence turning everyday rules into clear decisions.

Replace each `____` using the comments. Run each block separately inside `int main() { ... return 0; }`, with `#include <iostream>` and `using namespace std;` above it.

### If Statements

#### 1. Limit a voucher

```cpp
// Read a whole-AED shopping subtotal (0-200) and voucher value (0-20).
// A voucher cannot cover more than the subtotal. Print the amount to pay.
____ subtotal, voucher;
cin >> subtotal >> ____;
if (voucher ____ subtotal) {
    voucher = ____;
}
cout << subtotal ____ voucher << '\n';
```

#### 2. Printer supplies

```cpp
// Read paper and ink flags: 1 means available, 0 means missing.
// Print Add paper when paper is missing, then Replace ink when ink is missing.
// If both are available, print nothing.
____ paper, ink;
cin >> paper >> ____;
if (paper ____ 0) {
    cout << "____\n";
}
if (ink ____ 0) {
    cout << "____\n";
}
```

### If-Else and Logical Conditions

#### 3. Choose a curtain side

```cpp
// Read free space on the left and right of a window, in whole cm (0-100).
// Print Left for the side with more room; ties also choose Left. Otherwise print Right.
____ left, right;
cin >> left >> ____;
if (left ____ right) {
    cout << "____\n";
} ____ {
    cout << "____\n";
}
```

#### 4. Overlapping oven bookings

```cpp
// Read start/end minutes for two oven bookings: aStart aEnd bStart bEnd.
// Times are whole minutes from 0 to 1440; each start is earlier than its end.
// Print Overlap only if the bookings share positive time; touching endpoints are Separate.
____ aStart, aEnd, bStart, bEnd;
cin >> aStart >> aEnd >> bStart >> ____;
if (aStart < bEnd ____ bStart < aEnd) {
    cout << "____\n";
} ____ {
    cout << "____\n";
}
```

#### 5. Dry clothes outside

```cpp
// Read rain and roof flags, each 0 or 1; 1 means rain/a roof is present.
// Clothes can go outside when there is no rain OR a roof protects them.
// Print Hang outside or Use indoor rack.
____ rain, roof;
cin >> rain >> ____;
if (____rain ____ roof) {
    cout << "____\n";
} ____ {
    cout << "____\n";
}
```

### Else-If Chains

#### 6. Level a picture

```cpp
// Read the heights of two picture hooks in whole cm (0-300).
// Raise the lower hook: print Raise first, Raise second, or Aligned when equal.
____ first, second;
cin >> first >> ____;
if (first ____ second) {
    cout << "____\n";
} else if (second ____ first) {
    cout << "____\n";
} ____ {
    cout << "____\n";
}
```

#### 7. Choose a meal source

```cpp
// Read ready fresh meals and frozen meals, each 0-20.
// Prefer Fresh if any fresh meal remains; otherwise use Frozen if available.
// Print Cook only when both supplies are empty.
____ fresh, frozen;
cin >> fresh >> ____;
if (fresh ____ 0) {
    cout << "____\n";
} else if (frozen ____ 0) {
    cout << "____\n";
} ____ {
    cout << "____\n";
}
```

### Nested Decisions

#### 8. Prepare a cup of tea

```cpp
// Read mug and tea-bag availability flags: 1 means available, 0 means missing.
// Without a mug, print Find a mug, regardless of tea bags.
// With a mug, print Steep tea if a tea bag is available; otherwise print Use loose tea.
____ mug, teaBag;
cin >> mug >> ____;
if (mug ____ 1) {
    if (teaBag ____ 1) {
        cout << "____\n";
    } ____ {
        cout << "____\n";
    }
} ____ {
    cout << "____\n";
}
```
