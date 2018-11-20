---
title: "Lecture 30"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-19"
titlepage: true
---

# Lecture 30

## Questions

- Does it matter where we put `todo`?
  - No, just be consistent. We typically put it right after the node.

## Accumulators

- Easier to blend a worklist accumulator into the template once you know what it's actually doing on paper.
- The worklist accumulator is usually initialized to `empty`.
- Reason why we added the worklist accumulator: the result-so-far accumulator helped, but it did NOT make the function tail recursive.

> **Note to self**: redo this lecture file form scratch. See paper materials posted. Follow paths drawn.

- `fn-for-t`: Updating todo list
- `fn-for-lot`: Handles first, gives rest when done with first
