---
title: "Lecture 17"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-15"
titlepage: true
---

# Lecture 17

## Clicker questions

- See the Module 6b notes for a review on all the template rule names, what the relationships in templates are called, and what happens in the functions because of those templates
  - Type comments
    - Reference
    - Self-reference
    - Mutual reference
  - Function template
    - Natural helper
    - Natural recursion
    - Natural mutual recursion

## Questions

- To `else` or not to `else` in a template?
  - We can use `else` in a list because it is a standard template. It's always going to look the same.
  - We should NOT use `else` in a generic definition with `one-of`, because we might extend it later on.
    - So, if a definition has multiple compound cases, use a predicate for EVERY case! Do NOT use `else`!
- Note about `dd-template` rules: there is no tag for mutual reference, so just use `ref` in both templates if you are still writing the rules.

## Arbitrary-Arity Trees

- List: arbitrary number of elements
  - Binary tree: arbitrary depth tree where each node has 0 to 2 sub-nodes
  - Ternary tree: arbitrary depth tree where each node has 0 to 3 sub-nodes
- How do we know when to stop?
  - We should be able to have as many sub-nodes as we want
- Mutual reference: two types reference each other
-
