# Lab 01 — Jupyter and Python: MCQ practice

**16 questions · 20–25 minutes**

Choose one answer (A–D) for each question.

## Jupyter notebooks

### 1. Which cell creates a rendered heading titled “Weekly shopping”?

A. A code cell containing `print("Weekly shopping")`

B. A code cell containing `# Weekly shopping`

C. A Markdown cell containing `# Weekly shopping`

D. A Markdown cell containing `print("Weekly shopping")`

### 2. A notebook calculates a grocery bill. Which action checks that it runs from top to bottom without using variables from earlier executions?

A. Restart the kernel, then run all cells in order.

B. Clear the displayed outputs, then save the notebook.

C. Run the final cell twice.

D. Save the notebook with its current outputs.

## Variables, types, and arithmetic

### 3. Which expression calculates the total bread cost as the number `10.0`?

```python
loaves = "4"
price_per_loaf = "2.50"
```

A. `int(loaves) * int(price_per_loaf)`

B. `loaves * int(float(price_per_loaf))`

C. `float(loaves) + float(price_per_loaf)`

D. `int(loaves) * float(price_per_loaf)`

### 4. Which expression gives the cookies left after filling as many complete bags as possible?

```python
cookies = 27
cookies_per_bag = 5
```

A. `cookies // cookies_per_bag`

B. `cookies % cookies_per_bag`

C. `cookies / cookies_per_bag`

D. `cookies * cookies_per_bag`

## Lists

### 5. Which expression selects the last bus stop?

```python
bus_stops = ["Home", "Park", "Market", "Station"]
```

A. `bus_stops[0]`

B. `bus_stops[-1]`

C. `bus_stops[4]`

D. `bus_stops[-2]`

### 6. What is the final shopping list?

```python
shopping = ["milk", "bread", "milk"]
shopping.remove("milk")
shopping.append("eggs")
```

A. `["bread", "eggs"]`

B. `["milk", "bread", "eggs"]`

C. `["eggs", "bread", "milk"]`

D. `["bread", "milk", "eggs"]`

### 7. Each entry is a shopping bag's weight. What does this code print?

```python
bag_weights_kg = [2, 5, 2]
bag_count = len(bag_weights_kg)
total_kg = sum(bag_weights_kg)
print(bag_count, total_kg)
```

A. `3 9`

B. `9 3`

C. `3 3`

D. `2 9`

### 8. Which expression gives the number of bus journeys?

```python
journeys = ["bus", "walk", "bus", "walk", "bus"]
```

A. `len(journeys)`

B. `sum(journeys)`

C. `journeys["bus"]`

D. `journeys.count("bus")`

## Dictionaries

### 9. Which statement changes the banana count to `6` while preserving the apple count?

```python
fruit = {"apples": 3, "bananas": 8}
```

A. `fruit[6] = "bananas"`

B. `fruit["bananas"] == 6`

C. `fruit["bananas"] = 6`

D. `fruit = {"bananas": 6}`

### 10. What is `total_cost` after adding the snack purchase?

```python
spending = {"lunch": 4, "bus": 9}
spending["snack"] = 3
total_cost = sum(spending.values())
```

A. `3`

B. `12`

C. `13`

D. `16`

### 11. Which expression fills the blank so that `remaining` becomes `{"apples": 3, "bananas": 3}`?

```python
pantry = {"apples": 4, "bananas": 5}
eaten = {"apples": 1, "bananas": 2}
remaining = {}

for fruit, count in pantry.items():
    remaining[fruit] = _____
```

A. `count - len(eaten)`

B. `count - eaten[fruit]`

C. `pantry[fruit] - eaten`

D. `eaten[fruit] - count`

## Loops

### 12. Which expression schedules phone-charging checks at `[15, 30, 45]` minutes?

```python
check_minutes = []
for i in _____:
    check_minutes.append(15 * i)
```

A. `range(3)`

B. `range(1, 3)`

C. `range(1, 4)`

D. `range(4)`

### 13. A shopping calculator receives these lists. What is the final `total_cost`?

```python
prices = [2, 4, 6]
quantities = [3, 2]
total_cost = 0

for price, quantity in zip(prices, quantities):
    total_cost = total_cost + price * quantity
```

A. `12`

B. `14`

C. `32`

D. `20`

## Conditions

### 14. What is the final value of `plan`?

```python
raining = False
plan = "decide later"

if raining:
    plan = "take umbrella"
else:
    plan = "leave umbrella"
```

A. `"leave umbrella"`

B. `"take umbrella"`

C. `"decide later"`

D. `False`

## Functions

### 15. A shopping bag costs `1` extra. Which function body makes `cost_with_bag` equal `7` without printing inside the function?

```python
def shopping_cost(item_count, price_each):
    print(item_count * price_each)

cost = shopping_cost(3, 2)
cost_with_bag = cost + 1
```

A. `print(item_count * price_each)`

B. `item_count * price_each`

C. `return item_count * price_each`

D. `return item_count + price_each`

### 16. Which call returns `5` empty bus seats?

```python
def seats_left(bus_seats, passengers):
    return bus_seats - passengers
```

A. `seats_left(12, 7)`

B. `seats_left(7, 12)`

C. `seats_left(12, 5)`

D. `seats_left(5, 12)`
