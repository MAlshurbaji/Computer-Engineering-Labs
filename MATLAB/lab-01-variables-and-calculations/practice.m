% MATLAB | Lab 01: Variables and Calculations
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Assignment and Multiplication
% A baker prepares 5 trays with 9 rolls on each. Declare the inputs and calculate totalRolls.
trayCount = ____;
rollsPerTray = ____;
totalRolls = trayCount ____ rollsPerTray;

%% 2. Unit Conversion
% A bottle contains 875 mL. There are 1000 mL per litre. Store its volume in litres and the volume
% of 4 such bottles.
millilitres = ____;
perLitre = ____;
bottleLitres = millilitres ____ perLitre;
totalLitres = ____ * bottleLitres;

%% 3. Parenthesized Arithmetic
% A game evening has 7 minutes of setup followed by 3 rounds, each containing 18 minutes of play and
% 4 minutes of cleanup. Calculate the total minutes.
setupMinutes = ____;
rounds = ____;
playMinutes = ____;
cleanupMinutes = ____;
totalMinutes = setupMinutes + rounds * ____;

%% 4. Powers and Square Roots
% A rectangular floor mat is 0.9 m by 1.2 m. Use the sum of the squared sides to calculate its
% diagonal, and calculate its area.
widthMetres = ____;
heightMetres = ____;
diagonalMetres = ____(widthMetres^2 + heightMetres^2);
areaSquareMetres = widthMetres ____ heightMetres;

%% 5. Whole Groups
% There are 62 photographs and 8 spaces on each album page. Calculate completely filled pages,
% photographs left after those pages, and pages needed for all photographs.
photoCount = ____;
pageCapacity = ____;
fullPages = ____(photoCount / pageCapacity);
leftoverPhotos = ____(photoCount, pageCapacity);
pagesNeeded = ____(photoCount / pageCapacity);

%% 6. Formatted Text
% A jar holds 5/9 of a litre. Keep the numeric division result and create labelText with exactly the
% format Jar: followed by a space, the volume to two decimal places, and a space then L. Display the
% text with a newline.
jarLitres = ____;
labelText = sprintf(____, jarLitres);
fprintf('%s\n', ____);

%% 7. Preserving a Previous Result
% A curtain initially needs 2.4 m of fabric. Preserve that length, revise the current length to 2.65
% m, and calculate the additional length.
currentMetres = ____;
previousMetres = ____;
currentMetres = ____;
extraMetres = currentMetres ____ previousMetres;

%% 8. Scalar Bounds
% A model volume slider accepts values from 0 through 40. Start with a request of -7, limit it to
% that interval, and calculate the absolute adjustment in slider units.
requested = ____;
upperLimited = ____(requested, 40);
applied = ____(0, upperLimited);
adjustment = ____(applied - requested);
