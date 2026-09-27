# MATLAB — Lab 03: Practice Quiz

Choose one answer for each MCQ.

## 1. MCQ

A line should connect observations in time order. After `[t,order] = sort(recordedTime);`, which statement preserves the original time–temperature pairs?

A. `temperature = recordedTemperature(order);`

B. `temperature = sort(recordedTemperature);`

C. `temperature = recordedTemperature;`

D. `temperature = order;`

## 2. MCQ

A histogram uses edges `[0 5 10]` and data `[0 5 10]`. With default counts, which two bin heights result?

A. `[2 1]`

B. `[1 2]`

C. `[1 1]`

D. `[0 3]`

## 3. MCQ

Two bar charts compare nonnegative counts of 18 and 20. Which shared vertical range shows their bar lengths from a common zero baseline and includes both counts?

A. `[18 20]`

B. `[19 21]`

C. `[0 22]`

D. `[0 19]`

## 4. MCQ

A scatter plot contains one point per parcel with volume on x and wrapping time on y. Which statement is supported by this chart alone?

A. Greater volume causes longer wrapping time for every parcel.

B. The input order shows the route followed by the parcels.

C. The largest marker means the heaviest parcel even though all marker sizes are equal.

D. Each point shows one observed volume–time pair.

## 5. MCQ

A saved line handle `readingLine` already belongs to the correct axes. Which statement updates only its vertical coordinates to `corrected`?

A. `readingLine.YData = corrected;`

B. `readingLine.XData = corrected;`

C. `readingLine.LineWidth = corrected;`

D. `title(readingLine,corrected);`

## 6. MCQ

Two temperature panels share the same units but use automatic vertical limits. Why set identical explicit limits when comparing the size of changes?

A. It forces the measured values to become equal.

B. It makes an equal plotted vertical distance represent an equal temperature change in both panels.

C. It sorts both time vectors automatically.

D. It converts both records into a single average line.

## 7. Coding

Create a standalone script comparing two groups of containers with scatter plots on one explicitly stored axes. Group A has volumes [1 3 5] L and masses [0.4 0.8 1.1] kg; group B has volumes [2 4 6] L and masses [0.6 0.9 1.4] kg. Use equal marker areas of 50 points squared, filled circular markers for A, and filled square markers for B. Keep both scatter handles and associate them with legend labels Group A and Group B. Label both axes with units, add a descriptive title, and restore hold off. Do not join the points or fit a line.

## 8. Coding

Eight consecutive daily travel waits are [2 5 0 11 7 20 14 5] min. Create a standalone script showing two views of this same record in a 1-by-2 tiled layout. The left panel is a marked line against days 1:8, with horizontal limits [1 8] and vertical limits [0 20]. The right panel is a count histogram with edges [0 5 10 15 20], horizontal limits [0 20], and vertical limits [0 4]. Give both panels descriptive titles and labelled axes with units where applicable. Save the line handle, the histogram handle, and the histogram count vector. Include every observation and do not normalize the histogram.
