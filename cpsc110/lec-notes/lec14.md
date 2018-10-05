---
title: "Lecture 14"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-10-05"
titlepage: true
---

# Lecture 14

## Clicker questions

- The reference rule applies when a list contains **non-primitive data**, i.e. data defined by the user

## Function composition

**Function composition rule**: if you're doing at least 2 independent task on a list of items, you must use **function composition**

```
          arrange-people
          /            \
      layout-people    sort
     /                   \
 draw-person              ?
```

- Because the composite functions already test the base cases, we do NOT need the base case in the parent function
  - In today's example, `layout-people` and `sort` already test the base cases, so `arrange-people` does not need to test them
- Because the composite functions are consuming a list, `ListOfPerson`, which contains non-primitive data, we can't forget about the **reference rule**! We have to write helper functions.
