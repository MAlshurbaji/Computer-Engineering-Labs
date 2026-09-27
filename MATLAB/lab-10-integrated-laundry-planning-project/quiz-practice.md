# MATLAB — Lab 10: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

Which operation puts complete session records in chronological order while keeping each duration attached to its timestamp?

A. Sort DurationMin only.

B. Sort Time alone.

C. Sort every variable separately.

D. Sort the complete table by Time.

## 2. MCQ

Durations are [0;NaN;8;-3]. The contract permits finite nonnegative durations. Which survive?

A. Only 8

B. 0 and 8

C. 0, NaN, and 8

D. All four

## 3. MCQ

The first four valid sessions train a model and the next two evaluate it. Where should a constant baseline's mean come from?

A. Only the two evaluation outcomes.

B. All six outcomes.

C. Only the four training outcomes.

D. The six timestamps.

## 4. MCQ

Training counts span 3 through 12. Estimates are permitted only inside that inclusive range. Which request is unsupported?

A. 13

B. 12

C. 3

D. 8

## 5. MCQ

With `residual = observed-predicted`, a residual of -2 minutes means what?

A. The actual time is negative.

B. The model used two training rows.

C. Actual time exceeds prediction by two minutes.

D. Prediction exceeds actual time by two minutes.

## 6. MCQ

A fitting function receives paired vectors of unequal lengths. What matches a clear validation contract?

A. Silently discard the extra elements.

B. Reject the call with an informative error.

C. Fill the shorter vector with zeros.

D. Return random coefficients.

## 7. Coding

Toolkit-cleaning IDs are ["K1";"K2";"K1";"K3"], with revision times 0, 5, 10, and 15 minutes after 09:00 on 3 December 2026 and cleaning minutes [6;9;8;NaN]. Retain the latest revision per ID first, then discard retained records with nonfinite or negative durations. Sort the result by revision time. Report retained IDs and durations plus their mean, and write the report to CSV in a fresh scratch folder. Do not replace missing durations with zero.

## 8. Coding

Cart counts are [2;4;6;8;10;12] with elapsed minutes [7;11;15;19;24;26]. Fit a line using only the first four rows and evaluate on the last two. Report predictions, observed-minus-predicted residuals, MAE, and RMSE. For new requests [3;9], allow estimates only within the inclusive training-count range; use NaN elsewhere. Produce separate evaluation and planning tables. Keep evaluation outcomes out of fitting.
