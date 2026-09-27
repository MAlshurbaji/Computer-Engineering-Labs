# MATLAB — Lab 03: Plots and Visual Explanations

Make a chart that answers a clear question, then use its labels, scales, and stored data to check that it tells the intended story.

[Practice](practice.m) · [Quiz](quiz-practice.md)

## What you will learn

- Choose a chart suited to ordered observations, paired measurements, categories, or distributions.
- Create and label plots on explicitly selected axes.
- Preserve paired data when sorting and use fair scales for comparisons.
- Inspect and update individual graphics objects through handles.

## Working through the lab

Run each guided example as a separate script. Change the inputs, inspect the results, and then try the independent builds.

- Each complete example creates its own figure and supplies small synthetic data directly in the script.
- Run one example at a time. The scripts do not close your existing figures or change global graphics settings.
- Text in quotes supplies labels or property values. Single-quoted text is used for individual labels; double-quoted entries inside square brackets create a list of labels.

## Figures, Axes, and Line Plots

A useful plot connects a question to visible evidence. Start by identifying what one point represents and what belongs on each axis. A figure is the window or container; an axes object provides the plotting region, scales, and labels inside it. Store both objects in variables called handles so later commands can target the intended chart. The expression plot(ax,x,y) places paired coordinates on the axes referenced by ax. For these vector examples, x and y must contain the same number of values. The style 'o-' displays circular markers connected by line segments. Markers identify supplied observations; the joining segments are a visual connection, not extra measurements. Labels should name the quantities and their units. A short title supplies context, while a grid can help the reader estimate values. Passing the axes handle to each command prevents a click in another figure from redirecting a later label. Before interpreting the shape, verify that the horizontal coordinates represent actual times or positions rather than an accidental sequence of row numbers.

### Task 1 — A cooling drink record

1. Plot the five supplied temperature observations against their actual elapsed minutes.
2. Check the marker positions and both axis labels.

```matlab
minutes = [0 4 8 12 16];
degreesC = [62 54 48 43 39];
fig = figure('Name','Drink observations');
ax = axes('Parent',fig);
drinkLine = plot(ax,minutes,degreesC,'o-','LineWidth',1.5);
xlabel(ax,'Elapsed time (min)');
ylabel(ax,'Temperature (deg C)');
title(ax,'Five drink observations');
grid(ax,'on');
```

**Check the result**

- The line uses the supplied time spacing.
- Only the marked values are observations in this example.

**Try a change:** Change the third time to 9 minutes without changing its paired temperature and inspect the new spacing.

## Ordering Connected Observations

A line joins points in the order supplied. It does not automatically reorganize an untidy record into increasing time. When records arrive out of order, first decide whether a connected line is appropriate, then arrange the horizontal coordinate and its associated measurement together. The sort function can return two outputs: the sorted values and the original positions from which they came. Square brackets on the left of the assignment receive those separate outputs. Use the position output to reorder every paired measurement in the same way. Sorting only the time vector and leaving the measurements untouched invents new pairs. The plotted line might look smooth while describing observations that never occurred. A small dataset makes this mistake easy to detect by tracing one distinctive point from the original record to the chart. Keep the unsorted input variables available until the relationship is checked. Reordering records changes their presentation, not the meaning or value of any observation, and it should not silently discard a record.

### Task 2 — Putting a plant diary in order

1. Sort the recorded days and apply the returned order to the paired heights.
2. Confirm that the day-1 observation keeps its original height.

```matlab
recordedDay = [3 1 4 2];
recordedHeightCentimetres = [9.0 7.0 9.5 8.0];
[day,order] = sort(recordedDay);
heightCentimetres = recordedHeightCentimetres(order);
fig = figure('Name','Plant diary');
ax = axes('Parent',fig);
plantLine = plot(ax,day,heightCentimetres,'s-');
xlabel(ax,'Recorded day');
ylabel(ax,'Height (cm)');
title(ax,'Plant diary in day order');
```

**Check the result**

- The paired coordinates are preserved while their display order changes.
- The line proceeds through increasing recorded days.

