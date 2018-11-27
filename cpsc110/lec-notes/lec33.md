---
title: "Lecture 33"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-26"
titlepage: true
---

# Lecture 33

## Clicker questions

- A node is in a cycle if it is possible to visit it multiple times by traversing the graph.

## Questions

- Probably going to be expected to write graph definitions on the final exam.

## Functions Operating on Graphs

When you see a graph problem, remember: it is just an arbitrary arity tree problem with cycles. Main differences:

1. Multiple arrows can point to a node.
2. Possible to get stuck in cycles.

Data definitions:

- Main change: must use `shared` to handle cyclic data

FUnctions

- Need a context preserving accumulator to keep track of visited nodes so we don't get stuck in cycles
- Don't take combination argument for granted
  - `union` vs. `append`
  - `min-with-false` vs `min`
