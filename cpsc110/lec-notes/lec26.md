---
title: "Lecture 26"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-05"
titlepage: true
---

# Lecture 26

## Generative recursion: Is a Maze `solveable?`

- We model all the possible moves from each node/cell using a tree.
- We did not have a fixed template for an arbitrary arity tree because we are using generative recursion.
  - genrec is NOT data driven, so we won't always start with the data definitions that we need.
- Template tags _(see colour coded image on edX)_
  - `arb-tree`: we are generating an arbitrary arity tree
  - `genrec`: we need to create **new** data for each possibility
  - `backtracking`: to backtrack and traverse through every possibility in the possibility tree
  - `encapsulated`: due to `local`
- We created several helper functions that did not already exist.
  - First: wish list entries for helpers
    - Outside `solveable?` because our helper functions may be quite complicated, so we want to be able to test them.

## My questions

- Side-note: If we wanted to model moves in all four directions, could we use a Deterministic State Machine?
- Should we create helper functions for maze? So that if we change the implementation of maze, it will not break our tests and functions.
