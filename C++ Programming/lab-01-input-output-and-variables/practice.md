# Lab 01 · Input, Output and Variables

Get comfortable building small C++ programs for everyday jobs.

Fill each `____` using the comments. Run each block separately.

Place each block inside `int main() { ... }`, with `#include <iostream>` and `using namespace std;` above `main`.

## Output and Newlines

```cpp
// Complete a parcel collection sign: Collection desk on line 1, Open on line 2.
cout << ____ << '\n';
cout << ____ << '\n';
```

## Variables and Data Types

```cpp
// A bus leaves from platform C. There are 14 waiting passengers.
char platform = ____;
int passengers = ____;
cout << "Platform " << ____ << '\n';
cout << "Waiting: " << ____ << '\n';
```

```cpp
// Two refill bottles contain 1.25 litres and 0.75 litres.
____ first_litres = 1.25;
____ second_litres = 0.75;
double total_litres = first_litres ____ second_litres;
cout << "Total litres: " << ____ << '\n';
```

## Input Streams

```cpp
// Read two whole-number locker labels, 1 to 99. Display the second label first.
____ first = 0, second = 0;
cin >> first ____ second;
cout << ____ << ' ' << first << '\n';
```

```cpp
// Read a shelf letter A-Z, then its number of boxes (0-50).
____ shelf = 'A';  // Initial value before reading the real label.
____ boxes = 0;
cin ____ shelf >> boxes;
cout << boxes << " boxes on shelf " << ____ << '\n';
```

## Assignment and Reassignment

```cpp
// There are 9 clean towels. Three are used, then two clean towels are added.
int clean = ____;
clean = clean ____ 3;
cout << "After use: " << ____ << '\n';
clean = clean ____ 2;
cout << "After restocking: " << ____ << '\n';
```

## Simple Arithmetic

```cpp
// Read the number of small and large gift bags (0-20 each).
// A small bag needs 2 stickers; a large bag needs 3.
____ small = 0, large = 0;
cin >> small >> ____;
int stickers = small * 2 ____ large * 3;
cout << ____ << '\n';
```

```cpp
// Read the length of one poster (0.1-5.0 metres). Three posters go side by side.
// Two gaps, each 0.05 metres, separate the posters. Print the total width.
____ poster_metres = 0.0;
cin >> ____;
double width_metres = 3 * poster_metres + 2 * ____;
cout << ____ << '\n';
```
