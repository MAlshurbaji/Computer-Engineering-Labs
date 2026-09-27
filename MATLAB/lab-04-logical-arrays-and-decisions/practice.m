% MATLAB | Lab 04: Logical Arrays and Decisions
% Fill each ____ with MATLAB code.
% Copy ONE completed section into a new scratch script and run that script.
% Other unfinished sections can prevent this whole file from parsing.
% Each section is independent. Copy any local functions with its section.
% Keep script statements before local function definitions.

%% 1. Inclusive Comparisons
% Use row weights [1.2 2.0 2.4 0.8] kg; select weights at most 2.0 kg and count them.
weightKg = ____;
fits = ____;
selectedKg = weightKg(____);
numberSelected = ____;

%% 2. Combined Masks
% Use row lengths [80 100 120 140] cm and damaged=[0 1 0 0]. Select undamaged lengths from 90
% through 130 cm inclusive.
lengthCm = ____;
damaged = ____;
usable = ____;
chosenCm = ____;

%% 3. Row and Column Reductions
% Use packed=[1 0;1 1;0 1], rows picnic baskets and columns cup/spoon. Return a completeness column
% and an item-coverage row.
packed = ____;
complete = ____;
covered = ____;

%% 4. Masked Assignment
% Use requested=[2 5 1 4] notebooks. Copy it to prepared and raise entries below three to three;
% leave requested unchanged.
requested = ____;
prepared = ____;
small = ____;
prepared(____) = ____;

%% 5. Ordered Branches
% For remainingSeats=4, set roomStatus to FULL at zero, FEW for 1–4, otherwise OPEN. Assume a
% nonnegative integer.
remainingSeats = ____;
if ____
    roomStatus = ____;
elseif ____
    roomStatus = ____;
else
    roomStatus = ____;
end

%% 6. Safe Scalar Guards
% Use empty tickets=[]; firstIsSmall is true only if a first ticket exists and is less than 10. Do
% not index an empty vector.
tickets = ____;
firstIsSmall = ____;

%% 7. switch Choices
% Use boxType="flat". Set heightCm to 4 for flat, 12 for tall, otherwise NaN.
boxType = ____;
switch ____
    case ____
        heightCm = ____;
    case ____
        heightCm = ____;
    otherwise
        heightCm = ____;
end

%% 8. Input Validation
% Use minutes=[15 Inf 20]. Set valid true only for a nonempty vector of finite, nonnegative entries;
% set decision to CHECK or USABLE accordingly.
minutes = ____;
entryOK = ____;
valid = ____;
if ____
    decision = ____;
else
    decision = ____;
end
