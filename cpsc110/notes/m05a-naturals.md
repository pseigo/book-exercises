---
title: "Module 5a: Naturals"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-02"
titlepage: true
---

# Module 5a: Naturals

## Learning goals

- Be able to design functions that operate on natural numbers.
- Be able to design a simple alternative representation for natural numbers.

## Notes

For the `Natural` data definition in 01-naturals-starter.rkt:

- Template rules wouldn't normally put `n` by itself in the template, but because our funny "compound" data does NOT have a `(first lon)` equivalent, we end up adding `n` ourselves.
  - There must be a way for the first element to **contribute its result**!

For `to-list` with signature `Natural -> ListOfNatural` in 01-naturals-starter.rkt:

- Since ListOfNatural is the produced type (as opposed to the consumed type), and the type is so simple, we do not need to write a template for it.

## Terminology

- x
