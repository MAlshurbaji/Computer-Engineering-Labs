# Lab 01 · Syntax and Semantics in Python

Build confidence writing small Python programs for everyday tasks.

Fill each `____` using the comments. Run each block separately in your Python editor.

## Variables and Data Types

```python
# A shopping list records 2 milk cartons, 1.5 litres each, with the label Milk.
milk_cartons = ____
litres_each = ____
product = ____
print(type(____))  # Inspect the whole-number quantity.
print(type(____))  # Inspect the decimal measurement.
print(type(____))  # Inspect the text label.
```

```python
# A table is booked, but its arrival time has not been chosen.
table_booked = ____  # Use a Boolean value.
arrival_time = ____  # Use the value for information not set yet.
print(____)
print(____)
# Later, the arrival time is confirmed as the text 18:30.
arrival_time = ____
print(____)
```

## Assignment and Reassignment

```python
# Save the earlier song before changing the current selection.
current_song = ____  # Begin with the song title Sunrise.
earlier_song = ____
current_song = ____  # Change the selection to Rainy Day.
print("Earlier:", ____)
print("Current:", ____)
# Check whether changing current_song also changed earlier_song.
```

## Strings and Escape Sequences

```python
# Fill the escapes: tabs between columns, newlines between rows.
receipt = "Item____Qty____Apples____4____Bread____1"
print(____)
# Compare the columns and rows on screen with the string written above.
```

```python
# Print Recipes\Weekend as one path. Two backslashes in a string give one on screen.
folder_path = "Recipes____Weekend"
print(____)
# The meal label is Nadia's lunch. Choose quotation marks that keep the apostrophe.
meal_label = ____
print(____)
```

## Input and Type Conversion

```python
# Read a film title as text and a whole-number guest count from 0 to 16.
film = input(____)  # Choose a short prompt.
guests = ____(input("Number of guests: "))
print("Film:", ____)
print("Guests:", ____)
print(type(____))  # Check that the count is numeric.
```

```python
# Read a parcel length in centimetres, such as 25.50. Keep the typed text as well.
length_text = input(____)
length_cm = ____(length_text)
print("Typed:", ____)
print("Numeric:", ____)
print(type(____), type(____))
# Inspect what happened to a trailing zero after conversion.
```

## Output Formatting

```python
# A unit price is 3.4567 AED. Compare labels without changing the stored number.
unit_price = ____
short_label = "AED %.2f" % ____
detailed_label = "AED %.4f" % ____
print(____)
print(____)
print("Stored value:", ____)
```

```python
# A picnic needs Cups and Plates, in that order.
# print normally separates its arguments with spaces; sep chooses another separator.
first_item = ____
second_item = ____
print(first_item, ____)  # Use the default spacing.
print(first_item, second_item, sep=____)  # Use a vertical bar with a space on each side.
print(first_item, second_item, sep=____)  # Put each item on its own line.
```
