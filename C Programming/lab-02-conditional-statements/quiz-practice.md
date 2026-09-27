# Lab 02 · Conditional Statements in C: Practice Quiz

Write a complete C program for each task.

Read the values in the stated order. Assume valid input. Print only the specified result.

## 1. Phone volume

Read two integers: the saved volume level (`0`–`10`) and the mute setting (`0` for off, `1` for on).

When mute is on, the effective volume is zero. Otherwise, keep the saved volume. Print `Volume: ` followed by the effective volume.

**Sample input**

```text
7 1
```

**Sample output**

```text
Volume: 0
```

## 2. Parcel locker

Read a parcel's width and height as integers from `1` to `100`, in centimetres. The locker opening is 40 cm wide and 25 cm high. Touching the edges is allowed; the parcel cannot be folded.

- Print `Fits as entered` if it fits in the entered orientation.
- Otherwise, print `Rotate parcel` if a quarter-turn makes it fit.
- Otherwise, print `Too large`.

If both orientations fit, keep the entered orientation.

**Sample input**

```text
20 35
```

**Sample output**

```text
Rotate parcel
```

## 3. Pickup or delivery

Read four integers: the shop price, the total bus fare there and back, the online price, and the delivery fee. Prices are `1`–`500` AED; fares and fees are `0`–`100` AED.

The pickup total is the shop price plus the bus fare. The delivery total is the online price plus the delivery fee. Choose the cheaper option; choose pickup when the totals are equal.

Print either `Pickup: N AED` or `Delivery: N AED`, replacing `N` with the chosen total.

**Sample input**

```text
30 6 32 3
```

**Sample output**

```text
Delivery: 35 AED
```

## 4. Download an ebook

Read four integers: Wi-Fi connected (`0` or `1`), mobile data permitted (`0` or `1`), ebook size (`1`–`1000` MB), and remaining mobile allowance (`0`–`2000` MB).

- If Wi-Fi is connected, print `Wi-Fi`, regardless of the other values.
- Otherwise, print `Mobile data` only when mobile data is permitted and the allowance covers the entire ebook, including an exact match.
- In every other case, print `Wait`.

**Sample input**

```text
0 1 120 120
```

**Sample output**

```text
Mobile data
```
