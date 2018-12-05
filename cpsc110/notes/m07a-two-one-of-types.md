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
| **empty** | true | false |
| **(cons String ListOfString)** | true | and firsts are equal; natural recursion |

In the video, we only had one test for each box, except for the bottom right. For "both lists are not empty," we generated several more tests to satisfy **2-deep**, los1 longer than los2, los1 shorter than los2, and a few more conditions where the function passes or fails with 2 or 3 deep lists.

## Models

- Type comments predict the templates
  - A type comment is a **model** of the functions operating on that type
  - Non-code representation of the program
  - Tells us what the function will look like
- Using a cross product of type comments table: simplifying at a **model level**
  - Simplifying without looking at details of code

## Two One-Of

- Cross product tables tell us the **minimum** number of `check-expect`s to write
- Cross product causes us to create a new template
  - `template` tag is just `(@template 2-one-of)`
- `cond` template questions are based on the cross product axes
- **On problem sets**, you must show your cross product table in a comment box
- When designing cross tables, ask
  - What data do I have access to?
  - What data do I need?
  - What data do I need to produce?
