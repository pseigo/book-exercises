# M2: How to Design Data

## Terminology

- cond is a **multi-armed conditional**: can have any number of cases, all at the same level
- **Problem domain**: contains information about a problem (e.g. light is red)
  - every program has a problem domain
- **Program**: uses data to represent information in the problem domain
- **Data definition**: describes how information is represented as data
  - _type comment_ defines a new type name
  - body shows how to form data of that type
  - _interpretation_ explains how to interpret data of this type as information, thereby establishing the information/data correspondence
  - _template_ skeleton for one-argument functions that consume data of this type
    - demonstrates each possible case for the data type
- **Atomic information**: can't be taken apart into pieces AND still be meaningful in the problem domain
  - e.g. the city name "Vancouver" can be broken into V-a-n-c-o-u-v-e-r, but they are not meaningful to a city name (whereas a city itself is meaningful to a province, country, etc.)
  - _"the elapsed time since the start of the animation, the x coordinate of a car or the name of a cat"_

## Syntax and structures

- **cond**: expression that has different behaviour based on any number of predicates
- **`#;`**: comments out the entire expression or definition that follows the `#;`
- **`()` and `[]` are equivalent**: `[]` is used with `cond` cases by convention for clarity
- **`Integer[0, 33)`**: a range of `Integer`s from `0` (inclusive) to 33 (non-inclusive)

## Other notes
- For now, the template for a function is determined by the type of data it consumes (i.e. the template of a data definition)
- In summary, a **data definition** describes:
  - how to form data of a new type
  - how to represent information as data (information into data)
  - how to interpret data as information (information from data)
  - template for operating on data

## Thoughts and observations

> **DISCLAIMER**: This section may contain incorrect assumptions and information.

My current assumption is that in Racket, we create thorough and specific data types to represent information in the problem domain. From the course documentation for _How to Design Data (HTDD)_:

> "So, for example, one data definition might say that numbers are used to represent the `Speed` of a ball. Another data definition might say that numbers are used to represent the `Height` of an airplane. So given a number like 6, we need a data definition to tell us how to interpret it: is it a `Speed`, or a `Height` or something else entirely. Without a data definition, the 6 could mean anything."

This is different compared to languages like C++ where we either use an Enum to represent many named values for one type of data, or meaningfully name primitive data to convey our intentions.

e.g. representing the speed of an airplane in m/s, in Racket

```racket
;; Speed is Natural
;; interp. magnitude of an object's velocity in meters per second

#;
(define (fn-for-speed s)
  (... t))

;; Template rules used:
;;   - atomic non-distinct: Natural
```

e.g. representing the speed of an airplane in m/s, in C++

```c++
int speed_meters_per_second = 245;
```
