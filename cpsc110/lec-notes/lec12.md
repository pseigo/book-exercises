---
title: "Lecture 12"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-01"
titlepage: true
---

# Lecture 12

## Notes

- Office hours are now on Wednesday
- Feel free to take a look at my solution if you got stuck in class

## HtDW with self-referential data

- Do NOT violate the reference rule. If...
    1. a template has a natural helper, and
    2. you need to do more than 1 operation on the data in the list (complicated? rule), then
- ... you MUST create a helper function.
- Trust the natural recursion.
  - Your function body will look very similar to your tests
  - For the render function, you are placing an egg on <whatever else exists> and eventually on top of the MTS (which is the base case)
