# Lab 09 · Tuples, Dictionaries and Files

Keep useful records and work with small text files of your own.

Fill each `____` using the comments. Run each block separately.

## Tuples

```python
# Record a bus route and its departure time, then unpack the two values.
# The Airport bus leaves at 07:45; store the time as text.
departure = ("Airport", ____)
route, time = ____
print(route, ____)
# Keep a tuple snapshot before the editable stop list grows.
# Start with Library and Museum, then append Park.
stops = ["Library", ____]
saved_stops = ____(stops)
stops.append(____)
print(saved_stops, ____)
```

```python
# Pair meal names with preparation times of 10 and 25 minutes.
meals = ["salad", ____]
minutes = [10, ____]
recipes = list(____(meals, minutes))
print(recipes[____])  # Display the pasta record.
```

```python
# Return (full boxes, loose cupcakes) when each box holds 6 cupcakes.
# Pack 20 cupcakes.
def box_count(____):
    return cupcakes // 6, cupcakes ____ 6
full_boxes, loose = box_count(____)
print(full_boxes, ____)
```

## Dictionary Keys and Values

```python
# A cupboard holds 4 mugs and 6 plates. Two mugs are taken out; add 3 bowls.
cupboard = {"mugs": 4, "plates": ____}
cupboard["mugs"] -= ____
cupboard[____] = 3
print(____)
# Remove the plates entry after all plates move to another cupboard.
del cupboard[____]
print(len(____))
```

## Dictionary Iteration

```python
# A shopping bag contains one of each listed item; prices are in AED.
# Milk costs 7 AED.
prices = {"bread": 5, "milk": ____, "soap": 4}
total = ____
for item, price in prices.____():
    total += ____
print(____)
# Create new price tags with 1 AED added to each price.
new_prices = {item: price ____ 1 for item, price in prices.items()}
print(____)
```

## Writing Text Files

```python
# Use a practice folder. This replaces practice_packing.txt with two packing items.
# Write Towel and Charger on separate lines, ending both with a newline.
with open("practice_packing.txt", ____, encoding="utf-8") as file:
    file.write(____)
    file.write(____)
```

```python
# Start a fresh list of two reminders; writelines needs the newline characters.
# The second reminder is Return book, followed by a newline.
reminders = ["Water plants\n", ____]
with open("practice_reminders.txt", ____, encoding="utf-8") as file:
    file.____(reminders)
```

## Appending and Reading

```python
# Create a fresh list, then add an item without erasing what is already there.
# Write Bakery first; append Post office. End each item with a newline.
with open("practice_errands.txt", ____, encoding="utf-8") as file:
    file.write(____)
with open("practice_errands.txt", ____, encoding="utf-8") as file:
    file.write(____)
with open("practice_errands.txt", ____, encoding="utf-8") as file:
    errands = file.____()
print(____)
```

## File Position

```python
# Read the first reminder, rewind to the beginning, then read the whole file.
# Write Call dentist and Collect shoes on separate lines, each with a newline.
with open("practice_schedule.txt", ____, encoding="utf-8") as file:
    file.write(____)
with open("practice_schedule.txt", ____, encoding="utf-8") as file:
    first = file.____()
    file.seek(____)  # Return to the beginning, not to a numbered line.
    whole = file.____()
print(first.strip(), ____)
```

## Reading Structured Lines

```python
# Each line contains an item and its quantity separated by a semicolon.
# Write roll;4 then bun;3 on separate lines, each ending with a newline.
with open("practice_order.txt", ____, encoding="utf-8") as file:
    file.write(____)
total_items = ____
with open("practice_order.txt", ____, encoding="utf-8") as file:
    for line in ____:
        item, quantity = line.strip().split(____)
        total_items += ____(quantity)
print(____)
```
