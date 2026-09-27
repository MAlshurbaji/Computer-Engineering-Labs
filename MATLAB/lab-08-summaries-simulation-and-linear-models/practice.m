% MATLAB | Lab 08: Summaries, Simulation, and Linear Models
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Descriptive center
% For parcel masses [2;3;3;8] kilograms, compute mean, median, and observed range.
massKg = ____; % [2;3;3;8]
avgKg = ____(massKg);
midKg = ____(massKg);
rangeKg = max(massKg)-____(massKg);

%% 2. Sample spread
% Compute sample standard deviation of bus intervals [6;8;10] minutes with N-1 normalization.
intervalMin = ____; % [6;8;10]
sampleSD = std(intervalMin,____); % N-1 normalization
variance = sampleSD____2;

%% 3. Column summaries
% Rows are visits; columns are shelves. For [0 5;4 NaN;8 7], calculate each shelf mean and observed
% count.
counts = ____; % [0 5;4 NaN;8 7]
avg = mean(counts,____,'omitnan'); % reduce rows
observed = sum(~____(counts),1);

%% 4. Repeatable simulation
% Use twister seed 54 to generate six refill amounts uniformly from 20 to 30 mL, then restore the
% previous generator state.
oldState = ____;
rng(____,'twister'); % seed 54
amountMl = 20+10*____(6,1);
rng(____);

%% 5. Means of simulated samples
% With seed 61, simulate 50 groups of five uniform waits from 1 to 3 minutes. Return one mean per
% group and restore the state.
oldState = ____;
rng(____,'twister'); % seed 61
waits = 1+2*rand(____); % 50 rows, 5 columns
groupMean = mean(waits,____); % average each row
rng(____);

%% 6. Linear coefficients
% Fit minutes [5;8;11] against basket counts [1;2;3], then predict at two baskets.
x = ____; % [1;2;3]
y = ____; % [5;8;11]
coeff = ____(x,y,1);
estimate = polyval(coeff,____); % two baskets

%% 7. Prediction errors
% Measured laundry times are [12;17;21] minutes and predictions [13;15;22]. Compute
% observed-minus-predicted residuals, MAE, and RMSE.
measured = ____; % [12;17;21]
predicted = ____; % [13;15;22]
residual = measured____predicted;
mae = mean(____(residual));
rmse = sqrt(mean(residual____2));

%% 8. Independent evaluation
% Fit training inputs [1;2;3] with minutes [4;7;10]. Evaluate at [4;5] with measured minutes [14;15]
% and compute held-out MAE.
xTrain = ____; % [1;2;3]
yTrain = ____; % [4;7;10]
xTest = ____; % [4;5]
yTest = ____; % [14;15]
coeff = polyfit(____,yTrain,1);
predicted = polyval(coeff,____);
mae = mean(abs(____-predicted));
