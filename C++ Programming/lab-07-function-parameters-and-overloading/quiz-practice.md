# C++ Programming

## Lab 07 · Function Parameters and Overloading: Practice Quiz

Write a complete C++ program for each task. Use the requested functions and print no input prompts.

### 1. Slide two curtain hooks

Define `bool slide(int &left, int &right, int shift)`. Two hooks lie on a 100 cm rail, with `0 <= left < right <= 100`. Move both by the signed `shift` only if both resulting positions remain within 0–100 cm, including endpoints. Return `true` when the move is accepted, including a zero shift; otherwise return `false` and leave both positions unchanged.

Read the two starting positions, a move count (0–8), then that many shifts (−100 to 100 cm). All inputs are integers. Call `slide` for every shift. Print `1` for each accepted move or `0` for each rejection, one per line, then the final left and right positions on one line. Keep all input and output in `main`.

### 2. Round a ribbon cutting request

Define overloaded functions `int cutLength(int requested)` and `int cutLength(int requested, int step)`. The two-argument function returns the smallest multiple of `step` that is at least `requested`. Zero requested length returns zero. The one-argument function uses a standard step of 5 cm by calling the two-argument function. Neither function prints.

Read a requested length (0–1000 whole cm) and a custom step (1–100 whole cm). Call both overloads and print the standard cut length followed by the custom cut length on one line, separated by a space.

### 3. Balance two fruit bowls

Define `bool uneven(int first, int second)` to return whether the counts differ by at least two. Define `int balanceBowls(int &first, int &second)`. This function repeatedly calls `uneven`; while it returns true, move one fruit from the fuller bowl to the other bowl. Update both reference parameters and return the number of moves. Neither function reads or prints.

Read two starting fruit counts (integers 0–50). Call `balanceBowls` and print the move count, final first-bowl count, and final second-bowl count on one line, separated by spaces. Bowls whose counts already differ by at most one need no moves.
