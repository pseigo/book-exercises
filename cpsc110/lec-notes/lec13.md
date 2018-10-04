---
title: "Lecture 13"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-03"
titlepage: true
---

# Lecture 13

## Clicker questions

- Refer to the videos on Naturals! There are many similarities between Naturals and Lists.
  - For Natural numbers, `add1` is like `cons`, `n` is like `first`, and `sub1` is like `rest`
  - The base case for Naturals is `0`, just like the base case for lists is `empty`

## Questions

- We do not need to write helper functions for functions consuming `Natural`.
  - The "`first`" of a `Natural` is still a `Natural,
  - as opposed to lists, where `(first list)` is a different type than `(rest list)`.
- NOTE: You can shorten `check-expect` to `c-e` on the midterm!
