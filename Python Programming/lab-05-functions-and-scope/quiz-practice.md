# Python Programming

## Lab 05 · Functions and Scope: Practice Quiz

Write the requested function and assignment. The given variables already exist. Do not use `input()` or `print()`.

### Shared room-booking time

Define `shared_minutes(first_start, first_end, second_start, second_end)`. Each argument is an integer minute between 0 and 1440; each booking's start is at most its end.

Return the number of minutes shared by the two bookings. A booking ending exactly when the other begins shares zero minutes. A zero-length booking also shares zero minutes.

Use comparisons and `if` statements to find the later start and earlier end, then return zero when there is no positive overlap. Do not use `min()` or `max()`.

Given `first_start`, `first_end`, `second_start`, and `second_end`, call your function and store its return value in `overlap_minutes`. Leave the four given variables unchanged.
