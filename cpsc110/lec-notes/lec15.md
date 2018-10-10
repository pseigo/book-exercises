---
title: "Lecture 15"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-10"
titlepage: true
---

# Lecture 15

## Clicker questions

- We do not need to test inserting an element to the end of a list because it is treated the same as inserting into the middle.

## Finishing `arrange-people`: `sort`ing a List

```
          arrange-people
          / (fn. comp) \
      layout-people    sort
     / (reference)        \ (arbitrary sized data)
 make-image              insert
                            | (knowledge domain shift)
                          older?
```
