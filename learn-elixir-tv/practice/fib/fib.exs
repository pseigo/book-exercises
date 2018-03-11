defmodule Backtrack do
  @moduledoc """
  Contains the `fib/1` function used to calculate a given term in the fibonacci
  series. This solution uses backtracking; therefore, it is not tail-call
  optimized.

  # Performance issues

  For some reason, this solution is incredibly slow. On my machine, it takes
  around 5 seconds to calculate `fib(40)`, whereas `TailCall.fib/1 can
  calculate a huge term such as fib(10000) instantly.
  """
  def fib(0), do: 0
  def fib(1), do: 1

  def fib(term) when term >=0 do
    fib(term - 2) + fib(term - 1)
  end

  def fib(_), do: {:error, "fibonacci term must be 0 or greater"}
end

defmodule TailCall do
  @moduledoc """
  Contains the `fib/1` function used to calculate a given term in the fibonacci
  series. This solution is tail call optimized.
  """

  def fib(0), do: 0
  def fib(1), do: 1

  def fib(term) when term >= 0 do
    do_fib(2, term, {fib(0), fib(1)})
  end

  def fib(_), do: {:error, "fibonacci term must be 0 or greater"}

  defp do_fib(curr, term, {prev2, prev1}) when curr == term do
    prev2 + prev1
  end

  defp do_fib(curr, term, {prev2, prev1}) do
    do_fib(curr + 1, term, {prev1, prev2 + prev1})
  end
end
