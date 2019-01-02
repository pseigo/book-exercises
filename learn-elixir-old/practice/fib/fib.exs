defmodule Backtrack do
  @moduledoc """
  Contains fib/1, used to calculate a given term in the fibonacci series. This
  solution uses backtracking; therefore, it is not tail-call optimized.

  # Performance issues

  For some reason, this solution is incredibly slow. On my machine, it takes
  around 5 seconds to calculate `fib(40)`, whereas TailCall.fib/1 can
  calculate a huge term such as `fib(10000)` instantly.
  """
  def fib(0), do: 0
  def fib(1), do: 1

  def fib(term) when term >=0 and is_integer(term) do
    fib(term - 2) + fib(term - 1)
  end

  def fib(_), do: {:error, "fibonacci term must be 0 or greater"}
end

defmodule TailCall do
  @moduledoc """
  Contains fib/1, used to calculate a given term in the fibonacci series. This
  solution is tail call optimized.
  """

  def fib(0), do: 0
  def fib(1), do: 1

  def fib(term) when is_integer(term) and term >= 0 do
    do_fib(fib(0), fib(1), 2, term)
  end

  def fib(_), do: {:error, "fibonacci term must be 0 or greater"}

  defp do_fib(prev2, prev1, term, target) when term == target do
    prev2 + prev1
  end

  defp do_fib(prev2, prev1, term, target) do
    do_fib(prev1, prev2 + prev1, term + 1, target)
  end
end
