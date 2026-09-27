# Lab 09 · Practice Quiz

## 1. Library pickup

Define `plan_pickup(stock, requests)`. `stock` maps book titles to nonnegative copy counts; `requests` is an ordered list of titles. Accept each request only if a copy remains, then reduce that title’s remaining count by one. Unknown titles are unavailable. Return `(accepted_titles, remaining_stock)`, preserving accepted request order and leaving both inputs unchanged. Call it with the supplied variables and store the tuple in `pickup_plan`. Do not use `input()` or `print()`.

## 2. Unfinished reminders

Define `write_reminders(source_path, output_path)`. Each source line has the form `task|status`, where status is `open` or `done`, with no surrounding spaces. Write only the task names marked `open` to the output file, one per line, preserving order. Replace previous output contents and return the number of lines written. Use UTF-8. The paths refer to different files, and the source exists; an empty source is allowed. Call the function with the supplied paths and store the count in `pending_count`. Do not use `input()` or `print()`.
