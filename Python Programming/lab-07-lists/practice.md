# Lab 07 · Lists

Organize everyday information and make your lists do useful work.

Fill each `____` using the comments. Run each block separately.

## Indexing and Slicing

```python
# A delivery visits these places in order. Keep the first two stops as one list.
stops = ["Bakery", ____, "Park", "Home"]  # The second stop is Library.
first_leg = stops[:____]
last_stop = stops[____]
print(first_leg, ____)
```

## Adding, Updating and Removing

```python
# Begin with rice and milk. Put bread first, change milk to yogurt, then add apples.
basket = ["rice", ____]
basket.insert(____, "bread")
basket[____] = "yogurt"
basket.append(____)
# Rice is already at home; remove it from the basket.
basket.remove(____)
print(____)
```

## Copies and Shared Lists

```python
# Keep an unchanged backup while two people edit the same weekend plan.
plan = ["walk", ____]  # Start with walk, then cook.
shared_plan = ____
backup = plan[____]
shared_plan[____] = "picnic"  # Replace cook in the shared plan.
print(plan, ____)
```

## Sorting and Searching

```python
# Compare taxi fares of 24, 18, 31 and 18 AED, highest first.
fares = [24, 18, ____, 18]
fares.____()
fares.____()
lowest = ____(fares)
lowest_count = fares.count(____)
print(fares, lowest, ____)
```

```python
# Find the position of Milk if it appears in the shopping list; otherwise keep -1.
# The shopping list contains Tea, Milk and Soap, in that order.
shopping = ["Tea", ____, "Soap"]
position = ____
if "Milk" ____ shopping:
    position = shopping.____("Milk")
print(____)
```

## Comprehensions and Mapping

```python
# Each box has room for 12 muffins. Calculate empty spaces in every box.
packed = [8, ____, 5]  # Three boxes contain 8, 12 and 5 muffins.
spaces = [12 ____ count for count in packed]
print(____)
# Make a second list containing only boxes that still have space.
not_full = [count for count in packed if count ____ 12]
print(____)
```

```python
# Reading sessions last 1, 0.5 and 2 hours. Convert every duration to minutes.
hours = [1, ____, 2]
minutes = list(map(lambda duration: duration ____ 60, hours))
print(____)
```

## Lists as Function Arguments

```python
# Return a new list of guest counts after reserving one extra chair per table.
# The three tables have 2, 4 and 1 guests.
def chairs_needed(____):
    return [count ____ 1 for count in guests]
tables = [2, ____, 1]  # Keep this original list unchanged.
chairs = chairs_needed(____)
print(tables, ____)
```

## Nested Lists

```python
# Two kitchen shelves hold jar counts in three sections each.
shelves = [[2, 4, 1], [3, ____, 5]]  # The middle section of shelf 2 is empty.
shelves[____][1] = 2  # Put 2 jars into that section.
shelf_totals = [sum(row) for row in ____]
print(____)
```

```python
# Three friends record morning and evening walks in minutes.
# The third friend's evening walk lasts 30 minutes.
walks = [[10, 20], [15, 25], [5, ____]]
evening_total = ____
for row in ____:
    evening_total += row[____]
print(____)
```
