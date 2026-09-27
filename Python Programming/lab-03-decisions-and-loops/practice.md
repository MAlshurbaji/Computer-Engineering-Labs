# Lab 03 · Decisions and Basic Loops in Python

Build confidence by completing small programs for everyday tasks.

Fill each `____` using the comments. Run each block separately in your Python editor. For a missing input prompt, choose a short message.

## if and if/else

```python
# A grocery voucher removes 5 AED from a 28 AED bill when the voucher is valid.
bill_aed = ____
voucher_valid = ____
if ____:
    bill_aed = bill_aed ____ 5
print("To pay:", ____)
# Try False, then restore True.
```

```python
# Store A charges 18 AED for a notebook; store B charges 16 AED.
# Choose A when its price is lower or the prices are tied.
price_a = ____
price_b = ____
if price_a ____ price_b:
    chosen_store = ____
____:
    chosen_store = ____
print(____)
```

## elif and Nested Decisions

```python
# A parcel is not delivered yet, but its van is out for delivery.
# Status priority: Delivered, On the way, then Preparing.
delivered = ____
van_departed = ____
if ____:
    status = ____
____ van_departed:
    status = ____
____:
    status = ____
print(____)
```

```python
# Wrapping paper is available but scissors are missing.
# With no paper say Get paper; otherwise check whether scissors are available.
# Say Wrap the gift when both are present, or Borrow scissors when only scissors are missing.
have_paper = ____
have_scissors = ____
if ____:
    if ____:
        action = ____
    ____:
        action = ____
____:
    action = ____
print(____)
```

## for and range

```python
# Label four packed boxes, beginning with box 1.
box_count = ____
for box in range(1, box_count ____ 1):
    print("Box", ____)
# Try zero boxes, then restore four.
```

```python
# Read the weights of three shopping bags in kg; each weight is between 0 and 10.
heaviest_kg = ____
for bag in range(____):
    weight_kg = ____(input("Bag weight in kg: "))
    if weight_kg ____ heaviest_kg:
        heaviest_kg = ____
print("Heaviest:", ____)
```

## while Loops

```python
# There are 25 minutes left to listen. Play complete six-minute songs only.
minutes_left = ____
songs_played = ____
while minutes_left ____ 6:
    minutes_left = minutes_left ____ 6
    songs_played = songs_played ____ 1
print(songs_played, ____)
```

```python
# A practice locker opens only for the exact word sunflower.
# Choose short input prompts; display Locker open after a successful entry.
attempt = input(____)
while attempt ____ "sunflower":
    attempt = input(____)
print(____)
```

