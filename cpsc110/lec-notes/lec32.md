---
title: "Lecture 32"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-23"
titlepage: true
---

# Lecture 32

## Clicker questions

Data definition arrows

- If a type references some other type, and that ends up leading back to the original definition, the WHOLE cycle is mutual reference. Each arrow in the chain counts as a mutual reference arrow.
- The final may use `(listof X)` in a definition. Conceptually, there IS a data definition for this list, but it doesn't have to be written. So treat the question AS IF the definition IS written for the list. This will affect how many arrows you count.