**Try a change:** Reorder the four original pairs together and verify that sorting still gives the same chart.

## Multiple Series and Legends

Comparing two series is easiest when their horizontal coordinates and vertical units have the same meaning. The axes hold state controls whether a new plotting command replaces existing graphics or adds to them. Use hold(ax,'on') before adding another series, then restore hold(ax,'off') when the intended group is complete. Keep each returned line handle. A legend can receive those handles in a chosen order together with a list of labels, which makes the association explicit. Color alone is not always enough to distinguish curves, so use different markers or line styles too. Avoid combining unrelated units on a single scale merely to save space. For a comparison of the same quantity, a shared vertical scale provides a common reference. Axis limits are set with xlim or ylim using a two-value vector. Choose limits that include all supplied observations and disclose useful variation without suggesting an unsupported claim. The example compares two recorded plans; it does not prove that one plan would always produce the same result in a new situation.

### Task 3 — Two evening room-temperature records

1. Plot both records on the same axes with different markers and line styles.
2. Associate each legend label with its saved line handle.

```matlab
hour = [18 19 20 21];
openWindowC = [28 26 25 24];
closedWindowC = [28 28 27 27];
fig = figure('Name','Room records');
ax = axes('Parent',fig);
openLine = plot(ax,hour,openWindowC,'o-');
hold(ax,'on');
closedLine = plot(ax,hour,closedWindowC,'s--');
hold(ax,'off');
key = legend(ax,[openLine closedLine],["Window open" "Window closed"],'Location','best');
xlabel(ax,'Hour of day');
ylabel(ax,'Temperature (deg C)');
title(ax,'Two supplied evening records');
ylim(ax,[20 30]);
```

**Check the result**

- Both lines use one labelled temperature scale.
- Markers and line styles reinforce the legend.

**Try a change:** Reverse the handle and label lists together and inspect the legend order.

## Scatter Plots and Paired Measurements

A scatter plot displays pairs without joining them into a route. This is suitable when each pair describes a separate object or occasion and the input order is not a meaningful path. One axis might describe an item's size and the other a measured quantity associated with that same item. Preserve the pairing during any selection or rearrangement. The scatter function accepts an axes handle followed by the x and y vectors. A scalar marker-size argument specifies an area in points squared, not the diameter of a physical object. The 'filled' option fills the marker faces so small points are easier to see. Put a marker code such as 'o' for circles or 's' for squares before 'filled': scatter(ax,x,y,50,'s','filled'). Use equal marker sizes when size is not intended to encode a third quantity. A visible pattern is a description of the supplied observations; it does not establish a cause or a reliable rule for unseen cases. Check overlapping points and axis ranges before describing the pattern, because one visible dot may represent more than one identical pair. The small synthetic example supports reading coordinates rather than making a performance claim.

### Task 4 — Boxes and packing-paper use

1. Plot one point per box using volume and the paper length used for that box.
2. Read the coordinates of the largest-volume box from the plot.

```matlab
boxLitres = [2 5 3 8 6];
paperMetres = [0.6 1.1 0.8 1.5 1.2];
fig = figure('Name','Packing observations');
ax = axes('Parent',fig);
points = scatter(ax,boxLitres,paperMetres,55,'filled');
xlabel(ax,'Box volume (L)');
ylabel(ax,'Paper used (m)');
title(ax,'Five packing observations');
grid(ax,'on');
```

**Check the result**

- Each dot corresponds to one paired record.
- No connecting line implies an order between boxes.

**Try a change:** Enter the same five pairs in a different order and compare the displayed point positions.

## Bar Charts and Category Labels

A bar chart compares quantities assigned to categories. The category positions are not continuous measurements: moving from one labelled category to the next does not imply an intermediate category. Supply numeric positions to bar, then use xticks and xticklabels to attach the intended names. Keep the label order aligned with the values. A short label is easier to read, but it still needs enough meaning to identify the category. Because bar length communicates magnitude, start the value axis at zero for the ordinary nonnegative counts used here. Truncating that baseline can exaggerate a modest difference. The upper limit should leave room above the tallest bar while keeping the scale readable. A title and a value-axis unit complete the basic context. Bar charts summarize categories, so they do not preserve the individual observations behind a count. Choose them when those category totals are the question. If the question instead concerns the distribution of individual numerical measurements, the next section introduces a more appropriate representation.

