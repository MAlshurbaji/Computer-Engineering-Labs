# Lab 02 · Operators and Expressions in Python

Build confidence by completing small programs for everyday tasks.

Fill each `____` using the comments. Run each block separately in your Python editor. For a missing input prompt, choose a short message.

## Arithmetic and Grouping

```python
# Three cinema snacks cost 4.50 AED each; delivery adds 2 AED once.
snacks = ____
price_aed = ____
delivery_aed = ____
total_aed = (snacks ____ price_aed) + delivery_aed
change_aed = ____ - total_aed  # Pay with 20 AED.
print("Total and change:", total_aed, ____)
```

```python
# A square photo has 12 pixels along each side. Half its pixels will be printed in colour.
side_pixels = ____
pixel_count = side_pixels ____ 2  # Square the side length.
colour_pixels = pixel_count ____ 2
print("Pixels:", pixel_count, "Colour pixels:", ____)
```

```python
# Put 37 invitation cards into full bundles of 8; keep the leftovers separately.
cards = ____
bundle_size = ____
full_bundles = cards ____ bundle_size
leftover_cards = cards ____ bundle_size
print(full_bundles, ____)
print(full_bundles * bundle_size ____ leftover_cards)  # Recover the original count.
```

## Assignment and Logical Operators

```python
# The music volume starts at 40. Raise it by 5, then lower it by 12.
volume = ____
volume ____ 5
volume ____ 12
last_change = ____  # A negative change means the volume went down.
undo_change = ____last_change  # Unary minus reverses the last change.
print(volume, ____)
```

```python
# A playroom is open, has two free places, and the ticket has been paid for.
closed = ____
free_places = ____
paid = ____
can_enter = paid ____ (not closed) and (free_places > 0)
full = free_places ____ 0
needs_attention = closed ____ full  # Either problem needs attention.
print(can_enter, ____)
```

## Membership and Identity

```python
# Use the exact note bring cups and plates. Membership checks are case-sensitive.
note = ____
cups_listed = "cups" ____ note
napkins_missing = "napkins" ____ note
print(cups_listed, ____)
```

```python
# No delivery instruction has been recorded yet. Test for None itself.
delivery_note = ____
needs_note = delivery_note ____ None
delivery_note = ____  # Record the text Leave at reception.
has_note = delivery_note ____ None
print(needs_note, ____)
```

## Bitwise Operators

```python
# Three lamp switches use bits: desk=1, ceiling=2, bedside=4. A set bit means on.
lights = ____  # Desk and bedside are on.
desk_on = (lights ____ 1) != 0
lights = lights ____ 2  # Switch on the ceiling without changing the other lamps.
print(desk_on, ____)
```

```python
# Begin with all three lamps on. Flip the ceiling bit, then clear the desk bit.
lights = ____
flipped = lights ____ 0b010
desk_off = flipped ____ ~0b001
bedside_bit = 0b001 ____ 2  # Move the desk bit two places left.
ceiling_bit = bedside_bit ____ 1  # Move it one place right.
print(desk_off, bedside_bit, ____)
```

