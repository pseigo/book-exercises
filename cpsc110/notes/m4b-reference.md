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
- **Reference rule**: for data definitions with a reference to another data definitions that you've defined
  - Rule: must wrap calls to referenced definition in that definition's template function (called a **natural helper**)
- **Natural helper**: a referenced data definition's template function due to the reference rule
  - A natural helper in a template says "do something complicated in a helper function that consumes the referred to type. do NOT do it here!"
  - HtDF: create a **helper function** for the natural helper
    - wish list entry: `@HtDF`, `@signature`, purpose, stub, and `!!!`
- **Helper function**: actual function written when doing HtDF
- **complicated? rule**: if it would take more than 1 function that operates on the referenced type, make a helper function instead.
