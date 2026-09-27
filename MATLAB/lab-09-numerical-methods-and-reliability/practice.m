% MATLAB | Lab 09: Numerical Methods and Reliability
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Interpolation
% At minutes [0;4;10], recorded tea temperatures are [70;62;50] degrees C. Estimate at minute 7.
timeMin = ____; % [0;4;10]
tempC = ____; % [70;62;50]
estimate = interp1(timeMin,tempC,____,'linear'); % minute 7

%% 2. Domain checks
% Recorded heights [2;6;4] cm occur at distances [0;5;10] cm. Evaluate queries [-1;5;11] without
% extrapolation and mark unsupported outputs.
x = ____; % [0;5;10]
y = ____; % [2;6;4]
query = ____; % [-1;5;11]
estimate = interp1(x,y,query,____); % linear
unsupported = ____(estimate);

%% 3. Trapezoidal accumulation
% A jug fills at [1;2;4] L/min at minutes [0;2;3]. Estimate accumulated liters using the actual
% times.
timeMin = ____; % [0;2;3]
rateLpm = ____; % [1;2;4]
volumeL = ____(timeMin,rateLpm);

%% 4. Function integration
% For flow 1+2*t L/min on 0 through 3 minutes, construct a vector-compatible function and calculate
% accumulated liters.
flow = @(t) 1+2____t;
volumeL = ____(flow,0,____); % upper bound 3 minutes

%% 5. Interval rates
% A toy train travels cumulative distances [0;6;10] m at seconds [0;3;5]. Compute interval-average
% speeds and midpoint times.
timeSec = ____; % [0;3;5]
distanceM = ____; % [0;6;10]
speed = diff(distanceM)____diff(timeSec);
midSec = (timeSec(1:end-1)+timeSec(____))/2;

%% 6. Bracketed root
% The supplied volume model is V(t)=t^2+2*t liters for 0<=t<=5 minutes. Find when it reaches 8
% liters using bracket [0,5].
difference = @(t) t____2+2.*t-8;
[root,residual] = ____(difference,____); % bracket [0 5]

%% 7. Linear system
% Scoop volumes x satisfy 3*x(1)+x(2)=170 and x(1)+2*x(2)=140, in mL. Solve and calculate the
% largest absolute equation residual.
A = ____; % [3 1;1 2]
b = ____; % [170;140]
x = A____b;
errorSize = norm(____-b,Inf);

%% 8. Tolerance checks
% For reference values [100;0.2] and calculated values [100.00001;0.20000001], require
% abs(error)<=1e-8+1e-6*abs(reference) component by component.
reference = ____; % [100;0.2]
calculated = ____; % [100.00001;0.20000001]
allowed = 1e-8+1e-6*____(reference);
within = abs(calculated-reference)____allowed;
allPass = ____(within);
