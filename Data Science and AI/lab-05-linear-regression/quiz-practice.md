# Lab 05 practice quiz · Linear Regression

**16 questions · 20–25 minutes**

Choose one answer per question. All examples are invented independent practice.

## Inputs and Preparation

### 1. A delivery-fee model has columns `distance_km`, `bags`, and `fee_aed`. Which training input table avoids giving the answer to the model?

A. `fee_aed` only

B. `distance_km` and `bags` only

C. All three columns

D. `bags` and `fee_aed` only

### 2. A model learned from columns ordered `[distance_km, bags]`. A new row arrives as `[bags, distance_km]`. What should happen before prediction?

A. Sort the two numbers from smallest to largest.

B. Keep the order because there are still two numbers.

C. Replace both column names with the same name.

D. Reorder the new row to match the training columns.

### 3. An imputer learns the median from the item counts `[4, 8, NaN]`. A missing count is then transformed. What value replaces it?

A. `6`

B. `0`

C. `8`

D. `NaN`

### 4. A fitted standard scaler has mean `10` and scale `2` for minutes. What transformed value corresponds to `14` minutes?

A. `7`

B. `4`

C. `2`

D. `12`

## Model Inputs and Predictions

### 5. A learner supplies eight rows of order measurements and seven packing times to `fit`. What needs repair?

A. The model must receive eight input columns.

B. The seven times must be added into one total.

C. There must be one matching target time for each input row.

D. The input rows must all have identical values.

### 6. A fitted packing-time model receives four new order rows in one `predict` call. What does the result contain?

A. One estimated packing time per row

B. A single average for all four orders

C. Four new fitted models

D. The actual times, read from the future

### 7. A table stores every actual time and prediction in the same order. Which calculation produces signed errors that are positive when packing took longer than predicted?

A. `predicted_minutes - actual_minutes`

B. `actual_minutes + predicted_minutes`

C. `actual_minutes * predicted_minutes`

D. `actual_minutes - predicted_minutes`

### 8. An order has a predicted time but has not yet been packed. What is still needed to calculate its absolute prediction error?

A. The number of model features

B. Its actual packing time

C. The model variable name

D. A rounded version of the prediction

## Regression Metrics

### 9. Actual times are `[6, 10]` and predicted times are `[9, 7]`. What does a mean signed error of zero tell you here?

A. Both orders were predicted exactly.

B. The model must have zero MAE.

C. Each estimate is wrong by zero minutes.

D. Opposite errors cancel even though both estimates are wrong.

### 10. For actual times `[10, 10]` and predictions `[10, 16]`, what is the mean absolute error?

A. `6` minutes

B. `3` minutes

C. `0` minutes

D. `36` minutes

### 11. A program reports a mean squared error of `49` square minutes. What is the RMSE?

A. `49` minutes

B. `24.5` minutes

C. `7` minutes

D. `2401` minutes

### 12. Two models have absolute errors `[3, 3, 3, 3]` and `[0, 0, 0, 12]` on the same orders. Their MAEs match. Which additional observation is correct?

A. The second model has the larger RMSE.

B. The first model has the larger RMSE.

C. Their RMSEs must also match.

D. Both RMSEs are zero.

## Residual Analysis

### 13. A review table has `order_id`, `actual_minutes`, `predicted_minutes`, and `absolute_error_minutes`. Which action finds the order with the largest miss?

A. Sort `absolute_error_minutes` descending and inspect the first row.

B. Sort `order_id` alphabetically and inspect the first row.

C. Sort `predicted_minutes` ascending and inspect the first row.

D. Keep only rows where the prediction is positive.

### 14. Predictions were made for orders `[A, B, C]`, but the actual-time list was reordered to `[C, A, B]`. What must be done before computing MAE?

A. Sort the prediction values numerically.

B. Replace actual times with their average.

C. Match each prediction to the actual time for the same order.

D. Round every prediction to the nearest minute.

### 15. An evaluation report says RMSE is `3` minutes, while one recorded absolute error is `9` minutes. Which statement fits both facts?

A. The order with error 9 must be deleted.

B. An average error measure can be smaller than an individual error.

C. RMSE is a guaranteed maximum error.

D. The prediction for that order was exactly correct.

### 16. A coordinator needs to review orders that took over five minutes longer than predicted. Which filter matches that request?

A. `predicted_minutes - actual_minutes > 5`

B. `actual_minutes + predicted_minutes > 5`

C. `abs(actual_minutes - predicted_minutes) == 0`

D. `actual_minutes - predicted_minutes > 5`
