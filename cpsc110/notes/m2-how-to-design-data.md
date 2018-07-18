# M2: How to Design Data

## Terminology

- cond is a **multi-armed conditional**: can have any number of cases, all at the same level
- **Problem domain**:
  - every program has a problem domain
- **Program**: represents information in the problem domain using data
- **Data definition**: describes how information is represented as data
  - _type comment_ defines a new type name
  - body shows how to form data of that type
  - _interpretation_ explains how to interpret data of this type as information, thereby establishing the information/data correspondence
  - _template_ skeleton for one-argument functions that consume data of this type

## Syntax and structures

- **cond**: expression that has different behaviour based on any number of predicates
- **`#;`**: comments out the entire expression or definition that follows the `#;`
- **`()` and `[]` are equivalent**: `[]` is used with `cond` cases by convention for clarity

## Other notes
- For now, the template for a function is determined by the type of data it consumes (i.e. the template of a data definition)
- In summary, a **data definition** describes:
  - how to form data of a new type
  - how to represent information as data
  - how to interpret data as information
  - template for operating on data
