# Lab 09 · Two-Dimensional Arrays and Pointers

Practice working with small grids and keeping track of the memory your arrays own.

Fill each `____` and run each complete program separately. Use zero for numeric input initializers and return 0 on success. All indices start at zero.

## Fixed Two-Dimensional Arrays

### 1. Mark a cross on a craft tile

Fill a 3 × 3 tile with zeroes. A function marks both diagonals with 1; the diagonals share the center cell. Print three rows, with spaces between values.

```cpp
#include <iostream>
void mark_cross(int tile[][3]) {
    for (int r=0; r<3; ____) {
        tile[r][____] = 1;
        tile[r][____] = 1;
    }
}
int main() {
    int tile[3][3] = {____};
    mark_cross(____);
    for (int r=0; r<3; ____) {
        for (int c=0; c<3; ____) std::cout << tile[r][c] << (c==2?'\n':' ');
    }
    return ____;
}
```

### 2. Nearby plant pots

Read a 3 × 3 tray in row order (`1` for a pot, `0` for empty), then a row and column, both 0–2. Count pots directly above, below, left, and right of that cell. Exclude diagonals and the chosen cell itself.

```cpp
#include <iostream>
int neighbors(const int tray[][3], int r, int c) {
    int pots = ____;
    if (r>0) pots += tray[____][c];
    if (r<2) pots += tray[____][c];
    if (c>0) pots += tray[r][____];
    if (c<2) pots += tray[r][____];
    return ____;
}
int main() {
    int tray[3][3] = {____}, row = 0, column = 0;
    for (int r=0; r<3; ____) {
        for (int c=0; c<3; ____) std::cin >> tray[r][c];
    }
    std::cin >> row >> ____;
    std::cout << neighbors(tray, ____) << '\n';
    return ____;
}
```

### 3. Follow a winding display route

Read eight exhibit numbers (1–99) into a 2 × 4 grid in row order. Print row 0 left to right, then row 1 right to left, all on one line separated by spaces.

```cpp
#include <iostream>
void show_route(const int exhibits[][4]) {
    for (int r=0; r<2; ____) {
        for (int step=0; step<4; ____) {
            int column = (r==0 ? step : ____);
            std::cout << exhibits[r][____] << (r==1 && step==3?'\n':' ');
        }
    }
}
int main() {
    int exhibits[2][4] = {____};
    for (int r=0; r<2; ____) {
        for (int c=0; c<4; ____) std::cin >> exhibits[r][c];
    }
    show_route(____);
    return ____;
}
```

## Pointers and Array Ranges

### 4. Adjust one lamp

Four lamps start at brightness levels 10, 20, 30, and 40. Read a lamp index 0–3 and a new brightness 0–100. Point to that array element and change it through the pointer; print all four levels.

```cpp
#include <iostream>
int main() {
    int levels[4] = {____};
    int index = ____, brightness = 0;
    std::cin >> index >> ____;
    int *chosen = ____;
    ____ = brightness;
    for (int i=0; i<4; ____) std::cout << levels[i] << (i==3?'\n':' ');
    return ____;
}
```

### 5. Pause part of a watering schedule

Read six watering durations (0–30), then `start` and `stop` with `0 <= start <= stop <= 6`. Set durations at indices from `start` up to, but excluding, `stop` to zero through pointers. An empty range changes nothing. Print all six durations.

```cpp
#include <iostream>
void pause_range(int *first, int *past_last) {
    while (first ____ past_last) {
        *first = ____;
        ____;
    }
}
int main() {
    int minutes[6] = {____}, start = 0, stop = 0;
    for (int i=0; i<6; ____) std::cin >> minutes[i];
    std::cin >> start >> ____;
    pause_range(minutes+start, ____);
    for (int i=0; i<6; ____) std::cout << minutes[i] << (i==5?'\n':' ');
    return ____;
}
```

## Dynamic Two-Dimensional Arrays

### 6. Put a border around a small picture

Read rows and columns, each 1–5. Allocate each row separately with `new[]`. Fill border cells with 1 and interior cells with 0, then print the grid. A single row or column consists entirely of border cells. Release every row and the row-pointer array.

```cpp
#include <iostream>
int main() {
    int rows = ____, columns = 0;
    std::cin >> rows >> ____;
    int **picture = new int*[____];
    for (int r=0; r<rows; ____) picture[r] = new int[____];
    for (int r=0; r<rows; ____) {
        for (int c=0; c<columns; ____) {
            picture[r][c] = (r==0 || r==rows-1 || c==0 || c==____) ? 1 : 0;
            std::cout << ____ << (c==columns-1?'\n':' ');
        }
    }
    for (int r=0; r<rows; ____) delete[] ____;
    delete[] ____;
    return ____;
}
```

### 7. Make alternating floor tiles

Read rows and columns, each 1–5. A function fills a dynamically allocated grid with alternating 0 and 1: the top-left tile is 0, and every horizontal or vertical neighbor has the other value. Print the grid and release its memory.

```cpp
#include <iostream>
void fill_tiles(int **tiles, int rows, int columns) {
    for (int r=0; r<rows; ____) {
        for (int c=0; c<columns; ____) tiles[r][c] = ____;
    }
}
int main() {
    int rows = ____, columns = 0;
    std::cin >> rows >> ____;
    int **tiles = new int*[____];
    for (int r=0; r<rows; ____) tiles[r] = new int[____];
    fill_tiles(tiles, ____);
    for (int r=0; r<rows; ____) {
        for (int c=0; c<columns; ____) std::cout << tiles[r][c] << (c==columns-1?'\n':' ');
    }
    for (int r=0; r<rows; ____) delete[] ____;
    delete[] ____;
    return ____;
}
```

### 8. Enlarge a four-tile drawing

Read a 2 × 2 drawing (values 0–9), then an integer scale 1–3. Allocate a new square grid in which each original tile becomes a `scale × scale` block of the same value. Print it and release all allocated rows.

```cpp
#include <iostream>
int main() {
    int original[2][2] = {____}, scale = 0;
    for (int r=0; r<2; ____) {
        for (int c=0; c<2; ____) std::cin >> original[r][c];
    }
    std::cin >> ____;
    int side = ____;
    int **large = new int*[____];
    for (int r=0; r<side; ____) large[r] = new int[____];
    for (int r=0; r<side; ____) {
        for (int c=0; c<side; ____) {
            large[r][c] = original[____][____];
            std::cout << ____ << (c==side-1?'\n':' ');
        }
    }
    for (int r=0; r<side; ____) delete[] ____;
    delete[] ____;
    return ____;
}
```

## Pointers to Fixed-Width Rows

### 9. Read a calendar column

Read `weeks` (1–4), then `weeks × 3` activity codes (0–9), then a day index 0–2. Allocate one dynamic array of three-element rows. A function prints the selected day for every week on one line. Delete the allocation once.

```cpp
#include <iostream>
void show_day(const int plan[][3], int weeks, int day) {
    for (int r=0; r<weeks; ____) std::cout << plan[r][____] << (r==weeks-1?'\n':' ');
}
int main() {
    int weeks = ____, day = 0;
    std::cin >> ____;
    int (*plan)[3] = new int[____][3];  // One allocation; row width is fixed at three.
    for (int r=0; r<weeks; ____) {
        for (int c=0; c<3; ____) std::cin >> plan[r][c];
    }
    std::cin >> ____;
    show_day(plan, ____);
    delete[] ____;
    return ____;
}
```
