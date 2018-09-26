---
title: "Lecture 10"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-09-26"
titlepage: true
---

# Lecture 10

## Clicker questions

- Make sure you're caught up with the videos.

## HtDD and HtDF for Lists

- A list is an itemization, NOT an enumeration, because `(cons String ListOfString)` is compound data, i.e. not distinct
- Templates for lists are almost identical to those used for compound data
  - Remember to include the template rule for Self Reference
- **Self-reference**: the relationship between an itemization's case that refers to the data definition itself and the data definition
- **Natural recursion**: the relationship within a self-referencing data type's template where the template actually refers to itself!
  - i.e. a template's function named `fn-for-los` will call itself within its own definition using `(fn-for-los (rest los))`
- i.e. self-reference refers to the data definition, natural recursion applies to a function that uses that type of data
- If you're having trouble understanding recursion, there are great videos on youtube by ComputerPhile and the like explaining this concept. They won't be using Racket if they're using code, however, which may be confusing. Therefore, focus on the concept of recursion.
- Natural recursion for `positive-only`
  - Main idea: Throw away negative values. Add positive values to the rest of the list.
- The `empty?` predicate in the cond statement for a function using natural recursion checks if the WHOLE list is empty, not if it contains empty!
  - `(empty? (cons 3 empty))` -> false
  - `(empty? empty)` -> true
