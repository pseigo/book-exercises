---
title: "Lecture 22"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-26"
titlepage: true
---

# Lecture 22

## Clicker questions

- The only point of variance between `positive-only` and `negative-only` is the predicate used to decide if an element remains in the list.

## Abstraction

- Signature for filter
  - (@signature (T -> Boolean) (listof T) -> (listof T))
  - !!! (need to double check)
- Signature for map
  - (@signature (T -> U) (listof T) -> (listof U))
  - `T` and `U` can be different
- Built-in abstract functions
  - `map`, `filter`, `foldr`, `foldl`, `build-list`, and more
- Any function that uses abstract functions must use the `use-absract-fn` template tag
  - `(@template use-abstract-fn)`
- Closures: remember that functions have access to parameters of functions they are contained by!
  - Do not have to use `encapsulated` tag
  - If you are depending on an additional parameter, you must use a [local] parameter.
  - If the work is simple/trivial, use local.
  - If the work is crazy complicated, write a separate function.
