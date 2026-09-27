# Lab 07 · Security and privacy MCQs

**16 questions · 20–25 minutes**

Choose one answer (A–D) for each question.

## Security Concepts

### 1. A door-access app flags a normal family member as suspicious. Which event occurred?

A. A false alert.

B. A missed suspicious attempt.

C. A correctly ignored normal attempt.

D. A confirmed account theft.

### 2. The target is `needs_review`. Which training column most directly leaks its answer?

A. Retry count recorded before review.

B. The reviewer’s final decision.

C. Whether the device was recognised.

D. The sign-in hour.

### 3. Two accounts share the same password pattern, and one is compromised. Which response best limits exposure of the other?

A. Use the same password on more apps.

B. Post the password in the family group.

C. Use a strong, unrelated password for each account.

D. Rename both accounts without changing passwords.

### 4. A home router monitor reports unusual traffic. What can be concluded from that alert alone?

A. A particular person caused an attack.

B. Every connected device is infected.

C. All unusual traffic is malicious.

D. The activity needs investigation; the cause is not yet established.

## Feature Preparation and Validation

### 5. A sign-in table contains a made-up alias and behaviour features. Which change most directly reduces identifier disclosure in a shared feature table?

A. Copy the alias into a new column.

B. Sort by alias.

C. Remove the alias column.

D. Convert the alias letters to uppercase.

### 6. A home-device log records retry counts and session lengths. What row does this fitted imputer return?

```python
imputer = SimpleImputer(strategy="median")
imputer.fit([[1, 20], [7, 50], [4, 80]])
row = imputer.transform([[np.nan, np.nan]])
```

A. `[[1, 20]]`

B. `[[4, 50]]`

C. `[[7, 80]]`

D. `[[50, 4]]`

### 7. An alert cutoff is chosen from validation costs. What should happen before the final test is scored?

A. Freeze that cutoff.

B. Tune the cutoff separately for every test row.

C. Replace test labels with predictions.

D. Choose the cutoff that fits the test labels best.

### 8. Validation costs are false alerts plus twice the missed alerts. Which row has the smallest cost?

| Cutoff | False alerts | Missed alerts |
|---|---:|---:|
| 0.2 | 9 | 1 |
| 0.4 | 5 | 2 |
| 0.6 | 2 | 5 |
| 0.8 | 1 | 7 |

A. 0.2

B. 0.6

C. 0.8

D. 0.4

## Decision Trees and Model Interpretation

### 9. A scikit-learn tree sends values satisfying `retries <= 2.5` to its left child. An attempt has 2 retries. Which branch does that node choose?

A. Neither branch.

B. The left branch.

C. Both branches.

D. The right branch.

### 10. A model gives an alert probability of 0.62. The fixed rule is `probability >= 0.7`. What is the result?

A. No alert under this rule.

B. An alert because 0.62 is greater than zero.

C. An alert because every probability causes one.

D. The rule retrains the model.

### 11. Retry count has the largest forest importance. Which conclusion is supported?

A. Increasing retries must cause account theft.

B. Every other input is irrelevant.

C. The model is perfect on future attempts.

D. The trained forest used retries strongly; this does not establish causation.

### 12. A detector matches every label in a tiny invented dataset. What is still needed before claiming real-world usefulness?

A. A longer variable name.

B. A larger font for the score.

C. Evaluation on representative, independently labelled real cases.

D. Removing every incorrect prediction from the report.

## Differential Privacy

### 13. A household reports 0, 2, or 5 shared devices. The published statistic counts households with at least one device. Which per-household transformation matches that statistic?

A. Multiply each report by 5.

B. Keep each full device count.

C. Square each report.

D. Replace every positive report with 1.

### 14. Each household contributes a value between 0 and 2 inclusive to a sum. Neighbouring datasets differ by adding or removing one household. What is the largest change in that sum?

A. 2

B. 0

C. 1

D. The number of columns.

### 15. A count mechanism uses Laplace scale `sensitivity / epsilon`. For sensitivity 2 and epsilon 0.5, what scale is used?

A. 0.25

B. 1

C. 4

D. 2.5

### 16. Three releases about the same households use budgets 0.1, 0.2, and 0.4. Under basic sequential composition, what budget do they use together?

A. 0.4

B. 0.7

C. 0.008

D. 0.3
