% MATLAB | Lab 06: Tables, Strings, and Data Cleaning
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Constructing tables
% Create T from Item = ["towel";"blanket"] and Count = [3;2], using those exact variable names.
% Store its number of records in recordCount.
Item = ____;
Count = ____;
T = ____(Item,Count,'VariableNames',{'Item','Count'});
recordCount = ____(T);

%% 2. Selecting records and contents
% Use Book = ["map";"guide";"novel"] and Pages = [12;80;160]. Store all fields of books with at
% least 80 pages in selected, and their numeric page counts in pageCounts.
Book = ____;
Pages = ____;
T = ____(Book,Pages);
keep = T.Pages ____ 80;
selected = T(____,:);
pageCounts = T{keep,____};

%% 3. Normalizing string labels
% Normalize labels ["  Upstairs";"UPSTAIRS ";"downstairs"] by trimming edge whitespace and
% lowercasing. Count exact matches to "upstairs" in upstairsCount.
rawLabels = ____;
labels = ____(____(rawLabels));
upstairsCount = ____(labels ____ "upstairs");

%% 4. Standardizing a missing marker
% In recorded = [0;15;-1;20], minutes of -1 mean unrecorded. Standardize that marker, count missing
% entries, and retain known minutes including zero.
recorded = ____;
minutes = ____(recorded,-1);
missingMask = ____(minutes);
missingCount = ____(missingMask);
knownMinutes = minutes(____);

%% 5. Removing only missing required measurements
% Make T from Item = ["basket";"box";"bag"] and Kg = [1.5;NaN;0]. Remove rows missing Kg using
% rmmissing and its DataVariables option. Store the original-row removal mask as removed.
Item = ____;
Kg = ____;
T = ____(Item,Kg);
[clean,removed] = ____(T,'DataVariables',{'Kg'});
removedCount = ____(removed);

%% 6. Retaining the first record for each key
% Use DeliveryId = [8;5;8;6] and Pieces = [2;4;2;1]. Keep the first row for each DeliveryId,
% preserving first-seen order, in deduplicated.
DeliveryId = ____;
Pieces = ____;
T = ____(DeliveryId,Pieces);
[~,firstIndex] = ____(T.DeliveryId,'stable');
deduplicated = T(____,:);

%% 7. Sorting by two keys
% Use Task = ["vacuum";"dust";"wash"] and Minutes = [8;3;3]. Sort complete rows by Minutes
% ascending, then Task ascending, into ordered.
Task = ____;
Minutes = ____;
T = ____(Task,Minutes);
ordered = ____(T,{'Minutes','Task'},{'ascend','ascend'});

%% 8. Summarizing recorded quantities
% Use Shelf = ["top";"bottom";"top"] and Books = [4;3;2]. Use groupsummary to count rows and sum
% Books by Shelf, then sort by Shelf.
Shelf = ____;
Books = ____;
T = ____(Shelf,Books);
summary = ____(T,'Shelf',____,'Books');
summary = ____(summary,'Shelf');
