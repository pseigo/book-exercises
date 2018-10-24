---
title: "Module 6b: Mutual Reference"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-15"
titlepage: true
---

# Module 6b: Mutual Reference

## Learning goals

Learn how to use multiple mutually referential types.

- Be able to identify problem domain information of arbitrary size that should be represented using arbitrary arity trees.
- Be able to use the design recipes to design with arbitrary arity trees.
- Be able to use the design recipes with mutually-referential data.
- Be able to predict and identify the correspondence between external-, self- and mutual-reference in a data definition and calls, recursion and mutual-recursion in functions that operate on the data.

## Notes

Mutually recursive data: Arbitrary-arity trees


### Mutually-Recursive Data

- Mutually-recursive data
  - Requires two cycles in the type reference graph
    - Due to arbitrary size in 2 dimensions
  - Data definition: do both definitions at the same time
  - Group type comments + interpretations, then put all examples and templates after
    - `<Comments + interp. for data definition 1>`
    - `<Comments + interp. for data definition 2>`
    - `<Examples and templates for both>`
- `ListOfElement`
  - self-reference (SR) cycle: allows directory's list of sub-elements to be arbitrarily long
  - reference to `Element`: mutual reference (MR)
- `Element`
  - reference to `ListOfElement`: mutual reference (MR)
- The **mutual reference cycle** allows each element (or node) to have an arbitrary number of sub-elements (or children)
  - i.e. allows tree to have arbitrary breadth
  - ONLY _Mutual Reference_ (MR) if both types reference each other. Otherwise, it is just a reference.


## Terminology

- Arbitary-arity tree: nodes can have an arbitrary number of children
  - Arbitarily deep: an unknown number of levels
  - Aribitarily "wide": an unknown number of children
- Mutual Reference: structure in types
- Mutual Recursion: structure in templates
- Natural Mutual Recursion: structure in function


## Reference, self-reference, and mutual-reference terms

Cause and effect of template rules (from top to bottom)

- Referential Data:
    1. Reference (R) in type comment
    2. Natural Helper (NH) in template
    3. Helper function wraps type causing NH in function
- Self-Referential Data:
    1. Self-reference (SR) in type comment
    2. Natural recursion (NR) in template
    3. Helper function wraps type causing NR in function
- Mutually-Recursive Data:
    1. Mutual Reference Cycle (MR) in type comments
    2. Natural Mutual Recursion (MR) in templates
    3. Helper function wraps type causing MR in function
