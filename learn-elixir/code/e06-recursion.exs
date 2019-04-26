defmodule Recursion do
  @doc """
  Returns length of given `list`.

  ## Parameters

  - `list` - A list.

  ## Examples

      iex> list = ["banana", 5, :ok, [1, 2, 3]]
      iex> Recursion.length(list)
      4
  """
  def length(list) when is_list(list) do
    do_length(list, 0)
  end

  defp do_length([], acc) do
    acc
  end

  defp do_length([_|rest], acc) do
    do_length(rest, acc + 1)
  end

  @doc """
  Executes the given anonymous function, `fun`, on each element in `list`.

  Returns `:ok` .

  ## Parameters

  - `list` - List containing elements to operate on.
  - `fun` - Anonymous function with arity 1 to run on each element.

  ## Examples

      iex> Recursion.each([1, 5, 8], &(IO.puts &1))
      1
      5
      8
      #=> :ok
  """
  def each(list, fun) when is_list(list) and is_function(fun) do
    do_each(list, fun)
  end

  defp do_each([], _), do: :ok

  defp do_each([first|rest], fun) do
    fun.(first)
    do_each(rest, fun)
  end

  @doc """
  Invokes `fun` on each element in `list`.

  Returns list with results of each `fun` call.

  ## Parameters

  - `list` - List contaning elements to operate on.
  - `fun` - Anonymous function with arity 1 to run one each element.

  ## Examples

    iex> Recursion.map([-3, 1, 4], &(&1 + 3))
    [0, 4, 7]
  """
  def map(list, fun) when is_list(list) and is_function(fun) do
    do_map(list, fun, [])
  end

  defp do_map([], _, acc) do
    :lists.reverse(acc)
  end

  defp do_map([first|rest], fun, acc) do
    do_map(rest, fun, [fun.(first)|acc])
  end

  def sum(list) when is_list(list), do: do_sum(list, 0)

  defp do_sum([], sum), do: sum

  defp do_sum([first|rest], sum) when is_number(first) do
    do_sum(rest, sum + first)
  end

  def reduce([first|rest], fun) when is_function(fun) do
    reduce(rest, first, fun)
  end

  def reduce([first|rest], acc, fun) when is_function(fun) do
    reduce(rest, fun.(first, acc), fun)
  end

  def reduce([], acc, _), do: acc

  def reverse(list) when is_list(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc), do: acc
  defp do_reverse([first|rest], acc), do: do_reverse(rest, [first|acc])

end
