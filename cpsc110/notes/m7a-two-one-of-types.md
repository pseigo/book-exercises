---
title: "Module 7a: Two One-Of Types"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-19"
titlepage: true
---

# Module 7a: Two One-Of Types

## Learning goals

- Be able to produce the cross-product of type templates table for a function operating on two values with one-of types.
- Be able to use the table to generate examples and a template.
- Be able to use the table to simplify the function when there are equal answers in some cells.

## Function Model: Cross Product of Type Comments Table

- Cases of the `one-of` type comments go along the axes
  - The two arguments don't have to be the same type, but both must be a `one-of`
- Generate tests for each cross product cell in the table

Example for `ListOfString ListOfString -> x`:

| **los1 (right) los2 (down)** | **empty** | **(cons String ListOfString)** |
|-|-|-|
| **empty** | both lists are empty | los1 is not empty, but los2 is empty |
| **(cons String ListOfString)** | los1 is empty, but los2 is not empty | both lists are not empty |

In the video, we only had one test for each box, except for the bottom right. For "both lists are not empty," we generated several more tests to satisfy **2-deep**, los1 longer than los2, los1 shorter than los2, and a few more conditions where the function passes or fails with 2 or 3 deep lists.

## Terminology

- x
