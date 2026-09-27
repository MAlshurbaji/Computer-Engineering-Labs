# Lab 02 · Arithmetic and Type Conversion

Use numbers and units to solve small planning problems in C++.

Fill each `____` using the comments. Run each block separately.

Place each block inside `int main() { ... }`, with `#include <iostream>` and `using namespace std;` above `main`.

## Arithmetic and Grouping

```cpp
// A snack stall sells 4 juice cartons at 3 AED and 2 sandwiches at 7 AED.
// Calculate the total before subtracting a 5 AED voucher.
int cartons = ____, sandwiches = 2;
int subtotal = cartons * 3 ____ sandwiches * 7;
int paid = subtotal ____ 5;
cout << ____ << '\n';
```

```cpp
// Join 5 strips, each 30 cm long. Each join overlaps by 2 cm.
// Count the joins before subtracting the total overlap from the combined length.
int strips = ____;
int joins = strips ____ 1;
int length_cm = strips * 30 - joins * ____;
cout << ____ << '\n';
```

## Integer Division and Remainders

```cpp
// Divide 23 photographs among 4 album pages as evenly as possible.
// First give every page the same count; report how many photos still need a page.
int photos = ____, pages = 4;
int each_page = photos ____ pages;
int still_to_place = photos ____ pages;
cout << each_page << ' ' << ____ << '\n';
```

```cpp
// Read minutes after midnight, from 0 to 1439. Print hour and minute separately.
____ total_minutes = 0;
cin >> ____;
int hour = total_minutes ____ 60;
int minute = total_minutes ____ 60;
cout << hour << ' ' << ____ << '\n';
```

```cpp
// A numbered cloakroom has 6 hooks per row. Read a hook label from 1 to 60.
// Report its row and position within that row, both starting at 1.
____ label = 0;
cin >> ____;
int zero_based = label ____ 1;
int row = zero_based / 6 ____ 1;
int position = zero_based % 6 ____ 1;
cout << row << ' ' << ____ << '\n';
```

## Integer and Decimal Calculations

```cpp
// Compare whole AED per pizza slice with the decimal price.
// A pizza costs 25 AED and has 8 slices. Convert before dividing for decimal AED.
int price = ____, slices = 8;
int whole_aed = price ____ slices;
double exact_aed = ____(price) / slices;
cout << whole_aed << ' ' << ____ << '\n';
```

```cpp
// A craft ribbon measures 6.75 metres. Keep its whole metres and fractional part.
// Converting a nonnegative double to int discards its fractional part.
double ribbon = ____;
int whole = ____(ribbon);
double fraction = ribbon ____ whole;
cout << whole << ' ' << ____ << '\n';
```

## Character and Numeric Values

```cpp
// Read one digit character, '0' through '9', from a parcel shelf label.
// Digit characters are consecutive: subtract '0' to obtain the numeric value.
// Print the next numeric label; after '9', print 10 without wrapping.
____ digit = '0';
cin >> ____;
int number = digit ____ '0';
int next_number = number ____ 1;
cout << ____ << '\n';
```
