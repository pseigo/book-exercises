defmodule Ep8 do
  @spec evens(integer) :: [integer]
  def evens(max) when is_integer(max) do
    for number when rem(number, 2) == 0 <- 0..max do
      number
    end
  end

  @spec evens(integer) :: [integer]
  def evens(max) when is_integer(max) do
    for number <- 1..(div(max, 2)) do
      number * 2
    end
  end

  @spec join_prepend(list(String.t()), separator :: String.t()) :: String.t()
  def join_prepend(binaries, separator) when is_list(binaries) do
    for binary <- binaries, into: "" do
      separator <> binary
    end
  end

  @spec join_between(list(String.t()), separator :: String.t()) :: String.t()
  def join_between(binaries, separator)
  def join_between([], _), do: ""
  def join_between([first | rest], separator) do
    do_join_between(rest, separator, first)
  end

  defp do_join_between([], _, acc), do: acc

  defp do_join_between([first | rest], separator, acc) do
    do_join_between(rest, separator, acc <> separator <> first)
  end
end

IO.puts Ep8.join_prepend(~w(path with starting separator), "/")
IO.puts Ep8.join_between(~w(path without starting separator), "/")
