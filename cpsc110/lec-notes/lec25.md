---
title: "Lecture 25"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-02"
titlepage: true
---

# Lecture 25

## Generative Recursion

- Write base case check-expects
- Write check-expect of one higher order of complexity
- Start asking yourself, "how can I implement the generative recursion into this check-expect?"
  - Once you get to the body of the function, clean up duplicate calls with `local` to prevent recomputation
- We fill in the comments about base case, reduction and argument so we KNOW that the recursion will end at some point. This is different from structural recursion (i.e. what we were doing before) in that whether the recursion will end is NOT guaranteed.
  - It is also useful to help you write your function.

1. Realized we need a trivial case, so we created it.
2. Realized we needed to do a repetitive task, and we have to generate new data!
3. We call the function on the generated data and append it all together.

We did not finish this in class. Take a look at the quicksort pseudocode from edX.
