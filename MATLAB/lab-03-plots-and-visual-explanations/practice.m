% MATLAB | Lab 03: Plots and Visual Explanations
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Explicit Axes and Labels
% Plot battery readings [90 76 61 48] percent at elapsed hours [0 2 4 6]. Use a new figure, explicit
% axes, and circular markers joined by a line. Label axes Elapsed time (h) and Battery level (%),
% and title the plot Battery readings.
hours = ____;
percent = ____;
fig = ____();
ax = axes('Parent',____);
batteryLine = ____(ax,hours,percent,'o-');
xlabel(ax,____);
ylabel(ax,____);
title(ax,____);

%% 2. Paired Sorting
% Recorded days [4 2 1 3] have plant heights [12 9 8 11] cm respectively. Sort the days and reorder
% the heights with the same positions. Plot a connected line on new axes labelled Day and Height
% (cm).
recordedDay = ____;
recordedHeight = ____;
[day,order] = ____(recordedDay);
height = recordedHeight(____);
fig = ____();
ax = axes('Parent',____);
plantLine = plot(ax,____,____,'o-');
xlabel(ax,____);
ylabel(ax,____);

%% 3. Two Lines and a Legend
% At minutes [0 5 10], two mugs have temperatures [60 52 46] and [60 55 50] deg C. Plot both on one
% new axes, using the supplied line styles. Attach legend labels Mug A and Mug B to their handles.
% Label axes Elapsed time (min) and Temperature (deg C). Restore hold off.
minutes = ____;
mugA = ____;
mugB = ____;
fig = ____();
ax = axes('Parent',____);
lineA = plot(ax,minutes,____,'o-');
hold(ax,____);
lineB = plot(ax,minutes,____,'s--');
hold(ax,____);
key = legend(ax,____,["Mug A" "Mug B"]);
xlabel(ax,____);
ylabel(ax,____);

%% 4. Scatter Coordinates
% Five parcels have masses [1 3 2 5 4] kg and wrapping times [2 5 3 8 6] min respectively. Draw an
% unconnected scatter plot with filled markers of area 45 points squared on new axes. Label them
% Parcel mass (kg) and Wrapping time (min).
kilograms = ____;
minutes = ____;
fig = ____();
ax = axes('Parent',____);
points = ____(ax,kilograms,minutes,____,'filled');
xlabel(ax,____);
ylabel(ax,____);

%% 5. Bar Categories
% Create bars for [6 2 5] towels in Bathroom, Cupboard, and Laundry respectively, in that order. Use
% positions 1:3, a vertical range [0 7], and labels Location and Towel count.
counts = ____;
fig = ____();
ax = axes('Parent',____);
bars = ____(ax,1:3,counts);
xticks(ax,____);
xticklabels(ax,____);
xlabel(ax,____);
ylabel(ax,____);
ylim(ax,____);

%% 6. Histogram Edges
% Six checkout waits are [0 3 4 7 8 12] min. Make a count histogram with edges [0 4 8 12]. Label
% axes Wait (min) and Observation count. Save the histogram Values as binCounts.
minutes = ____;
edges = ____;
fig = ____();
ax = axes('Parent',____);
waits = ____(ax,minutes,edges);
xlabel(ax,____);
ylabel(ax,____);
binCounts = waits.____;

%% 7. Tiled Axes
% Create a 1-by-2 layout. Plot plant A heights [5 7 8] and plant B heights [6 6.5 7] cm against days
% 1:3 in separate tiles. Give both vertical limits [0 10], labels Day and Height (cm), and titles
% Plant A and Plant B.
day = ____;
heightA = ____;
heightB = ____;
fig = ____();
layout = ____(fig,1,2);
axA = nexttile(layout,____);
lineA = plot(axA,day,____,'o-');
ylim(axA,____);
xlabel(axA,____);
ylabel(axA,____);
title(axA,____);
axB = nexttile(layout,____);
lineB = plot(axB,day,____,'o-');
ylim(axB,____);
xlabel(axB,____);
ylabel(axB,____);
title(axB,____);

%% 8. Updating an Existing Handle
% Plot recorded amounts [2 4 3] litres against bucket numbers 1:3. Preserve that record, correct
% bucket 2 to 3.5 L in a copy, and update the existing line with the corrected values. Set its width
% to 2 and axes limits to [0 5]. Label axes Bucket number and Amount (L).
recorded = ____;
fig = ____();
ax = axes('Parent',____);
amountLine = plot(ax,____,recorded,'o-');
corrected = ____;
corrected(____) = 3.5;
amountLine.____ = corrected;
amountLine.LineWidth = ____;
ax.YLim = ____;
xlabel(ax,____);
ylabel(ax,____);
