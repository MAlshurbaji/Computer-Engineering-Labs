# C++ Programming

## Lab 05 · Loops and Nested Loops: Practice Quiz

Write a separate complete C++ program for each task. Input is whitespace-separated and follows the stated ranges. Print the requested values without input prompts.

### 1. A rising rehearsal tempo

Read a sequence of whole-number rehearsal tempos in beats per minute: each is 1..240, with `0` ending the sequence. There are at most 100 tempos; zero is not a tempo.

Print two integers: the number of times a tempo is greater than the immediately previous tempo, and the length of the longest strictly increasing run of consecutive tempos. Equal tempos start a new run. A single tempo has a run length of 1; an empty sequence produces `0 0`. Process the sequence with a loop, without arrays.

### 2. Approve a lemonade sample

Each sample supplies two integers: water in millilitres (1..400), followed by syrup in millilitres (1..100). A sample is accepted only when the water amount is exactly four times the syrup amount. A valid sample will occur within 20 entries.

Use a `do-while` loop to read at least one sample and stop at the first accepted sample. Print the total millilitres discarded from rejected samples, followed by the accepted sample's total millilitres. Include both water and syrup in each sample's volume.

### 3. Queue changes across several days

Read a day count (1..5). For each day, read an event count (1..10), then that many integers from -10 to 10. A positive event adds people to a queue, a negative event removes people, and zero changes nothing. Each day starts with an empty queue; the input never removes more people than are waiting.

Use nested loops, without arrays. After each day, print its day number (starting at 1), the largest queue size reached that day, and the number still waiting at the end. Print one line per day.
