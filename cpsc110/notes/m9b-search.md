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

Syntax (both are equivalent):

```racket
(lambda (x y z) (... x y z))
(λ (x y z) (... x y z))
```

You can insert a λ symbol in DrRacket using <kbd>CTRL</kbd> + <kbd>\\</kbd> (blackslash).

Use when either:

- Function is only used in one place.
- Body is so easily understood that giving the function a name (with `local`) does not make the code easier to understand.

## Sudoku Solver

We are **generating** an **arbitrary-arity** tree and doing a **backtracking search** over it.

- **"Generating"**: suggests generative recursion.
- **"Arbitrary-arity"**: recursion over an arbitrary-arity tree.
  - each branch in the tree has 0 to 9 children where each child explores all the possibilities for one cell (the next move)
- **"Backtracking search"**: after generating all possible moves, we search for a complete solution.

## Template Blending

We use

- What a function consumes
- What it produces
- And all in all, what it does

to learn about the **form** of the function before we work on details.

## Terminology

- x
