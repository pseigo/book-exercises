# 'How to Design Programs' in Elixir

## Introduction

The CPSC 110 course at the University of British Columbia uses Racket and _How to Design Programs_ (HTDP) to teach systematic software design.

This document translates many of the "templates" (patterns for common problems) from Racket to Elixir.

Note that this Racket code features many pedantic comments used to help the students better understand the concepts. They also use `@` tags from a small library used within the course.

### Glossary

| Term | Description
|-|-
| HTDP | How to Design Programs
| HTDF | How to Design Functions
| HTDW | How to Design Worlds
| `@signature` | Describes parameter type(s) and output type(s)
| `@template` | Describes "template rules" used in building the function
| `;` | Indicates a temporary comment (to-dos, stubs, etc.)
| `;;` | Indicates a permanent comment (purpose statement, accumulator descriptions, etc.)

## Accumulators (Module 10)

### Problem Description

Use an accumulator to design a tail-recursive function that (1) consumes a list of numbers and (2) produces the sum of all the numbers in the list.

### Racket

```scheme
(@HtDF sum)
(@signature (listof Number) -> Number)
;; produce sum of all elements of lon
(check-expect (sum empty) 0)
(check-expect (sum (list 2 4 5)) 11)

(@template accumulator)
(define (sum lon0)
  ;; acc: Natural; sum of the elements of lon0 seen so far
  ;; (sum (list 2 4 5)) ; top level call
  ;;
  ;; (sum (list 2 4 5)  0)
  ;; (sum (list   4 5)  2)
  ;; (sum (list     5)  6)
  ;; (sum (list      ) 11) ; must know the answer by this point!
  ;;
  (local [(define (sum lon acc)
            (cond [(empty? lon) acc]
                  [else
                   (sum (rest lon)
                           (+ acc (first lon)))]))]

    (sum lon0 0)))
```

### Elixir

```elixir
@doc """
Produces sum of all elements in `list`.

## Examples

  iex> HTDP.Accumulators.sum([])
  0

  iex> HTDP.Accumulators.sum([2, 4, 5])
  11
"""
def sum(list) when is_list(list) do
  do_sum(list, 0)
end

defp do_sum([], acc), do: acc

defp do_sum([first|rest], acc) when is_number(acc) do
  do_sum(rest, acc + first)
end
```

### Racket

```scheme
(@HtDF generic)
(@signature (listof T) -> T)
;; produce ... (purpose statement)
(check-expect (generic ...) ...)
(check-expect (generic ...) ...)
; ...

(@template accumulator)
(define (generic lot0)
  ;; acc: T; ... of the elements in lot0 seen so far
  ;;
  ;; (generic (list ...)) ; top level call
  ;; (generic (list ...) 0)
  ;; <... step-by-step>
  ;; (generic (list    ) ...)
  ;;
  (local [(define (generic lot acc)
            (cond [(empty? lot) ...] ; base case
                  [else
                   (generic (rest lon)
                            (... acc
                                 (first lon)))]))]

    (generic lot0 ...)))
```

### Elixir

```elixir
@doc """
Produces ...

## Examples

  iex> HTDP.Accumulators.sum(input)
  :expected-output
"""
def sum(list) when is_list(list) do
  do_sum(list, 0)
end

defp do_sum([], acc), do:

defp do_sum([first|rest], acc) when is_number(acc) do
  do_sum(rest, acc + first)
end
```



## Title (Module ##)

### Racket

```scheme

```

### Elixir

```elixir

```
