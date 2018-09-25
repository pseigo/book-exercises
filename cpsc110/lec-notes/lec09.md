---
title: "Lecture 09"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-09-24"
titlepage: true
---

# Lectore 09

## Clicker questions

- Make sure to test your functions using `check-expect`s as well as by checking that running the program results in what you expect to happen
- Refer to "Data Driven Templates" on eDx for compound data templates

## Butterfly starter

### Process

- **`fly` function**
  - Draw a scenario of the scene showing what you expect to happen!
  - If you get stuck writing a function's body, then write, in English on a sheet of paper, what you want to happen when you call the function.
  - Remember that adding (+) a number to an x or y coordinate will move an image closer to the bottom right corner of the scene.
  - Similarly, subtracting (-) a number from an x or y coordinate will move an image closer to the top left of the scene, because the origin (0, 0) is at the top left of the scene.
- **`reverse-top` function**
  - Consider all cases: "s" when stopped, "s" when moving, " " when moving up, " " when moving down, and any other key that's not supposed to have functionality like "a"
  - If you have no idea what to do next when writing a function, start writing check expects until it makes sense! these tests will guide your understanding of the problem

### Questions

- `render` runs everytime the world state updates (i.e. every tick)
