---
title: "Lecture 20"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-22"
titlepage: true
---

# Lecture 20

## Clicker questions

Write the step-by-step evaluation for:

```racket
(define a 20)
(define (bar z)
  (local [(define a 2)
          (define (bar x)
            (+ x 1))]

    (bar (+ a z))))
```

Solution:

```racket
; 1
(local [(define a 2)
        (define (bar x)
          (+ x 1))]

  (bar (+ a 10)))

; 2
(define a_0 2)
(define (bar_0 x)
  (+ x 1))

(bar_0 (+ a_0 10))

; 3
(bar_0 (+ 2 10))

; 4
(bar_0 12)

; 5
(+ 12 1)

; 6
13
```

It is important to realize that step 2, the local expression, has 3 steps that all happen at the same time.

## General notes

**Important**: for cross-table-product in problem sets

1. Include table in problem sets
2. Number cases in table from 1->n
    - `(1), (2), ... (n)`
3. Number cond cases in code corresponding to cases in table

## Questions

- Order of `template` tag arguments: should match the order in which each component is changed in the template

## Encapsulation with `local`

Writing a **trampoline**:

- new function should consume & produce the same thing as the original function (now wrapped in `[]`) that consumes the same data.
- should match the function that you think the user _actually_ wants to call, the only one they really care about.
