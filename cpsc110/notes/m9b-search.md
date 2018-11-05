---
title: "Module 9b: Search"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-03"
titlepage: true
---

# Module 9b: Search

## Learning goals

- Identify whether a function should be designed using domain knowledge, structural recursion, built-in abstract list functions or generative recursion.
- Design a backtracking generative search.

## Lambda Expressions (i.e. Anonymous Functions)

Syntax:

```racket
(lambda (x y z) (... x y z)) ; OR
(λ (x y z) (... x y z))
```

You can insert a λ symbol in DrRacket using <kbd>CTRL</kbd> + <kbd>\\</kbd> (blackslash).

- Only used in one place
- Body is so easily understood that giving the function a name (with `local`) does not make the code easier to understand

## Terminology

- x
