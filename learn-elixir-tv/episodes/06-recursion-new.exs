defmodule Rec do
  def each([], _fun) do
    :ok
  end

  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  # only make separate fun and do_fun when making an accumulator
  def map(list, fun) do
    do_map(list, fun, [])
  end

  defp do_map([], _fun, acc) do
    :lists.reverse(acc)
  end

  defp do_map([head | tail], fun, acc) do
    result = fun.(head)
    acc = [result | acc]
    do_map(tail, fun, acc)
  end

  # exercise 1: write a `sum` function which calculates the total of a list of numbers
  def sum(list) when is_list(list) do
    do_sum(list, 0)
  end

  defp do_sum([], acc) when is_number(acc) do
    acc
  end

  defp do_sum([head | tail], acc) when is_number(head) and is_number(acc) do
    do_sum(tail, acc + head)
  end

  defp do_sum([_head | tail], acc) when is_number(acc) do
    do_sum(tail, acc)
  end

  # exercise 2: generalize `sum` so the user can pass a function to customize what it does
  def reduce([], _fun) do
    {:error, "empty error, list must contain at least one element"}
  end

  # `fun` will only be executed `n - 1` times where `n` is the length of the list.
  def reduce([head | tail], fun) when is_function(fun) do
    reduce(tail, head, fun)
  end

  def reduce([], acc, _fun) do
    acc
  end

  def reduce([head | tail], acc, fun) when is_function(fun) do
    acc = fun.(head, acc)
    reduce(tail, acc, fun)
  end

  # exercise 3: write your own `reverse` function
  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc) do
    acc
  end

  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end
end

# Example 1: each
IO.puts "Example 1: each"

Rec.each [1, 2, 3], fn(num) ->
  IO.puts to_string(num)
end


# Example 2: map and each
IO.puts "\nExample 2: map and each"

people = [
  {"Maddie", 17},
  {"Cohen", 2},
  {"Peyton", 18}
]

names = Rec.map people, fn({name, _age}) ->
          name
        end

Rec.each names, fn(n) ->
  IO.puts(n)
end


# Example 3: sum
IO.puts "\nExample 3: sum"

numbers = [-3, 0, 1, 3, 5]

IO.puts Rec.sum(numbers)


# Example 4: reduce
IO.puts "\nExample 4: reduce"

# The initial value of the accumulator is the first element, `1`.
IO.puts(Rec.reduce numbers, fn(n, acc) -> n + acc end)

# The initial value of the accumulator is specified as `10`.
IO.puts(Rec.reduce numbers, 10, fn(n, acc) -> n + acc end)

IO.puts(Rec.reduce ["Hello", ", World!", " :)"], fn(str, acc) -> acc <> str end)


# Example 5: reverse
IO.puts "\nExample 5: reverse"

some_list = [1, 2, 3]

IO.puts "before:"
Rec.each some_list, fn(n) ->
  IO.puts(n)
end

some_list = Rec.reverse(some_list)

IO.puts "after: "
Rec.each some_list, fn(n) ->
  IO.puts(n)
end
