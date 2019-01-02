defmodule Comp do
  def even(number) when is_integer(number) do
    for n <- 1..number,
        rem(n, 2) == 0,
        do: n
  end

  def join(enumerable, separator \\ "") do
    for b <- enumerable,
        into: "",
        do: separator <> "#{b}"
  end
end

IO.puts "Exercise 1"

IO.inspect Comp.even(10)
IO.inspect Comp.even(-7)

IO.puts "\nExercise 2:"

IO.inspect Comp.join(["episodes", "08-comprehensions"], "/")
IO.inspect Comp.join(1..5)
IO.inspect Comp.join('ABC abc', "~")
IO.inspect Comp.join(["This", :is, [0x61], true, 'variety'], " ")
