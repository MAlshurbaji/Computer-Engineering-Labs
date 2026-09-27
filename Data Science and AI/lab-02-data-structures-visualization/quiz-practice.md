# Lab 02 · Data structures and visualization: MCQ practice

**16 questions · 20–25 minutes**

Choose one answer (A–D) for each question.

## Sets

### 1. What does the final line display?

```python
foods = {"rice", "tea"}
foods.add("pasta")
foods.discard("tea")
print("tea" in foods)
```

A. `True`

B. `2`

C. `False`

D. A `KeyError`

## NumPy Arrays

### 2. What are the final prices after doubling each price and adding a 1 AED fee?

```python
prices = np.array([3, 5])
final_prices = prices * 2 + 1
```

A. `array([7, 11])`

B. `array([6, 10])`

C. `array([4, 6])`

D. `array([8, 12])`

### 3. Which checkout positions are printed? Positions start at zero.

```python
queues = np.array([0, 1, 0, 2])
queues[1] = 0
print(np.where(queues == 0)[0])
```

A. `[0 2]`

B. `[1 2 3]`

C. `[0 0 0]`

D. `[0 1 2]`

### 4. An array contains eight measured muffin weights. Why does `weights.reshape(3, 3)` fail?

A. Reshape requires all weights to be equal.

B. The grid needs nine entries, but reshape preserves the original number of measurements.

C. A two-dimensional array cannot contain weights.

D. Changing integer weights to floats would automatically add the missing entry.

### 5. Rows are two people and columns are four days. Which expression keeps both people and only the middle two days?

```python
walks = np.array([[10, 20, 30, 40], [15, 25, 35, 45]])
```

A. `walks[1:3, :]`

B. `walks[:, 1:3]`

C. `walks[:, :2]`

D. `walks[1, 1:3]`

### 6. Rows are morning and evening bread sales; columns are two shops. What are the daily totals per shop?

```python
sales = np.array([[3, 5], [4, 2]])
print(sales.sum(axis=0))
```

A. `[8 6]`

B. `[3 5 4 2]`

C. `[14]`

D. `[7 7]`

## Pandas DataFrames

### 7. Which foods appear in `buy`?

```python
df = pd.DataFrame({"food": ["eggs", "rice", "milk"],
                   "have": [2, 5, 0], "need": [4, 3, 2]})
buy = df.loc[df["have"] < df["need"], "food"].tolist()
```

A. `["eggs", "milk"]`

B. `["rice"]`

C. `["eggs", "rice"]`

D. `["milk"]`

### 8. Which index labels remain after this positional selection?

```python
df = pd.DataFrame({"fruit": ["pear", "apple", "kiwi"]}, index=[20, 40, 60])
selected = df.iloc[1:]
```

A. `[1, 2]`

B. `[20, 40]`

C. `[40, 60]`

D. `[20, 40, 60]`

### 9. What is the total grocery cost?

```python
basket = pd.DataFrame({"price": [4, 7], "quantity": [3, 2]})
basket["cost"] = basket["price"] * basket["quantity"]
print(basket["cost"].sum())
```

A. `11`

B. `5`

C. `55`

D. `26`

### 10. Which costs are selected, in order?

```python
prices = pd.DataFrame({"cost": [6, 4]}, index=["Bread", "Milk"])
chosen = prices.loc[["Milk", "Bread"], "cost"].tolist()
```

A. `[6, 4]`

B. `[0, 1]`

C. `[4, 6]`

D. `[10]`

## CSV Data

### 11. The CSV text uses semicolons: `food;count\nbread;2\nmilk;1`. Which setting produces separate `food` and `count` columns with `pd.read_csv(StringIO(text), ...)`?

A. `sep=","`

B. `sep=";"`

C. `header=None`

D. `nrows=2`

### 12. A CSV has bread quantity `2` and an unrecorded milk quantity. pandas reads milk as `NaN`; the quantity sum is `2`. Which conclusion follows?

A. Only the known bread quantity contributed to that sum.

B. The milk quantity is definitely zero.

C. There was only one row in the CSV.

D. The total number of items is definitely two.

## Line Charts

### 13. A phone log has times `[30, 0, 15]` and matching battery values `[60, 20, 40]`. Which paired order draws the same observations chronologically?

A. `times=[0,15,30]`, `battery=[60,20,40]`

B. `times=[30,15,0]`, `battery=[20,40,60]`

C. `times=[0,15,30]`, `battery=[20,40,60]`

D. `times=[0,30,15]`, `battery=[20,40,60]`

## Bar Charts

### 14. The categories `["Rice", "Bread"]` have costs `[12, 6]`. If categories change to `["Bread", "Rice"]`, which costs preserve the same purchases?

A. `[6, 12]`

B. `[12, 6]`

C. `[18, 18]`

D. `[6, 6]`

## Histograms

### 15. For waits `[0, 4, 5, 9, 10]`, a histogram uses bin edges `[0, 5, 10]`. The last bin includes its right edge. What are the two bar counts?

A. `[3, 2]`

B. `[2, 2]`

C. `[1, 4]`

D. `[2, 3]`

### 16. Two count histograms use the same 12 waiting times and cover every value. One uses wider bins. What is the sum of its bar counts?

A. `6`

B. `12`

C. `24`

D. It depends on the width of the bins.
