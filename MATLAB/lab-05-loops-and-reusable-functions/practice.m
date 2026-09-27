% MATLAB | Lab 05: Loops and Reusable Functions
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Accumulation
% Use dailyPages=[8 0 12 5]. Initialize a total at zero and add every entry with a for loop.
dailyPages = ____;
totalPages = ____;
for k = ____
    totalPages = ____;
end

%% 2. Preallocation
% For row itemCounts=[2 5 0], compute packing seconds as 6+3*count in a same-sized preallocated
% output.
itemCounts = ____;
seconds = ____;
for k = ____
    seconds(k) = ____;
end

%% 3. Nested Loops
% Rows are groups [2 4] people; columns are [3 5 6] biscuits per person. Fill the two-by-three
% requirement matrix.
people = ____;
perPerson = ____;
required = ____;
for r = ____
    for c = ____
        required(r,c) = ____;
    end
end

%% 4. Bounded while
% A 20-minute slot takes consecutive jobs [6 7 9 2] minutes, stopping at the first that does not
% fit. Start used and count at zero.
jobs = ____;
used = ____;
count = ____;
while ____
    used = ____;
    count = ____;
end

%% 5. Local Functions
% Copy this whole section into its own script. Define ribbonNeed(boxes,cmPerBox) to multiply its
% inputs; call it for seven boxes and 45 cm per box.
neededCm = ____;
function cm = ribbonNeed(boxes,cmPerBox)
    cm = ____;
end

%% 6. Multiple Outputs
% Copy the whole section into its own script. splitPacks returns full packs and leftovers for 23
% markers, six per pack; use floor division and subtraction.
[packs,loose] = ____;
function [whole,remainder] = splitPacks(markers,packSize)
    whole = ____;
    remainder = ____;
end

%% 7. Function Validation
% Copy the whole section into its own script. shelfArea accepts only a numeric, real, finite,
% nonnegative scalar side in cm, returning side squared and true; otherwise return NaN and false.
% Call it with -2.
[area,ok] = ____;
function [area,valid] = shelfArea(sideCm)
    valid = ____;
    area = ____;
    if ____
        area = ____;
    end
end

%% 8. Anonymous Functions
% Create an anonymous rule doublePlusOne(x)=2*x+1 that also accepts an array. Evaluate it on row [0
% 2 5].
doublePlusOne = ____;
result = ____;
