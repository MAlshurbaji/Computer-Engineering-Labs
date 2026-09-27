# Python Programming

## Lab 03 · Decisions and Basic Loops: Practice Quiz

Write one Python code block for each task. The given variables already exist. Do not use `input()` or `print()`.

### 1. Choose the next delivery action

Given Boolean variables `address_confirmed`, `parcel_ready`, and `weekend`, assign a string to `action` using this priority:

1. If the address is unconfirmed, use `"Confirm address"`.
2. Otherwise, if the parcel is not ready, use `"Wait for parcel"`.
3. Otherwise, if it is the weekend, use `"Next weekday"`.
4. Otherwise, use `"Dispatch"`.

Use an `if`/`elif`/`else` chain. Leave the given variables unchanged.

### 2. Plan reading sessions

Given integers `pages_read`, `total_pages`, and `pages_per_session`, assume `0 <= pages_read <= total_pages <= 1000` and `pages_per_session > 0`.

Use a `while` loop to determine the number of sessions still needed, storing it in `sessions`. A session covers up to `pages_per_session` more pages; the final session may be shorter. Use a separate progress variable so the given variables remain unchanged. If the book is already finished, `sessions` must be zero.
