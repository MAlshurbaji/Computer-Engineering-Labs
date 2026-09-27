# Lab 08 · Arrays, Functions, and Strings quiz practice

Write a separate C++ program for each task. Use the stated inputs and outputs; all input follows the stated ranges.

## 1. Insert a bookmark

Read `n` (0–8), then `n` bookmark page numbers in nondecreasing order (1–500), then one new page number in the same range.
Store the bookmarks in an eight-element array. Write `bool insert_page(int pages[], int &n, int page)`.
If there is room, insert the new page after all existing equal page numbers, preserve the order, increase `n`, and return true. If full, return false without changing the array or `n`.
Print `Added` or `Full` on the first line, `n` on the second, and the bookmark values separated by spaces on the third.

## 2. Share two music queues

Read `n` (0–8), its `n` song numbers, then `m` (0–8), its `m` song numbers. Song numbers are 1–99.
Write `void combine(const int first[], int n, const int second[], int m, int result[], int &used)`.
Take one song from the first queue, then one from the second, repeating while both have songs. Append any remaining songs in their original order. Preserve both input arrays; `result` has capacity 16.
Print `used`, then the combined queue on the next line, with spaces between song numbers. Print an empty second line when both queues are empty.

## 3. Remove an aside from a note

Read a line of 0–60 characters into a character array. It contains either no parentheses or exactly one matching pair `(...)`, with no parentheses inside the pair.
Write `int erase_aside(char note[])` to remove that pair and everything between it, preserving every other character and space. Return the number of removed characters, including the parentheses; return 0 when no pair exists.
Use character arrays, not `std::string`. Print the returned count, then the edited note on the next line.
