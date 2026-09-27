% MATLAB | Lab 07: Files and Time-Based Data
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. CSV round trip
% Create a two-row tray table with tray numbers 1 and 2 and cup counts 4 and 0; save and read
% cups.csv in a fresh scratch folder.
% Tray column [1;2]; Cups column [4;0].
scratch = ____;
____(scratch);
T = table([1;2],____,'VariableNames',{'Tray','Cups'});
path = ____(scratch,'cups.csv');
____(T,path);
R = ____(path);

%% 2. Import identifiers
% Preserve the route labels 008 and 019 as strings while importing a CSV with delay minutes 2 and 5.
scratch = ____;
____(scratch);
T = table(["008";"019"],____,'VariableNames',{'Route','DelayMin'});
path = ____(scratch,'routes.csv');
____(T,path);
opts = ____(path);
opts = setvartype(opts,'Route',____);
R = readtable(path,____);

%% 3. MAT archive
% Save minutesSpent = [15;NaN;0] to session.mat and load it into structure kept.
minutesSpent = ____; % [15;NaN;0]
scratch = ____;
____(scratch);
path = ____(scratch,'session.mat');
____(path,'minutesSpent');
kept = ____(path);
same = ____(kept.minutesSpent,minutesSpent);

%% 4. Parse dates
% Read 13/10/2026 and 15/10/2026 as day/month/year dates and obtain their numeric day-of-month
% values.
textDate = ____; % ["13/10/2026";"15/10/2026"]
Time = datetime(textDate,'InputFormat',____);
dayNumber = ____(Time);

%% 5. Elapsed minutes
% A dishwasher runs from 23:40 on 14 October 2026 until 00:55 the next day. Calculate elapsed
% minutes.
startTime = ____(2026,10,14,23,40,0);
finishTime = ____(2026,10,15,0,55,0);
elapsed = ____ - startTime;
elapsedMin = ____(elapsed);

%% 6. Sort paired values
% Sort a parcel shelf log starting at 09:00 on 16 October 2026: minute offsets [25;0;10], parcel
% counts [2;7;4]. Compute consecutive time gaps.
Time = datetime(2026,10,16,9,0,0)+____([25;0;10]);
Parcels = ____; % [2;7;4]
T = ____(Time,Parcels);
ordered = sortrows(T,____);
gaps = minutes(____(ordered.Time));

%% 7. Missing slots
% At minute offsets 0 and 30 from noon on 17 October 2026, a cupboard has 0 and 6 mugs. Create a
% 15-minute grid through minute 30, keeping the missing slot unknown.
t0 = ____(2026,10,17,12,0,0);
Time = t0+minutes(____); % [0;30]
Mugs = ____; % [0;6]
TT = ____(Time,Mugs);
queryTimes = t0+minutes(____); % [0;15;30]
regular = retime(TT,queryTimes,____);
missingCount = sum(____(regular.Mugs));

%% 8. Coverage-aware daily summaries
% Readings on 18 October 2026 at 08:00 and 12:00 contain queue counts 0 and 6. The 08:00 reading on
% 19 October is missing. Produce daily means and observed counts.
Time = datetime(2026,10,18)+____([8;12;32]);
Queue = ____; % [0;6;NaN]
TT = ____(Time,Queue);
Observed = double(~____(Queue));
C = ____(Time,Observed);
avg = retime(TT,'daily',____);
count = retime(C,'daily',____);
report = ____; % concatenate avg and count horizontally
