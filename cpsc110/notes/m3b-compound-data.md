---
title: "Module 3b: Compound Data"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-09-21"
titlepage: true
---

# Module 3b: Compound Data

- Be able to identify domain information that should be represented as compound data.
- Be able to read and write define-struct definitions.
- Be able to design functions that consume and/or produce compound data.
- Be able to design world programs that use compound world state.


## Notes

- **`define-struct`**: defines four general definitions
  - Definitions:
    - the **struct** itself
    - **constructor**: `make-<struct-name>`
    - **selector(s)**: `<struct-name>-<field-name>`
      - A unique selector is created for each field name
    - **predicate**: `<struct-name>?`
  - `(define <struct-name> (x y))`
    - `x` and `y` have given this `struct` two field names
  - Define a `<struct-name`> struct using:
    - `(define S1 (<struct-name> x y))`
    - `x` and `y` set values for the field names

## Terminology
