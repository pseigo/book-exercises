---
title: "Lecture 09"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-09-24"
titlepage: true
---

## Clicker questions

- Make sure to test your functions using `check-expect`s as well as by checking that running the program results in what you expect to happen
- Refer to "Data Driven Templates" on eDx for compound data templates

## Butterfly starter

### Process

- **`fly` function**
  - draw a scenario of the scene showing what you expect to happen!
  - write, in English, what you want the function to do. this will make your "code-writing-process" so much easier.
  - remember that adding (+) a number to an x or y coordinate will move an image closer to the bottom right corner of the scene.
  - similarly, subtracting (-) a number from an x or y coordinate will move an image closer to the top left of the scene, because the origin (0, 0) is at the top left of the scene.
- **`reverse-top` function**
  - consider all cases: "s" when stopped, "s" when moving, " " when moving up, " " when moving down, and another key like "a"
  - if you have no idea what to do when writing a function, start writing check expects until it makes sense

### Questions

- `render` runs everytime the world state updates (i.e. every tick)
