# `for` macro

“Comprehension” is another word for Elixir’s for macro. It can be used to iterate through an enumerable, like Enum or Stream. `for` combines the features of `map`, `filter`, and `into`.

```elixir
for element <- Enumerable do
  element
end
# => Returns a list
```

Three main elements of the `for` macro:

- Generators
- Filters
- `:into`

# Generators

Generators specify what the `for` macro should iterate over. `element <- Enumerable`

A single generator behaves like `map`:

```elixir
for name <- ["Joe", "Suzy"] do
  String.upcase(name)
end
# => ["JOE", "SUZY"]

# Is equivalent to:
Enum.map ["Joe", "Suzy"], fn(name) ->
  String.upcase(name)
end
```

You can have multiple generators in a single for comprehension:

```elixir
suits = [:hearts, :diamonds, :clubs, :spades]
faces = [2, 3, 4, 5, 6, 7, 8, 9, 10,
         :jack, :queen, :king, :ace]

for suit <- suits,
    face <- faces do
    {suit, face}
end

# => [{:hearts, 2}, {:hearts, 3}, {:hearts, 4},
#     {:hearts, 5}, {:hearts, 6}, {:hearts, 7}, ...]
```

Generators can do filtering with a pattern match:

```elixir
for {:spades, face} <- deck do
  {:spades, face}
end
```

# Filters

Filter expressions are written after generators. They are similar to guards.

```elixir
for element <- Enumerable, filter do
  element
end

# Only numbered cards.
for {:spades, face} <- deck, is_number(face) do
  {:spaces, face}
end

# You can have multiple filters.
for {suit, face} <- deck,
    suit == :spades,
    is_number(face),
    face > 5,
    do: {suit, face}
```

# `:into`

Make `for` return something other than a list. Use `:into` to collect results into a `Collectable`.

```elixir
for {key, val} <- %{name: "Daniel", dob: 1991, email: "..."},
    key in [:name, :email],
    into: %{},
    do: {key, val}

# => %{name: "Daniel", email: "..."}
```

The target must support the [`Collectable`](http://elixir-lang.org/docs/stable/elixir/Collectable.html) protocol. This includes:

- Map
- List
- IO.Stream
  - eg. can be used to continually print from _standard in_ to _standard out_ in a console program.
- Bitstring (Binary)

# Variable scoping in `for`

All variables used in `for` are local.

```elixir
name = "Daniel"

for name <- names do
  String.upcase(name)
end

name # => "Daniel"; was NOT modified!
```

# `Enum` vs. `Stream` vs. `for`

## Comparison

| | Enum | Stream | `for` |
|-|-|-|-|
| `map` | <span style="color: green">YES</span> | <span style="color: green">YES</span> | <span style="color: green">YES</span> |
| `filter` | <span style="color: green">YES</span> | <span style="color: green">YES</span> | <span style="color: green">YES</span> |
| Lazy | <span style="color: red">NO</span> | <span style="color: green">YES</span> | <span style="color: red">NO</span> |
| Iterations | DEPENDS | ONE | ONE |
| `&` Operator | <span style="color: green">YES</span> | <span style="color: green">YES</span> | <span style="color: red">NO</span> |

Because `for` uses a `do` block, rather than an anonymous function, it does not support the capture operator. This can make either `Enum` or `Stream` a more elegant choice when you just want to run a function on each element.

## Tips

| Scenario | Recommended | Other notes |
|-|-|-|
| One operation | `Enum` or `for` | Personal preference. |
| Multiple operations | `for` or `Stream` | Use `for` most of the time. |
| Generating a list | `for` or a `Stream` generator | Use `for` most of the time. |
| Multiple lists | `for` | Think of using `for` first. |

As a beginner, maybe try to overuse the `for` macro for a while to learn what it's good and bad at.

# Exercises

1. Read the [`for` documentation](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#for/1).
2. Create a function, using `for`, which will return all the even numbers up to a given number.
3. Write a function, using `for`, which joins a list of binaries together with a separator.<sup>1</sup>

<sup>1</sup>_Hint: Remember, binaries also implement the `Collectable` protocol._

## Usage

```elixir
even(10)
# => [2, 4, 6, 8, 10]

join(["episodes", "08-comprehensions"], "/")
# => "/episodes/08-comprehensions"
```
