---
title: "Module 4b: Reference"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-09-30"
titlepage: true
---

# Module 4b: Reference

## Learning goal

- Be able to predict and identify the correspondence between references in a data definition and helper function calls in functions that operate on the data.

## Notes

- x

## Terminology

- **Reference relationship**: data definition that refers to a different type of data (that's not primitive!)
- **Natural helper**: when a data definition using natural recursion is actually a list of ANOTHER type of data, we have to include a function like `(fn-for-item)` in our template. This function call is called the natural helper.
  - this function call is written due to the `ref`erence rule!
  - When writing a function (HtDF) with a natural helper, we MUST create a **helper function**.
    - Make a wish list entry! HtDF tag, signature, purpose, stub, and `!!!`
