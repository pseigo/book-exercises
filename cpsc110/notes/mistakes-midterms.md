---
title: "Practice Midterm Mistakes"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-09"
titlepage: true
---

# Practice Midterm Mistakes

Mistakes I made on practice midterms.

## Mistakes

- 2017W1-MT1
  - Includes `dd-template-rule` that doesn't apply in that situation (`compound`)
  - Does not write helper function in itemization template with `ref` rule
  - Wrong order for `substring` and `string-ith`: should be `(<primitive> String I1 <I2>)`
  - Code does something other than what the question asked
  - ** Does not pass all arguments in Natural Helper, especially ones that are constant **
- 2017W2-MT1
  - Does half a page of work the question does not ask for
  - Only does half of what question asks for

## Style

- Write expression on a new line after the `else`
- Use `(zero? n)` instead of `(= n 0)` for recursive Natural functions
- Use given examples/constants!
  - Save time, easier to check, easier to grade

## Uncertainties

- `=`, not `=?`
- Struct with reference: rules are `compound` and `ref`
- Use primitive type for templates consuming a primitive (`@template String`)
- Include `dd-template-rules` for ALL itemization cases, even if some are the same rule


## How to prevent these mistakes

- Double check the connections in code
  - Check where template rules came from
  - Make sure `ref` and `self-ref` generate helper functions
- Memorize order of parameters for primitive functions, AND their names
- Read the question! Make sure you are doing what it asks.
- ** Make sure Natural Helper passes ALL arguments! **
