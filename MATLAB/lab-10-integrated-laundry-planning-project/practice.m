% MATLAB | Lab 10: An Integrated Laundry Planning Project
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Project table
% Create a folding table with IDs P1/P2, counts [5;9], and minutes [7;11].
Session = ____; % ["P1";"P2"]
Towels = ____; % [5;9]
Minutes = ____; % [7;11]
T = ____(Session,Towels,Minutes);

%% 2. Validity masks
% For counts [0;6;8] and times [0;NaN;-1], retain finite nonnegative times and whole nonnegative
% counts. Keep measured zeros.
counts = ____; % [0;6;8]
times = ____; % [0;NaN;-1]
valid = isfinite(counts) & counts>=0 & counts==floor(counts) & ____(times) & times____0;
keptTimes = times(____);

%% 3. Duplicate policy
% IDs ["A";"B";"A"] have minutes [4;9;4]. Keep the first complete record per ID in source order.
ID = ____; % ["A";"B";"A"]
Minutes = ____; % [4;9;4]
T = ____(ID,Minutes);
[~,idx] = unique(T.ID,____); % first-appearance order
kept = T(____,:);

%% 4. Chronological records
% Offsets [2;0;1] days from 1 December 2026 have minutes [12;7;9]. Sort complete rows
% chronologically.
Time = datetime(2026,12,1)+____([2;0;1]);
Minutes = ____; % [12;7;9]
T = ____(Time,Minutes);
ordered = sortrows(T,____);

%% 5. Declared training rows
% Counts are [2;4;6;8], times [5;7;9;12]. Fit the first three rows and predict the last.
counts = ____; % [2;4;6;8]
times = ____; % [5;7;9;12]
coeff = polyfit(counts(____),times(1:3),1);
predicted = polyval(coeff,counts(____));

%% 6. Evaluation report
% Held-out observations are [14;18;20] minutes and predictions [13;19;18]. Report both with signed
% residuals and MAE.
observed = ____; % [14;18;20]
predicted = ____; % [13;19;18]
residual = observed____predicted;
mae = mean(____(residual));
report = ____(observed,predicted,residual);

%% 7. Supported planning inputs
% Coefficients are [1.2 2], training counts span 5 through 15 inclusive, and proposed counts are
% [4;10;16]. Estimate only inside the range; keep other estimates NaN.
coeff = ____; % [1.2 2]
proposed = ____; % [4;10;16]
inside = proposed>=5 ____ proposed<=15;
estimates = ____(size(proposed));
estimates(inside) = polyval(coeff,proposed(____));

%% 8. Report archive
% Create report columns Towels=[4;8] and Minutes=[6;10], save report to MAT in a fresh folder, load
% into a structure, and compare.
report = table([4;8],____,'VariableNames',{'Towels','Minutes'}); % minutes [6;10]
scratch = ____;
____(scratch);
path = ____(scratch,'report.mat');
____(path,'report');
archive = ____(path);
match = ____(archive.report,report);
