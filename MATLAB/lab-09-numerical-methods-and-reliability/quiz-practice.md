# MATLAB — Lab 09: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

Linear interpolation uses (time,temperature) samples (0,10), (6,22), and (10,18). What is the estimate at time 8?

A. 16

B. 18

C. 20

D. 24

## 2. MCQ

`interp1(x,y,q,'linear')` uses complete data with x=[0;2;5] and q=6. With no extrapolation argument, what is returned?

A. NaN

B. The last y value

C. Zero

D. The slope

## 3. MCQ

Flow is [2;4;4] L/min at minutes [0;1;3]. What does `trapz(time,flow)` estimate?

A. 6 L

B. 8 L

C. 10 L

D. 11 L

## 4. MCQ

Cumulative distance changes from 4 m to 13 m between seconds 2 and 5. What is the interval-average speed?

A. 9 m/s

B. 3 m/s

C. 4.5 m/s

D. 13/5 m/s

## 5. MCQ

For continuous f(t)=t^2-9 on nonnegative t, which bracket supplies strictly opposite endpoint signs?

A. [4,5]

B. [0,2]

C. [2,4]

D. [3,5]

## 6. MCQ

Two nearly redundant equations have a tiny solve residual, but a slight input change causes a large solution change. What does that demonstrate?

A. Input sensitivity can remain high despite a tiny residual.

B. The residual must have been calculated in seconds.

C. Backslash always returns the same solution.

D. Every small residual proves accurate input measurements.

## 7. Coding

A refill tap has rates [0;3;5;1] L/min at minutes [0;2;4;7]. Write a script that validates increasing times, estimates rates at minutes 1 and 5 by linear interpolation, and calculates total liters with the trapezoidal rule using actual times. Return a table of each interval's start, end, and estimated liters. Plot recorded rates with labeled units. Treat only the measured interval as covered.

## 8. Coding

Two reusable scoops have unknown volumes. Four small scoops plus one large scoop hold 260 mL; one small plus two large hold 240 mL. Solve for [small;large] using backslash and verify both equation residuals within 1e-8 mL. A separate supplied cooling model is T(t)=18+42*exp(-t/6) degrees C, valid for 0<=t<=20 minutes. Use bracket [0,20] to find when T reaches 32 degrees C, checking the returned time is in range and the temperature residual is within 1e-8 degrees C. Print both scoop volumes and the cooling time.