### Task 5 — Reusable bags by storage location

1. Create one bar for each of the three named locations.
2. Check that every label is attached to its matching count and that the baseline is zero.

```matlab
counts = [4 7 3];
fig = figure('Name','Reusable bags');
ax = axes('Parent',fig);
bagBars = bar(ax,1:3,counts);
xticks(ax,1:3);
xticklabels(ax,["Kitchen" "Hall" "Car"]);
xlabel(ax,'Storage location');
ylabel(ax,'Bag count');
title(ax,'Reusable bags on hand');
ylim(ax,[0 8]);
```

**Check the result**

- The bar heights encode counts, not the text label lengths.
- All three bars share the same zero baseline.

**Try a change:** Reorder the locations and counts together so the largest count appears first.

## Histograms and Bin Boundaries

A histogram groups individual numerical observations into intervals and shows how many fall in each interval. It answers a different question from a bar chart of named categories. Give histogram a vector of measurements and, when comparisons matter, an explicit vector of increasing bin edges. With the default count normalization, bar heights are counts. Each bin includes its left edge and excludes its right edge, except that the final bin also includes its final right edge. That boundary rule determines where observations exactly on an edge belong. Values outside the chosen edges are not represented, so select an edge range covering every observation you intend to show. The returned histogram object stores BinEdges and Values, which let you inspect the grouping. Bin width changes how detail is summarized; it cannot create additional measurements or make a small sample representative of a larger population. Keep the quantity and unit on the horizontal axis and identify count on the vertical axis. For a fair comparison, keep the edges and normalization consistent between groups.

### Task 6 — Waiting times for a shared printer

1. Group the nine supplied waits using edges at 0, 5, 10, 15, and 20 minutes.
2. Inspect waitingHistogram.Values and account for the observations exactly on bin edges.

```matlab
waitMinutes = [0 2 5 5 9 10 14 15 20];
edges = [0 5 10 15 20];
fig = figure('Name','Printer waits');
ax = axes('Parent',fig);
waitingHistogram = histogram(ax,waitMinutes,edges);
xlabel(ax,'Wait (min)');
ylabel(ax,'Observation count');
title(ax,'Nine supplied printer waits');
xlim(ax,[0 20]);
ylim(ax,[0 4]);
```

**Check the result**

- The final edge is included in the final bin.
- The bin counts account for all nine supplied observations.

**Try a change:** Use edges [0 10 20] and describe the detail lost by combining intervals.

## Tiled Layouts and Comparable Scales

Separate axes can make related plots easier to read when several series would overlap. A tiled layout arranges those axes inside one figure. The form tiledlayout(fig,rows,columns) creates a fixed grid within the specified figure, and nexttile(layout,index) returns the axes for a chosen tile. Store those axes separately and send each chart and label to the correct one. The grid describes the arrangement of plots, not the dimensions of the data. A two-row, one-column layout stacks two plotting regions vertically. Different axes can choose different automatic limits, which may make similarly shaped lines represent very different numerical changes. Set matching limits when the comparison requires a common scale. Include labels on both axes so the panels remain understandable independently. Titles can identify the groups without requiring a legend inside every panel. Keep units consistent across panels intended for direct comparison. This layout organizes evidence; it does not make two groups comparable if their measurement definitions or observation periods differ.

### Task 7 — Two rooms on the same temperature scale

1. Place the two room records in separate vertically stacked panels.
2. Use matching time and temperature limits, then compare the numerical variation.

