# Enum

Most Enum functions have this signature: `Enum.function(Enumerable, fun)`

Types which implement enumerable:

- Lists
- Keyword lists
- Maps (not Structs)
- Ranges
- Streams

# Useful enum functions

The following `Enum` functions were mentioned in the episode:

- [at/2](http://elixir-lang.org/docs/stable/elixir/Enum.html#at/3)
- [filter/2](http://elixir-lang.org/docs/stable/elixir/Enum.html#filter/2)
- [reduce/3](http://elixir-lang.org/docs/stable/elixir/Enum.html#reduce/3)
- [into/2](http://elixir-lang.org/docs/stable/elixir/Enum.html#into/2)
- [take/2](http://elixir-lang.org/docs/stable/elixir/Enum.html#take/2)

## `Enum.at/2`

Gets an element of a list at a certain index.

```elixir
Enum.at([1, 2, 3], 1, :default)
# => 2

Enum.at(%{name: "Peyton", 0, :default})
# => {:name, "Peyton"}
```

> **Notice:**
> When maps are enumerated, they are treated as a list containing one tuple for each key-value pair.

## `Enum.filter/2`

Filters an enumerable down to only those elements that pass the filter.

```elixir
Enum.filter ["string", 2, {}, %{}], &is_number/1
# => [2]

Enum.filter %{name: "Peyton", dob: 2000}, fn({_key, val}) ->
  is_binary(val)
end
# => [name: "Peyton"]
```

> **Notice:**
> Filtering a map with by enumeration returns a `KeywordList`, not a `List`.

> **Recall:**
> A keyword list is a list of two-element tuples where the first element of each tuple is an atom.


## `Enum.reduce/2`

Reduces an enumerable down to a single value.

`Enum.reduce(enumerable, initial_accumulator, function)`

```elixir
Enum.reduce [1, 2, 3], 0, fn(num, sum) ->
  sum + num
end
# => 6

Enum.reduce ["episodes", "07-enum-and-stream"], "", fun(segment, path) ->
  path <> "/" <> segment
end
# => "/episodes"
# => "/episodes/07-enum-and-stream"
```

## `Enum.into/2`

Convert an `Enumerable` to another type. Target must implement `Collectable` protocol.

`Enum.into(enumerable, collectable)`

```elixir
%{name: "Peyton", dob: 2000}
|> Enum.filter(fn({_k, v}) -> is_binary(v) end) # => [name: "Peyton"]
|> Enum.into(%{})                               # => %{name: "Peyton"}
```

This example filters a map and ensures that the result _stays_ as a map. The `KeywordList` is the `Enumerable`, and the empty map—`%{}`—is the `Collectable`.

## `Enum.take/2`

Take a number of elements [off the front] from an `Enumerable`.

```elixir
Enum.take(1..10, 5)
# => [1, 2, 3, 4, 5]
```

> **Note:**
> `take/2` does not delete or remove elements. It takes part of a list to create a new list. Think of it as literally taking something and running off with it.

# Capture operator

`&` captures or creates an anonynmous function.

Here's a medium post talking about the capture operator: [Elixir Function Capturing
](https://medium.com/everydayhero-engineering/elixir-function-capturing-13a3ed963fe3)

## Capturing a function name

```elixir
# verbose:
Enum.filter [1, 2, 3], fn(val) ->
  is_number
end

# shorthand: using arity, where arguments are not specified
Enum.filter([1, 2, 3], &is_number/1)

# shorthand: specifying arguments passed to function
Enum.filter([1, 2, 3], &is_number(&1))
```

## Creating an anonymous function

```elixir
# verbose
Enum.reduce [1, 2, 3], 0, fn(num, sum) ->
  sum + num
end

# shorthand
Enum.reduce([1, 2, 3], &(&1 + &2))
```

## Capturing operators

Since operators are functions, they can be captured.

```elixir
Enum.reduce([1, 2, 3], &+/2)

# we should probably use `Enum.sum/1` instead, though :)
Enum.sum([1, 2, 3])
```

## Capturing functions other modules

```elixir
Enum.map(["Daniel", "Joe"], &String.upcase/1)
# => ["DANIEL", "JOE"]
```

# Stream

`Stream` is a lazy version of `Enum`.

```elixir
[1, 2, 3, "string"]
|> Stream.filter(&is_number/1)
|> Stream.map(&(&1 * &2))
# => %Stream{enum: [1, 2, 3, "string"], funs: [...]}
```

Unlike enums, functions called using `Stream` are not run right away. They return a `Stream` struct containing the enumerable to operate on and a list of functions to run on the enumerable.

```elixir
%Stream{
  enum: [1, 2, 3, "string"],
  funs: [
    #Function<33.4663558/1 in Stream.map/2>,
    #Function<6.4663558/1 in Stream.filter/2>
  ]
}
```

Therefore, stream operations can be built up programatically.

```elixir
stream = Stream.filter(list, &is_number/1)
stream = Stream.filter(stream, &(&1 * 2 == 4))
```

## Executing a stream

You can use `Enum.into/2` to convert a `Stream` into a `List`.

```elixir
Enum.into(stream, [])
```

Use `Stream.run/1` when you don't need the result.

```elixir
[1, 2, 3]
|> Stream.each(fn(n) -> IO.puts(n) end)
|> Stream.run
```

## `Stream` vs. `Enum`

**`Stream` can be more efficient.** If you need to run multiple functions—which are usually combinations of `Enum` functions—they may be doing the same thing. For example, iterating over a list.

`Enum` executes as soon as possible, while `Stream` does it at the last possible moment.

- `Stream` implements most `Enum` functions, lazily
- `Enum` is better for short enumerables and one operation
- `Stream` is better for long enumerables with multiple operations

```elixir
# Iterates over the list twice.
list
|> Enum.filter(&is_number/1)
|> Enum.filter(&(&1 * 2 == 4))

# Iterates over the list once.
list
|> Stream.filter(&is_number/1)
|> Stream.filter(&(&1 * 2 == 4))
|> Enum.into([])
```

# Creating streams

These `Stream` building functions were mentioned in the episode:

- [cycle/1](http://elixir-lang.org/docs/stable/elixir/Stream.html#cycle/1)
- [iterate/2](http://elixir-lang.org/docs/stable/elixir/Stream.html#iterate/2)
- [resource/3](http://elixir-lang.org/docs/stable/elixir/Stream.html#resource/3)

## `Stream.cycle/1`

Creates an infinite stream of repeating elements.

```elixir
Stream.cycle(["Spring", "Summer", "Autumn", "Winter"])
|> Enum.take(8)

# => ["Spring", "Summer", "Autumn", "Winter",
#     "Spring", "Summer", "Autumn", "Winter"]
```

## `Stream.iterate/2`

Creates an infinite stream with a function.

`Stream.iterate(starting_value, function)`

```elixir
Stream.iterate(2, &(&1 * &2))
|> Enum.take(3)

# => [2, 4, 8]
```

## `Stream.resource/3`

`Stream.resource(start_fun, next_fun, after_fun)`

Convert anything into a string.

- Paginated data
- Lines in a file
- Events on a socket

Check out [Daniel's blog post on Stream.resource/3](https://blog.danielberkompas.com/2015/03/28/stream-paginated-apis-in-elixir/).
