defmodule HTDP do
  defmodule Accumulators do
    @moduledoc """
    Accumulators from module 10.
    """

    @doc """
    Produces sum of all elements in `list`.

    ## Examples

      iex> HTDP.Accumulators.sum([])
      0

      iex> HTDP.Accumulators.sum([2, 4, 5])
      11
    """
    def sum(list) when is_list(list) do
      do_sum(list, 0)
    end

    defp do_sum([], acc), do: acc

    defp do_sum([first|rest], acc) when is_number(acc) do
      do_sum(rest, acc + first)
    end
  end
end
