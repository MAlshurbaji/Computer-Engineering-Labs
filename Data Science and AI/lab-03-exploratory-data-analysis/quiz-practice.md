# Lab 03 · Exploratory data analysis: MCQ practice

**16 questions · 20–25 minutes**

Choose one answer (A–D) for each question.

## Data Quality

### 1. A negative cooking time is marked missing. What is the resulting mean?

```python
times = pd.Series([8, -2, 12])
times = times.mask(times < 0)
print(times.mean())
```

A. `6.0`

B. `8.0`

C. `10.0`

D. `0.0`

### 2. A delivery table has three rows and times `[12, None, 18]`. What count and mean appear for the time column in `describe()`?

A. `count=2`, `mean=15`

B. `count=3`, `mean=10`

C. `count=3`, `mean=15`

D. `count=2`, `mean=30`

### 3. Two purchases cost 10 and 30 AED. The 30 AED purchase is accidentally recorded twice. What does the three-row mean do?

A. It still gives each purchase equal weight.

B. It ignores the repeated amount automatically.

C. It becomes the sum of the two real purchases.

D. It gives the 30 AED purchase twice the weight of the 10 AED purchase.

## Summary Statistics

### 4. What is the sample variance in minutes squared?

```python
times = pd.Series([4, 8])
print(times.var(ddof=1))
```

A. `4.0`

B. `8.0`

C. `6.0`

D. `16.0`

### 5. A fourth bill is added to `[5, 6, 7]`, giving `[5, 6, 7, 100]`. What is the new median?

A. `6`

B. `6.5`

C. `7`

D. `29.5`

### 6. How many recipes are selected?

```python
recipes = pd.DataFrame({"dish": ["Soup", "Rice", "Pasta"],
                        "minutes": [20, 30, 30]})
slowest = recipes.loc[recipes["minutes"] == recipes["minutes"].max()]
```

A. `1`

B. `3`

C. `30`

D. `2`

## Covariance and Units

### 7. The covariance of trip distance in kilometres and fare in AED is 3. Distance is changed to metres by multiplying by 1,000. Fare stays unchanged. What is the new covariance?

A. `3000`

B. `3`

C. `0.003`

D. `3000000`

### 8. Every bill in a paired bill-and-distance dataset receives the same extra 5 AED fee. What happens to its covariance with distance?

A. It increases by 5.

B. It is multiplied by 5.

C. It stays unchanged.

D. It becomes zero.

### 9. What is the sample covariance between these two columns?

```python
df = pd.DataFrame({"loaves": [1, 2, 3], "cost": [2, 4, 6]})
print(df.cov().loc["loaves", "cost"])
```

A. `1.0`

B. `4.0`

C. `6.0`

D. `2.0`

## Correlation

### 10. Pearson correlation between distance and delivery time is 0.65. Distance changes from kilometres to metres. What is the correlation for the same rows?

A. `650`

B. `0.00065`

C. `0.65`

D. `-0.65`

### 11. The numeric columns are `km`, `items`, and `minutes`. After the following code, which entries remain?

```python
links = df.corr()["minutes"].drop("minutes")
```

A. Only the correlation of `minutes` with itself.

B. The correlations of `km` and `items` with `minutes`.

C. The raw `km` and `items` measurements.

D. The covariance of all three columns.

### 12. Floor numbers `[-2,-1,0,1,2]` pair with flights to ground `[2,1,0,1,2]`. Pearson correlation is zero. Which description fits the plotted points?

A. There is a V-shaped relationship that the linear coefficient does not describe.

B. Flights to ground are identical on every floor.

C. There cannot be any relationship between the columns.

D. A straight rising line fits every point exactly.

### 13. In 12 invented cafe visits, order size and waiting time move together. Which statement is supported by that observation alone?

A. Larger orders are proven to cause every delay.

B. The same relationship must hold at every cafe.

C. The two recorded quantities are associated in this sample.

D. The order size perfectly predicts future waits.

## Heatmaps

### 14. Two heatmaps use the same colour map, `vmin=-1`, `vmax=1`, and `center=0`. Each contains a correlation of `0.3`. What should be true about those two cells?

A. They use the same mapped colour.

B. The cell in the larger matrix must be darker.

C. The cell with more observations must be lighter.

D. One must be positive and the other negative.

## Histograms

### 15. A cafe histogram shows 20 of 40 visits in the 5–10 minute bin. Another cafe shows 8 of 10 visits in that same bin. Which comparison is correct?

A. The first cafe has the larger share because 20 exceeds 8.

B. The shares are equal because the bins have equal width.

C. The two bars prove the first cafe always has longer waits.

D. The second cafe has the larger share in that bin: 80% versus 50%.

## Missing Pairs

### 16. pandas computes a correlation using rows where both columns are present. For `distance=[1,2,None,4]` and `minutes=[10,None,30,40]`, how many paired rows contribute?

A. `1`

B. `2`

C. `3`

D. `4`
