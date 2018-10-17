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

- Requires two cycles in the type reference graph
  - Due to arbitrary size in 2 dimensions

### 01-Mutually-Recursive Data (video)

- `ListOfElement`
  - self-reference (SR) cycle: allows directory's list of sub-elements to be arbitrarily long
  - reference to `Element`: mutual reference (MR)
- `Element`
  - reference to `ListOfElement`: mutual reference (MR)
- The **mutual reference cycle** allows each element (or node) to have an arbitrary number of sub-elements (or children)
  - i.e. allows tree to have arbitrary breadth
  - ONLY _Mutual Reference_ (MR) if both types reference each other. Otherwise, it is just a reference.
- There are a few "base cases" for this tree for which it stops growing. One or more of these must be the case.
    1. When an element has non-zero data. That node cannot have children.
    2. When an element has zero data and an empty list.
    3. When an element has zero data and a list with elements with non-zero data. The element's children will not have children (no grandchildren for you!).


## Terminology

- Arbitary-arity tree: nodes can have an arbitrary number of children
  - Arbitarily deep: an unknown number of levels
  - Aribitarily "wide": an unknown number of children
