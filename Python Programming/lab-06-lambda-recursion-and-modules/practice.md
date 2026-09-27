# Lab 06 · Lambda, Recursion, and Modules in Python

Build confidence by completing small programs for everyday tasks.

Fill each `____` using the comments. Run each block separately, except the final pair: save those completed blocks with the given filenames in the same working folder.

## Lambda Functions

```python
# A voucher subtracts a fixed discount from a price; assume discount <= price.
after_voucher = ____ price_aed, discount_aed: price_aed - discount_aed
remaining_aed = after_voucher(28, ____)  # A 5 AED voucher on a 28 AED bill.
print(____)
```

```python
# apply_change(value, change) calls the supplied function on the value.
def apply_change(value, ____):
    return change(____)
add_delivery = lambda amount: amount ____ 4  # Delivery costs a fixed 4 AED.
bill_aed = apply_change(____, add_delivery)  # Food costs 18 AED.
print(____)
```

## Recursive Functions

```python
# Stack at most four plates together. Return the number of stacks for 0–40 plates.
# Stop at zero or below; the final stack may be partly full.
def stack_count(____):
    if plates ____ 0:
        return ____
    return 1 + stack_count(plates ____ 4)
print(stack_count(____))  # Arrange ten plates.
```

```python
# Each fold halves a ribbon's length. Count folds until it is at most limit_cm.
# Both lengths are positive; use at most 1024 cm and a limit of at least 1 cm.
def folds_needed(length_cm, ____):
    if length_cm ____ limit_cm:
        return ____
    return 1 + folds_needed(length_cm ____ 2, limit_cm)
print(folds_needed(80, ____))  # Fold an 80 cm ribbon to no more than 15 cm.
```

## Standard Modules and Aliases

```python
# Each roll covers 2.5 metres of shelf edge. Buy enough whole rolls for 8 metres.
import ____ as measurements
edge_metres = ____
roll_metres = ____
rolls_needed = measurements.____(edge_metres / roll_metres)  # Round upward.
print(____)
print("ceil" ____ dir(measurements))  # Check that the imported module exposes ceil.
```

```python
# A square cloth has area 2.25 square metres; its side is the square root of its area.
from math import ____ as root
area_m2 = ____
side_metres = ____(area_m2)
print(____)
```

## A User-Defined Module

```python
# Save this completed block as house_labels.py.
# Define label_for(room, item), joining the two values with " / ".
def label_for(room, ____):
    return room + " / " + ____
```

```python
# Save this block as show_label.py beside house_labels.py, then run show_label.py.
# Make a label for cups in Kitchen.
import ____ as labels
label = labels.label_for("Kitchen", ____)
print(____)
```

