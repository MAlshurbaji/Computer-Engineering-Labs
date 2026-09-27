# Lab 05 · Functions and Scope in Python

Build confidence by completing small programs for everyday tasks.

Fill each `____` using the comments. Run each block separately in your Python editor. For a missing input prompt, choose a short message.

## Parameters and Return Values

```python
# Return the cost of a quantity of the same grocery item.
def grocery_cost(unit_aed, ____):  # Parameters: unit price, then quantity.
    return unit_aed ____ quantity
cost_aed = grocery_cost(____, 3)  # Three items at 4.50 AED each.
print(____)
```

```python
# A photo fits without rotation when BOTH its dimensions fit the frame.
def fits_frame(width_cm, height_cm, frame_width, ____):
    return width_cm <= frame_width ____ height_cm <= frame_height
fits = fits_frame(10, 15, ____, 18)  # A 10 by 15 cm photo in a 12 by 18 cm frame.
print(____)
```

```python
# Define announce_pickup(item) to display the item, with no return statement.
# Announce library books, then inspect the returned value.
def announce_pickup(____):
    print("Collect:", ____)
returned = announce_pickup(____)
print("Returned value:", ____)
# Compare the displayed message with the returned value.
```

## Keyword and Default Arguments

```python
# Make a label for cups in Kitchen, separated by a colon and space.
def room_label(item, ____):
    return room ____ ": " + item
label = room_label(room="Kitchen", item=____)
print(____)
```

```python
# Most storage tags begin with Home; allow a different prefix when needed.
# Make Home: blankets, then Travel: towels.
def storage_tag(item, prefix=____):
    return prefix + ": " + ____
home_tag = storage_tag(____)
travel_tag = storage_tag("towels", prefix=____)
print(home_tag, ____)
```

## Variable Arguments and Local Scope

```python
# Accept any number of nonnegative bag weights through *weights_kg.
# Return the heaviest weight, or 0 when no bags are supplied.
def largest_bag(____):
    heaviest = ____
    for weight in ____:
        if weight ____ heaviest:
            heaviest = ____
    return ____
print(largest_bag(1.5, ____, 2))  # Bag weights: 1.5, 4, and 2 kg.
```

```python
# Spend 13 AED from a 40 AED budget using a local calculation.
# Changing the local budget must leave the caller's number unchanged.
shopping_budget = ____  # AED.
def after_purchase(shopping_budget, ____):
    shopping_budget = shopping_budget ____ spent_aed
    return ____
remaining_aed = after_purchase(shopping_budget, ____)
print("Remaining:", remaining_aed, "Original:", ____)
```

## Global and Enclosing Scope

```python
# Keep one shared count of collected parcels; begin at zero.
collected = ____
def ____():  # Define mark_collected with no parameters.
    global ____
    collected = collected ____ 1
    return ____
first_count = ____()
second_count = ____()
print(first_count, ____)
```

```python
# The inner function add_prefix(text) can read prefix from its enclosing function.
def make_label(room, ____):
    prefix = room ____ ": "
    def add_prefix(____):
        return prefix ____ text
    return add_prefix(____)
print(make_label("Hall", ____))  # Label umbrellas in Hall.
```

