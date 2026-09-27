# MATLAB — Lab 08: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

A delivery sample is [4;4;4;20] minutes. Which pair gives its mean and median?

A. 8 and 4

B. 4 and 8

C. 8 and 12

D. 12 and 4

## 2. MCQ

For three measurements, `sum((x-mean(x)).^2)` is 18. What is `std(x,0)`?

A. sqrt(6)

B. 9

C. 3

D. 18

## 3. MCQ

Each row of a 100-by-8 matrix is a simulated group of eight shoppers. Which returns the 100 group means?

A. `mean(A,1)`

B. `mean(A,2)`

C. `mean(A(:))`

D. `sum(A,1)/100`

## 4. MCQ

A script resets the same seed and generator immediately before two equal-sized `rand` calls. What follows?

A. The second draw contains only zeros.

B. The draws are independent physical experiments.

C. The second draw must have a different mean.

D. The two arrays are identical.

## 5. MCQ

A degree-one `polyfit` returns [1.5 4] for minutes against boxes. What does 1.5 represent?

A. Fitted change in minutes per additional box.

B. Largest residual in minutes.

C. Number of training rows.

D. Fitted time at zero boxes.

## 6. MCQ

Predictions are [6;9] minutes and held-out observations are [8;8]. What is held-out MAE?

A. 0.5

B. 3

C. 1.5

D. sqrt(2.5)

## 7. Coding

Two water dispensers are observed on four days: milliliters [100 120;0 180;200 NaN;100 150], rows as days and columns as dispensers. Report each dispenser's observed count, mean, median, and sample standard deviation using N-1 normalization, omitting NaN and retaining zero. Produce a labeled bar chart of the means with a zero baseline.

## 8. Coding

A toy-car cleaning model has training counts [1;2;3] and minutes [6;8;10]. Keep counts [4;5] and minutes [13;13] for evaluation only. Fit a straight line, predict held-out times, and report observed-minus-predicted residuals, held-out MAE, and held-out RMSE. Calculate the MAE of a constant predictor equal to the training-time mean. Do not use evaluation outcomes to fit either predictor.
