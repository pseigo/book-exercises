---
title: "Module 8: Abstraction"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-26"
titlepage: true
---

# Module 8: Abstraction

## Learning goals

- Be able to identify 2 or more functions that are candidates for abstraction.
- Be able to design an abstract function starting with 2 or more highly repetitive functions (or expressions).
- Be able to design an abstract fold function from a template.
- Be able to write signatures for abstract functions.
- Be able to write signatures that use type parameters.
- Be able to identify a function which would benefit from using a built-in abstract function.
- Be able to use built-in abstract functions.

## Notes

- x

## Terminology

### Abstraction

- **Abstraction**: generalizing repetitive code (through refactoring)
  - Make programs smaller + easier to read
  - Separates knowledge domains more clearly in code
- **Abstract function**: a helper shared between multiple functions
  - More general than the original code
- **Abstraction from examples**: abstracting/generalizing functions that have already been written
  - Backwards HtDF recipe
  - Function definition -> Tests -> Purpose -> Signature
