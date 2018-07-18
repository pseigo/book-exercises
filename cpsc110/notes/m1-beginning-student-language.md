#  M1: Beginning Student Language

- **Expression**: a value, primitive call, control structure; evalutes to a value
- **Primitive call, or "call to primitive"**: expression with an operator and operand(s)
  - `(<id> <expr>* )` where the number of `‹expr›`s determines the number of arguments supplied to the function named by `‹id›`.
  - Composed of a _function identifier_ (a primitive) and one or more _expressions_
  - Evaluation: first reduce operands to values, then apply primitive to values
  - "_call to string/image/number primitive_", based on parameter type
- **Function definition**: `define` with a function name so that it may be called
  - Returns value of the last expression
  - "_Racket programmers prefer to avoid side-effects, so a definition usually has just one expression in it's body_" ([2.2 Simple Definitions and Expressions](https://docs.racket-lang.org/guide/syntax-overview.html))
- **Function call or "procedure application"**: call to a defined function
- **Predicate**: a primitive or function that takes an input and returns a boolean value
