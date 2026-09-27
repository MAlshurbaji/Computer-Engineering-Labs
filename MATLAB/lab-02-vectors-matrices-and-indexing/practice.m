% MATLAB | Lab 02: Vectors, Matrices, and Indexing
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Regular Vectors
% Create a row of marks from 2 to 14 cm in steps of 3 cm. Separately create seven evenly spaced
% marks from 2 to 14 cm, including both endpoints. Count the first vector entries.
marks = ____;
sevenMarks = ____(2,14,7);
markCount = ____(marks);

%% 2. Dimensions and Totals
% Two drawers hold spoons, forks, and knives: first row [7 5 4], second row [3 6 2]. Create the
% matrix, count its rows, and calculate one total per drawer.
cutlery = ____;
drawerCount = size(cutlery,____);
drawerTotals = sum(cutlery,____);

%% 3. Endpoint Indexing
% Walking durations are [18 24 21 30 26] minutes in recorded order. Select the final two durations
% and calculate the last duration minus the first.
minutes = ____;
lastTwo = minutes(____);
changeMinutes = minutes(____) - minutes(____);

%% 4. Submatrix Selection
% Rows of [4 9 2; 6 3 8; 7 5 1] describe three storage baskets; columns describe towels, cloths, and
% napkins. Extract baskets 1 and 3, with napkins before towels.
counts = ____;
selected = counts(____,____);

%% 5. Paired Division
% Three bottles hold [600 750 900] mL and are shared among [3 5 6] people respectively. Calculate
% the mL per person for each group without combining groups.
bottleMillilitres = ____;
people = ____;
perPerson = bottleMillilitres ____ people;

%% 6. Logical Selection and Updates
% Recorded waiting times are [4 10 7 12 10] minutes. Select times at least 10 minutes and count
% them. In a separate copy, replace only those times with 9.
minutes = ____;
selected = minutes ____ 10;
longWaits = minutes(____);
selectedCount = ____(selected);
plannedMinutes = ____;
plannedMinutes(____) = 9;

%% 7. Orientation and Element-wise Powers
% Three square tiles have side lengths [0.2 0.3 0.4] m as a row vector. Calculate their individual
% areas, then create a column vector containing those areas in the same order.
sidesMetres = ____;
areasRow = sidesMetres ____ 2;
areasColumn = ____;

%% 8. Weighted Totals
% Two garden-bed plans contain counts of small and large pots: [3 2; 1 4]. A small pot needs 2
% litres of soil and a large one needs 5 litres. Use a matrix product to calculate one soil total
% per plan.
potCounts = ____;
litresPerPot = ____;
soilLitres = potCounts ____ litresPerPot;
