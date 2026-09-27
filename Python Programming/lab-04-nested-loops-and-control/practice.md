# Lab 04 · Nested Loops and Loop Control in Python

Build confidence by completing small programs for everyday tasks.

Fill each `____` using the comments. Run each block separately in your Python editor. For a missing input prompt, choose a short message.

## Nested Loops

```python
# Check every locker on two floors, with three lockers per floor.
floors = ____
lockers_per_floor = ____
for floor in range(1, floors ____ 1):
    for locker in range(1, lockers_per_floor ____ 1):
        print("Check floor", floor, "locker", ____)
```

```python
# Check two picnic baskets, each containing three bottles.
# Enter each bottle's volume in ml; report how many in EACH basket hold under 500 ml.
for basket in range(1, ____):
    small_bottles = ____  # Reset the count for this basket.
    for bottle in range(____):
        volume_ml = ____(input("Bottle volume in ml: "))
        if volume_ml ____ 500:
            small_bottles = small_bottles ____ 1
    print("Basket", basket, "small bottles:", ____)
```

## Sentinel-Controlled Loops

```python
# Record book titles until the exact word done is entered. Do not count done.
book_count = ____
title = input(____)
while title ____ "done":
    book_count = book_count ____ 1
    title = input(____)
print("Books recorded:", ____)
```

```python
# Enter positive parcel weights in kg; enter zero to finish.
# Count only parcels heavier than 2 kg. The zero is not a parcel.
heavy_count = ____
weight_kg = ____(input("Weight in kg, or 0: "))
while weight_kg ____ 0:
    if weight_kg ____ 2:
        heavy_count = heavy_count ____ 1
    weight_kg = ____(input("Weight in kg, or 0: "))
print("Heavy parcels:", ____)
```

## break and the Nearest Loop

```python
# Buses depart at minutes 30, 40, ..., 90. It is now minute 47.
# Find the first departure at or after now, then stop searching.
now = ____
departure_found = ____  # None means no suitable departure has been found yet.
for departure in range(30, 91, ____):
    if departure ____ now:
        departure_found = ____
        ____
print(____)
```

```python
# Two parcels have widths 12 and 24 cm. Bag sizes 1 through 5 hold size*10 cm.
# For each parcel, choose its first suitable size; break leaves only the inner loop.
for parcel in range(1, ____):
    width_cm = parcel ____ 12
    for size in range(1, ____):
        if size * 10 ____ width_cm:
            print("Parcel", parcel, "size", ____)
            ____
```

## continue and Input Checks

```python
# Shelves 3 and 7 are reserved. Print the other shelf numbers from 1 through 8.
for shelf in range(1, ____):
    if shelf == 3 ____ shelf == 7:
        ____
    print(____)
```

```python
# Enter seat numbers. Accept 1 through 5, skip other integers, and stop at 0.
accepted = ____
while ____:
    seat = ____(input("Seat, or 0: "))
    if seat ____ 0:
        ____
    if seat < 1 ____ seat > 5:
        ____
    accepted = accepted ____ 1
print("Accepted entries:", ____)
```

