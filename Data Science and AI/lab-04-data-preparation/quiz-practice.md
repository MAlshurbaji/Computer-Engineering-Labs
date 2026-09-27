# Lab 04 · Preparing data for machine learning: MCQ practice

**16 questions · 20–25 minutes**

Choose one answer (A–D) for each question.

## Recorded Values

### 1. A walking app records every duration above 60 minutes as 60. A log contains `[30,45,60,60]`. Which statement follows?

A. The longest actual walk was exactly 60 minutes.

B. All four actual durations are known exactly.

C. At least two walks lasted 60 minutes or longer.

D. The true mean must be lower than the recorded mean.

## Categorical Inputs

### 2. A payment encoder has columns `["pay_cash", "pay_card"]`. Which row represents a card payment?

A. `[0, 1]`

B. `[1, 0]`

C. `[1, 1]`

D. `[0, 0]`

### 3. Bag labels are mapped with `{"small":1,"medium":2,"large":3}`. A new record says `"extra-large"` and maps to `NaN`. What should happen before treating the record as ready?

A. Assume it means `small`.

B. Assume it means `large`.

C. Treat the missing rank as proof that the bag is empty.

D. Resolve or explicitly handle the unsupported category.

## Missing Values

### 4. A median imputer is fitted to numeric values `[2,8,10]`. It transforms a new value that is missing. What replacement does it use?

A. `2`

B. `8`

C. `10`

D. `20/3`

### 5. How many rows remain, and can a missing discount remain?

```python
receipts = pd.DataFrame({"items": [2, None, 3],
                         "discount": [None, 1, 0]})
kept = receipts.dropna(subset=["items"])
```

A. One row remains; no values are missing.

B. Two rows remain; one still has a missing discount.

C. Two rows remain; every value is present.

D. Three rows remain; every value is present.

### 6. Discounts are `[0, None, 4]`. Missing discounts are filled with the median of the known values. What is the result?

A. `[2, 2, 4]`

B. `[0, 4, 4]`

C. `[0, 0, 4]`

D. `[0, 2, 4]`

## Row Alignment

### 7. Input rows have indices `[7,2,9]`, but targets are ordered `[2,7,9]`. Which expression restores target order to match the input rows?

A. `y.loc[X.index]`

B. `y.reset_index(drop=True)`

C. `y.sort_values()`

D. `y.iloc[::-1]`

### 8. Features with indices `[4,1]` are joined to payment indicators with indices `[1,4]` using `pd.concat(..., axis=1)`. How does pandas match them?

A. By their displayed row positions only.

B. By the largest numeric value in each row.

C. By equal index labels.

D. It duplicates every possible pair of rows.

## Feature Scaling

### 9. A default `MinMaxScaler` is fitted to training values `10` and `30`. What does it produce for a new value `50`?

A. `1.0`

B. `0.5`

C. `50.0`

D. `2.0`

### 10. A `StandardScaler` is fitted to values `2` and `6`. What does it produce for their midpoint `4`?

A. `0.5`

B. `1.0`

C. `0.0`

D. `4.0`

### 11. Training has `km=[1,5]` and `items=[2,4]`. Each column is min–max scaled separately. How is the order `(3 km, 3 items)` represented?

A. `[0.6, 0.75]`

B. `[0.5, 0.5]`

C. `[3, 3]`

D. `[0.5, 1.5]`

### 12. A fitted numeric transformer expects columns `["km", "items"]`. A new DataFrame has the same columns in the reverse order. Which selection restores the expected order?

A. `new[["km", "items"]]`

B. `new[["items", "km"]]`

C. `new.sort_index()`

D. `new.iloc[::-1]`

## CSV Export

### 13. A table with index labels `[50,70]` is exported using `to_csv(index=False)` and read with default `read_csv`. What are its new row indices?

A. `[50, 70]`

B. `[1, 2]`

C. `[0, 1]`

D. `[50, 70, 0, 1]`

### 14. Prepared features and targets are separate. Which export keeps the correct target beside each feature row when their pandas indices match?

A. Assign `export["target"] = y`, then export that combined table.

B. Sort only `y`, convert it to a list, then assign it by position.

C. Export only the target values and discard the features.

D. Replace every target with its index label.

## Pickle Serialization

### 15. A default `MinMaxScaler` fitted to `[10,30]` is saved with `pickle.dumps` and restored from those same bytes. What does the restored scaler produce for `20`?

A. `0.0`

B. `1.0`

C. It has lost its fitted parameters.

D. `0.5`

## Prepared Inputs

### 16. A notebook has cleaned, encoded, and scaled 12 invented orders but has not trained a prediction model. Which claim is justified?

A. The model has high accuracy on unseen orders.

B. The rows have a numeric representation ready for the next modelling step.

C. The preprocessing proves the target can be predicted perfectly.

D. Every future order must scale to a value between zero and one.
