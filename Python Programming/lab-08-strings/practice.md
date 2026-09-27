# Lab 08 · Strings

Turn labels, messages and everyday text into useful results.

Fill each `____` using the comments. Run each block separately.

## Indexing and Slicing

```python
# A luggage label has a three-letter destination, a hyphen and a bag number.
# Use the label AUH-0247.
label = ____
destination = label[:____]
bag_number = label[____:]
print(destination, ____)
```

```python
# Replace the room letter B with C, keeping the original booking text too.
# The original room is B214.
old_room = ____
new_room = "C" + old_room[____:]
print(old_room, ____)
```

## String Methods

```python
# Compare a typed menu choice with soup, ignoring surrounding spaces and case.
# Use SoUp with two spaces before and after it.
typed = ____
choice = typed.strip().____()
is_soup = choice ____ "soup"
print(choice, ____)
```

```python
# A label contains one colon. Keep the text after it and trim spaces.
# Use the label Pickup: Front desk.
label = ____
colon = label.____(":")
location = label[colon ____ 1:].strip()
print(____)
```

```python
# Check a photo filename and make a display title from the words before .jpg.
# Use family_picnic.jpg.
filename = ____
is_photo = filename.____(".jpg")
title = filename[:-4].replace(____, " ").title()
print(is_photo, ____)
```

## Splitting and Building Text

```python
# Print one clean grocery entry per line from this comma-separated note.
# Use eggs, bread, apples as the note.
note = ____
items = note.____(",")
for item in ____:
    print(item.____())
```

## Character Codes

```python
# Shelf labels use consecutive uppercase letters. E comes immediately after D.
shelf = ____
code = ____(shelf)
next_shelf = chr(code ____ 1)
print(____)
```

## Text Processing Functions

```python
# Build a delivery label from the first letter of each nonempty word.
# Try the name Maya Noor Ali.
def initials(____):
    label = ____
    for word in name.____():
        label += word[____].upper()
    return ____
print(initials(____))
```
