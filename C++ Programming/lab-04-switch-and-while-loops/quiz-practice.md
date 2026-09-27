# C++ Programming

## Lab 04 · Switch Statements and While Loops: Practice Quiz

Write a complete C++ program for each task.

### 1. Until the shop queue clears

Read an initial queue size (1–20 customers). Each round supplies two integers: arrivals (0–10), then the number the shop can serve (1–20). Add arrivals first, then serve as many as possible without making the queue negative. Use a while loop and stop when the queue first becomes empty; this is guaranteed within 20 rounds. Print the rounds used and largest queue size on one line, separated by a space. Include the initial queue and the size immediately after each round’s arrivals when finding the largest size. Print no prompts.

### 2. A remote with a previous-channel button

Read the current and previous channel numbers, each 1–9. Then read character commands until `Q`, which is guaranteed within 20 commands. Use a while loop and switch statement. `N` saves the current channel as previous, then moves to the next channel, wrapping 9 to 1. `P` saves the current channel as previous, then moves to the preceding channel, wrapping 1 to 9. `R` swaps the current and previous channels. Ignore other characters. Print only the final current and previous channels on one line, separated by a space.

### 3. Lunch bundles

Read sandwich and soup counts (integers 0–20), then a flag: 1 for takeaway or 0 for eating in. A sandwich costs 18 AED and a soup costs 12 AED, but one of each together costs 25 AED. Apply as many bundles as possible; charge unmatched items at their individual prices. Add a single 2 AED packing fee only for a nonempty takeaway order. Print only the total whole-AED cost.
