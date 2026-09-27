# Lab 08 · Strings and Text Files quiz practice

Write a separate C program for each task. Use the stated inputs and outputs; assume numeric input has the stated type.

## 1. Locate a Word

Read a line of at most 80 characters containing lowercase letters and ordinary spaces, then read a positive word number `k`.
Consecutive spaces are allowed. A word is a nonempty run of letters.
Write `int word_start(const char text[], int k)` returning the zero-based index of the first character of word `k`, or −1 if that word does not exist.
Remove the input newline before calling the function. Print only the returned index.

## 2. Expand Tab Characters in a Note

Read `draft.txt` character by character and write `readable.txt`.
Replace every tab with exactly four spaces, regardless of its position. Preserve every other character, including newlines.
Use `int` for the value returned by `fgetc` so it can represent EOF. Count the tabs replaced and print that count.
Check both file opens; on failure print `File error`, close any stream already open, and exit with status 1. Otherwise close both streams and exit successfully.

