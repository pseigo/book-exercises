---
title: "Module 11: Graphs"
subtitle: "CPSC 110"
author: [Peyton Seigo]
date: "2018-11-21"
titlepage: true
---

# Module 11: Graphs

## Learning goals

Key properties of graphs versus trees:

1. Include cycles
2. Can have multiple arrows leading to a single node

- Identify when domain information naturally forms a graph.
- Write data definitions for graphs.
- Construct cyclic data.
- Design templates that operate on graphs, using accumulators to prevent chasing infinite cycles in the graph.
- Ddesign functions that operate on graphs.

## Cyclic Data

We use a keyword, `shared`, to textually create and represent cyclic structure.

![Using `shared` to create a simple cylic graph.](resources/img/m11-ab-cycle.png){ width: 75% }

- `H2` is a shared expression.
- `-0-` is a name for the result of the `make-room` expression for A.


## Terminology

- **Acyclic Graph**: a graph without cycles
- **Directed Graph**: arrows go only in one direction
- **Directed Acyclic Graph (DAG)**: directed graph that cannot contain cycles; cannot visit the same node more than once by following edges