```matlab
hours = [8 10 12 14];
roomAC = [22 24 25 24];
roomBC = [25 26 26 25];
fig = figure('Name','Room comparison');
layout = tiledlayout(fig,2,1,'TileSpacing','compact');
axA = nexttile(layout,1);
lineA = plot(axA,hours,roomAC,'o-');
title(axA,'Room A');
xlabel(axA,'Hour of day');
ylabel(axA,'Temperature (deg C)');
xlim(axA,[8 14]);
ylim(axA,[20 28]);
axB = nexttile(layout,2);
lineB = plot(axB,hours,roomBC,'s-');
title(axB,'Room B');
xlabel(axB,'Hour of day');
ylabel(axB,'Temperature (deg C)');
xlim(axB,[8 14]);
ylim(axB,[20 28]);
```

**Check the result**

- An equal vertical distance represents an equal temperature difference in both panels.
- Each line belongs to its explicitly stored axes.

**Try a change:** Change Room B to [25 25.2 25.1 25.3] and retain the common scale while describing the smaller variation.

## Graphics Handles and Targeted Updates

A returned graphics handle identifies an object that already exists. Its properties store data and appearance settings. Dot notation accesses a property: lineHandle.YData refers to the vertical coordinates of that line, while lineHandle.LineWidth controls its width. Assigning a new property value changes the existing object. This differs from calling plot again, which can replace axes contents depending on the hold state. Use a handle when the intention is to correct one series or refine its appearance without rebuilding the whole chart. Keep data vectors and their shapes consistent; a new vertical vector must still match the horizontal coordinates. Updating a display does not automatically rewrite the input variable from which it was originally drawn, so retain a clearly named corrected data vector too. Axes also have properties, including YLim for the displayed range. Scope changes to the particular object you created instead of altering global defaults. Finally, inspect labels and limits after an update: a correct line can still be misleading if its old title or range no longer describes the displayed data.

### Task 8 — Correcting one shelf-length record

1. Create a line for four measured shelves, then correct shelf 3 from 79 to 76 cm.
2. Update the existing line and its title without creating a second series.

```matlab
shelf = 1:4;
recordedCentimetres = [75 76 79 75];
fig = figure('Name','Shelf measurements');
ax = axes('Parent',fig);
lengthLine = plot(ax,shelf,recordedCentimetres,'o-');
xlabel(ax,'Shelf number');
ylabel(ax,'Measured length (cm)');
correctedCentimetres = recordedCentimetres;
correctedCentimetres(3) = 76;
lengthLine.YData = correctedCentimetres;
lengthLine.LineWidth = 2;
ax.YLim = [70 80];
title(ax,'Corrected shelf measurements');
```

**Check the result**

- The original numeric record is retained for comparison.
- The existing line now stores the corrected coordinates.

**Try a change:** Change only LineWidth and verify that the coordinates and units do not change.

## Independent builds

### Build 1 — A household recycling display

Create a standalone script with one figure containing a 1-by-2 tiled layout. The first panel is a marked line for weekly paper-recycling masses [1.2 1.6 1.4 1.9] kg in weeks 1:4. The second is a bar chart of this week's collected item counts [8 5 11] for Glass, Metal, and Plastic, in that order. Label every axis with its quantity or category and include units where relevant. Give each panel a descriptive title. Use a zero-based vertical scale of [0 2.2] for the mass panel and [0 12] for the count panel. Keep the quantities on separate axes because their units differ. Save handles to both axes and both plotted objects.

### Build 2 — Comparing two queues fairly

Two small records contain waiting times in minutes: desk A = [0 3 5 8 10 11 15 19 20] and desk B = [1 1 4 6 7 9 12 14 18]. Create side-by-side count histograms in one figure, using identical edges [0 5 10 15 20]. Set both horizontal limits to [0 20] and both vertical limits to [0 4]. Label the panels and axes clearly. Keep the two histogram handles and their Values available for inspection. Write one comment describing what the displayed counts compare without claiming that either small record predicts future waiting times.

## Keep practising

Complete [practice.m](practice.m), then try the [practice quiz](quiz-practice.md).

## MATLAB documentation

- [Line plots and target axes](https://www.mathworks.com/help/matlab/ref/plot.html)
- [Scatter plots](https://www.mathworks.com/help/matlab/ref/scatter.html)
- [Histograms and bin edges](https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.histogram.html)
- [Tiled chart layouts](https://www.mathworks.com/help/matlab/ref/tiledlayout.html)
