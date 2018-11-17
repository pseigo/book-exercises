---
title: "Lecture 29"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-16"
titlepage: true
---

# Lecture 29

## Clicker questions

See my m10-accumulators notes on what tail position means.

## Questions

- x

## Tail Recursion

- `rsf` - "Result so far" \[accumulator\]
- We add the accumulator as a parameter to both functions for the tree
- We `append` rather than `cons` so that our final `rsf` is not in reverse order

RSF accumulators say "I have done all the work, I am done."
CPA accumulators say "This is where I am."

It is important to understand the difference. When writing our base cases,what we put in the base case may be different from what our template put there.
