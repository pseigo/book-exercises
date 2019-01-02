defmodule Mod do
  def fib_term(term) when is_number(term) and term >= 0 do
    do_fib_term(0, 1, 0, term)
  end

  defp do_fib_term(current, _, term, target) when term == target do
    current
  end

  defp do_fib_term(current, next, term, target) do
    do_fib_term(next, current + next, term + 1, target)
  end
end
