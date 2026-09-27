# Lab 06 practice quiz · Classification

**16 questions · 20–25 minutes**

Choose one answer per question. All examples are invented independent practice.

## Records and Labels

### 1. A notebook keeps one row per four-pixel drawing but replaces its pixels with their sum. Two different drawings both sum to 2. What information is lost?

A. The total brightness of each drawing

B. Where the bright and dark pixels occur

C. The number of drawing records

D. Whether the two total brightness values are equal

### 2. Card measurements and their bag-size labels must stay together during a split. Which call directly keeps the pairs aligned?

A. Shuffle only `X`, then leave `y` unchanged.

B. Sort only `y`, then split both tables.

C. Call unrelated random shuffles on `X` and `y`.

D. `train_test_split(X, y, random_state=7)`

### 3. Training order IDs are `[P, Q, R]`; test order IDs are `[S, Q]`. Which record needs investigation before reporting the test result?

A. `Q`, because the same order appears in both groups.

B. `P`, because its name comes first.

C. `R`, because it is absent from the test list.

D. `S`, because it is absent from the training list.

### 4. A bag-size classifier learned the labels `small`, `medium`, and `large`. What should a prediction for one new card look like?

A. The sum of all three names

B. A packing-time error in minutes

C. One of the learned bag-size names

D. The number of rows used for training

## Binary Predictions and Cross-Validation

### 5. A pickup reminder marks an order as late when it is actually ready on time. Treat late as the positive class. What kind of mistake occurred?

A. A true positive

B. A false negative

C. A false positive

D. A true negative

### 6. For pickup records A–D, actual lateness is `[False, True, False, True]` and predictions are `[False, False, False, True]`. Which record is a missed late pickup?

A. `B`

B. `A`

C. `C`

D. `D`

### 7. In one cross-validation fold, orders C and D are held out from A–F. Which rows may train the model that predicts C in that fold?

A. A, B, C, E, and F

B. C and D only

C. All six orders

D. A, B, E, and F

### 8. An app team wants to audit the precision of its “late pickup” alerts. Which group should it inspect to see how many alerts were right?

A. Every order the app predicted to be on time

B. Orders the app predicted to be late

C. Only orders with no prediction

D. Only the training table’s column names

## Confusion Matrices and Error Records

### 9. A matrix uses rows for actual bag size and columns for predicted size, both ordered `[small, medium, large]`. What does entry `[1, 0]` count?

A. Small cards predicted to need a medium bag

B. Large cards predicted to need a medium bag

C. Correct predictions of medium bags

D. Medium cards predicted to need a small bag

### 10. There are far more small cards than large cards. Which matrix view compares error proportions within each actual bag size?

A. Divide each row by the number of input columns.

B. Divide each row by that row’s total.

C. Replace every nonzero count with one.

D. Multiply every row by its largest count.

### 11. A plotting step sets the normalized confusion matrix’s diagonal to zero. What can a white diagonal in that plot mean?

A. The classifier made no correct predictions.

B. Every row has zero examples.

C. Correct predictions were deliberately hidden to show mistakes.

D. The model was never trained.

### 12. A review table contains `actual_bag` and `predicted_bag`. Which filter selects all mistaken predictions?

A. `actual_bag != predicted_bag`

B. `actual_bag == predicted_bag`

C. `actual_bag == "small"`

D. `predicted_bag == "large"`

## Model Selection and Evaluation

### 13. The stated rule is “choose the highest validation accuracy.” A script selects model A because its training accuracy is highest. Which record is most useful for checking that choice?

A. Each candidate’s name and validation accuracy

B. Each candidate’s variable-name length

C. The number of comments in the notebook

D. Only the selected model’s training accuracy

### 14. Two trees have equal validation accuracy. The agreed tie rule prefers fewer leaves. Tree A allows 4 leaves; tree B allows 7. Which choice follows the rule?

A. Tree B

B. Whichever has the longer variable name

C. Tree A

D. Neither tree can make predictions

### 15. A model is changed repeatedly after examining the same reserved test cards. What is needed for a fresh independent final evaluation of the changed model?

A. The same test cards with their rows reversed

B. New reserved cards that did not guide those changes

C. The same test cards with renamed columns

D. The same predictions rounded differently

### 16. A tree correctly classifies all six invented test cards. Which report accurately describes the evidence?

A. It will be correct on every future card.

B. Six examples prove the model is ready for every shop.

C. Its training labels are no longer needed because errors are impossible.

D. It was correct on these six test cards.
