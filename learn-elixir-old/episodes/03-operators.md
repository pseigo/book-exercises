# 03-operators

## Match operator (`=`)

- Use `_` to ignore elements in matches
- Use `^` to just use the value of a variable and don't rebind it

```elixir
# Matching maps
%{name: name, age: age} = %{name: "Peyton", age: 18}

# Matching structs: assert a **type** of struct
%Author{} = %Author{name: "Daniel", age: 24}

# Matching binaries
"Hello, " <> word = "Hello, World!"
word # => "World!"
```

## Math operators

```elixir
1 + 1   # => 2
5 - 2   # => 3
15 / 3  # => 5.0
3 * 5   # => 15
```

## Math operators (word functions)

"Elixir provides the functions `div/2` and `rem/2` for integer division and remainder."

### Modulus/remainder

```elixir
rem(15, 5)  # => 0
rem(5, 2)   # => 1
```

### Division

```elixir
div(4, 2)   # => 2
div(11, 3)  # => 3
div(12, 3)  # => 4
```

## Comparison and logical operators

### Strict

`or`, `and`, `not`, `===`, `!==`

#### Word functions

"Elixir provides three boolean operators: `or`, `and` and `not`. These operators are strict in the sense that **they expect a boolean (`true` or `false`) as their first argument.**"

"`or` and `and` are short-circuit operators. They only execute the right side if the left side is not enough to determine the result."

#### Symbol functions

For `===` and `!==`, it checks if each side is an exact match (data AND type must match).

```elixir
iex> 1 == 1.0
true
iex> 1 === 1.0
false
```

### Non-strict

`==`, `!=`, `<=`, `>=`, `<`, and `>`

### Sorting order

`number < atom < reference < function < port < pid < tuple < map < list < bitstring`

## List operators

- Assert an element is present in a list with `in`.

```elixir
"Daniel" in ["Ash", "Leslie", "Dori"] # => false
"Daniel" in ["Daniel"]                # => true
```

- Combine two lists with `++`.
  - Be mindful of performance issues due to the nature of immutable linked lists

```elixir
[1, 2, 3] ++ [4]  # => [1, 2, 3, 4]
```

- Remove members from a list with `--`.

```elixir
[1, 2, 3] -- [1, 3] # => [2]
```

- Prepend to a list with the pipe operator, `|`.

```elixir
list = [1, 2, 3]
[0 | list]  # => [0, 1, 2, 3]
```

- Combine `|` with `=` for complex matches.

```elixir
[head, elem | tail] = [1, 2, 3]

head # => 1
elem # => 2
tail # => [3]
```

## Binary operators

- Concatenate two binaries with `<>`.
- Interpolate values into binaries with `#{}`.
- Compare a binary to a pattern with `=~`.

```elixir
"Goodbye" =~ ~r/Good/ # => true
"Goodbye" =~ "Good"   # => true
"Hello" =~ "World"    # => false
```

## Bitwise operators

Work directly on binary data. Documentation available in bitwise module.
