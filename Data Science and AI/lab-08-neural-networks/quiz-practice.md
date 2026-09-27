# Lab 08 · Neural networks MCQs

**16 questions · 20–25 minutes**

Choose one answer (A–D) for each question.

## Image Arrays

### 1. Twelve 4×4 drawings are flattened while keeping one drawing per row. What shape results?

A. `(16, 12)`

B. `(12, 16)`

C. `(12, 4)`

D. `(192, 12)`

### 2. Three drawing labels use IDs 0, 1, and 2. Which one-hot row represents ID 1?

A. `[1, 0, 0]`

B. `[1, 1, 1]`

C. `[0, 0, 1]`

D. `[0, 1, 0]`

### 3. What does this expression return for one pixel?

```python
np.array([255], dtype="uint8").astype("float32") / 255
```

A. A floating-point array containing 1.0.

B. An integer array containing 255.

C. A floating-point array containing 255.0.

D. An array containing a class label.

### 4. A softmax prediction is `[0.15, 0.7, 0.15]` for `[book, mug, spoon]`. Which label does `argmax` select?

A. book

B. spoon

C. mug

D. all three

## Neural Network Training

### 5. A batch has shape `(8, 16)`. It enters `Dense(5)` with the default bias. How many trainable parameters does this layer have?

A. 40

B. 80

C. 85

D. 128

### 6. The target rows are three-element one-hot vectors and the output uses softmax. Which loss fits this representation?

A. Categorical cross-entropy.

B. Mean absolute percentage error on class names.

C. Binary cross-entropy with a single output.

D. No loss is needed.

### 7. An epoch processes 90 training drawings with batch size 18 and no remainder. How many training batches occur in that epoch?

A. 18

B. 90

C. 1620

D. 5

### 8. In `fit(..., validation_data=(x_val, y_val))`, which data directly supply updates to the model weights during training?

A. Only `x_val, y_val`.

B. The training inputs and targets passed to `fit`.

C. Only the final test labels.

D. The names of the classes.

## Regression and Preprocessing

### 9. A kettle model predicts heating time in minutes. What does a validation MAE of 0.4 describe?

A. A 40% classification accuracy.

B. Four minutes of error for every run.

C. A guarantee that no error exceeds 0.4 minutes.

D. A mean absolute error of 0.4 minutes on those validation runs.

### 10. A scaler was fitted to `[water_litres, start_temperature]`. Which inference row preserves that feature meaning?

A. `[25.0, 0.8]` for 0.8 litres at 25°C.

B. `[0.8, 25.0]` for 0.8 litres at 25°C.

C. `[0.8, 0.8]` for any temperature.

D. `[25.0]` with the other value omitted.

### 11. With default MinMaxScaler settings, training values run from 10 to 30. An unseen value is 35. What does `transform` return for it?

A. Exactly 1.0 because every new value is clipped.

B. 0.75

C. 1.25

D. 35.0

### 12. Two optimizers should start from the same initial conditions. Which procedure best supports that comparison?

A. Reset the seed and construct a fresh model for each optimizer.

B. Train the second optimizer on the first model’s final weights without saying so.

C. Give the second optimizer the test labels as training data.

D. Change both the feature order and dataset for the second optimizer.

## Model Selection and Persistence

### 13. Candidate A has validation MAE 0.6; B has 0.3. The predeclared rule is smallest validation MAE. Which model is selected?

A. B.

B. A because its error is larger.

C. Whichever later gives the smallest test error.

D. Neither because MAE cannot be compared.

### 14. A model file is saved as `kettle.keras`. Which call reloads it as a Keras model?

A. `np.load("kettle.keras")`

B. `MinMaxScaler("kettle.keras")`

C. `keras.models.load_model("kettle.keras")`

D. `pd.read_csv("kettle.keras")`

### 15. Persisted scaling arrays define `scaled = raw * scale + offset`. With raw `[2, 20]`, scale `[0.5, 0.1]`, and offset `[-0.5, -1]`, what is `scaled`?

A. `[1, 2]`

B. `[-1, -20]`

C. `[2.5, 21]`

D. `[0.5, 1]`

### 16. Before saving, a test batch predicts `[3.2, 4.1]`; after reloading the model and scaling recipe, it predicts the same values within tolerance. What has this check established?

A. The predictions equal the true heating times.

B. The saved recipe reproduces those predictions.

C. The model will never make an error.

D. The validation set is unnecessary.
