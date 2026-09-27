# C++ Programming

## Lab 06 · Functions and Random Values: Practice Quiz

Write a separate complete C++ program for each task. Input is whitespace-separated and follows the stated ranges. Print the requested values without input prompts.

### 1. Square stickers on a sheet

Read a rectangular sheet's width and height in centimetres (whole numbers, 1..100), followed by one square sticker's area in square centimetres (one of `4`, `9`, `16`, or `25`). Stickers form straight rows and columns, touch edge to edge, and cannot extend beyond the sheet.

Define `double stickerSide(double area)` using `std::sqrt`, and `int fitAlong(int length, double side)` returning the number of whole stickers that fit along that length. Call these functions from `main` to print the column count, row count, total sticker count, and unused sheet area in square centimetres. Print all four results as integers on one line.

### 2. Pegs for several clotheslines

Define `int pegsNeeded(int items, bool share)`. An empty line needs zero pegs. Otherwise, when `share` is true, neighbouring items share a peg and the line needs one more peg than its item count. When false, every item needs two separate pegs.

Read a line count (1..8), then an item count (0..30) and share flag (`0` or `1`) for each line. Call the function for every line. Print the total pegs needed across all lines and the largest peg requirement for any single line. Use a loop without arrays.

### 3. Two envelopes on a circle

Ten party-game envelopes are arranged in a circle, numbered 1..10; envelopes 1 and 10 are neighbours. Select two distinct envelopes that are not neighbours. Selections may repeat across different pairs.

Define `int chooseFirst()` to return a random envelope number, and `int chooseSecond(int first)` to return a random envelope satisfying the rule relative to `first`. Use `std::rand` inside the functions. In `main`, read an unsigned seed (0..10000) and a pair count (1..5), call `std::srand` once, and use the functions to print that many pairs, one pair per line. Any pair sequence satisfying the rules is valid; no particular random sequence is required.
