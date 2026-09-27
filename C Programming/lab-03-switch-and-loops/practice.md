# C Programming - Foundations in Computer Science

## Lab 03 · Switch Statements and Loops: Practice

Build confidence choosing actions and repeating them safely. Replace each `____` using the comments, then try one activity at a time.

Each block is an independent `main` body. Put it inside `int main(void) { ... return 0; }` and add `#include <stdio.h>` above it. Inputs stay within each activity's stated domain.

### Switch Statements

#### 1. Laundry cycle code

Read one character. Q or q means a 15-minute quick cycle; N or n means a 40-minute normal cycle. Print the duration; print `Unknown` for every other character.

```c
____ cycle;
scanf(" %c", ____);
switch (____) {
case ____:                         // Uppercase quick code.
case ____:                         // Lowercase quick code.
    printf("____ minutes\n");
    ____;                       // Do not fall into the next cycle.
case ____:
case ____:
    printf("____ minutes\n");
    ____;
____:
    printf("____\n");
}
```

### Counter-Controlled While

#### 2. Plant-watering reserve

Read days (0–7) and starting water in whole litres. There is enough water for 2 litres each day. Display the litres remaining after each day, one value per line; zero days produces no output.

```c
____ days, water;
scanf("%d %d", &days, ____);
int day = ____;                      // No days completed yet.
while (day < ____) {
    water = water ____ 2;
    printf("%d\n", ____);
    day = day ____ 1;
}
```

### Sentinel-Controlled While

#### 3. Bottle-return counter

Read bottle counts from separate visits, each 0–20, ending with -1. The sentinel is guaranteed and is not a visit. Print the number of visits followed by the total bottles, on one line.

```c
____ bottles;
int visits = ____, total = 0;        // No visits or bottles counted yet.
scanf("%d", ____);
while (bottles ____ -1) {
    visits = visits ____ 1;
    total = total ____ bottles;
    scanf("%d", ____);
}
printf("%d %d\n", visits, ____);
```

### Do-While Loops

#### 4. One more game

A game is played before asking whether to play again. Read 1 to play another game or 0 to stop; a final 0 is guaranteed. Display how many games were played.

```c
____ again;
int games = ____;
____ {
    games = games ____ 1;
    scanf("%d", ____);
} while (again ____ 1);
printf("%d\n", ____);
```

### For Loops

#### 5. Photo reminders

Read a session duration of 0–120 minutes. Print reminder times every 15 minutes, beginning at minute 0 and including the end only if it falls on that schedule. Put each time on its own line.

```c
____ duration;
scanf("%d", ____);
for (int minute = 0; minute ____ duration; minute += 15) {
    printf("%d\n", ____);
}
```

### Continue

#### 6. Cancelled delivery stops

Read exactly six stop durations, each 0–60 minutes. Zero means cancelled. Use continue to skip cancelled stops; print only the number of completed stops.

```c
int completed = ____;
for (int stop = 0; stop < ____; stop++) {
    ____ minutes;
    scanf("%d", ____);
    if (minutes ____ 0) {
        ____;
    }
    completed = completed ____ 1;
}
printf("%d\n", ____);
```

### Break

#### 7. Fill a travel bag

The input contains a bag limit (1–50 kg) followed by exactly five positive integer item weights (1–50 kg). Accept items in order. Stop reading at the first item that would exceed the limit; do not include it. Print the accepted count and packed kg.

```c
____ limit;
scanf("%d", ____);
int accepted = ____, packed = 0;
for (int i = 0; i < ____; i++) {
    ____ weight;
    scanf("%d", ____);
    if (packed + weight ____ limit) {
        ____;
    }
    packed = packed ____ weight;
    accepted = accepted ____ 1;
}
printf("%d %d\n", accepted, ____);
```

### Nested Loops

#### 8. Two baking trays

Read three roll weights for the first tray, then three for the second. Each weight is 1–100 grams. Print each tray total on a separate line; reset the total before weighing the next tray.

```c
for (int tray = 0; tray < ____; tray++) {
    int grams = ____;                // A new total for this tray.
    for (int roll = 0; roll < ____; roll++) {
        ____ weight;
        scanf("%d", ____);
        grams = grams ____ weight;
    }
    printf("%d\n", ____);
}
```
