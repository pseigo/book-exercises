defmodule Recursion do
    defmodule MyList do
        @doc """
        Returns the number of elements in a list.

        ## Examples

            iex> list = [1, 2, 3, 4]
            iex> length(list)
            4

        """
        def length(list) when is_list(list) do
            length(list, 0)
        end

        # base case
        defp length([], count) do
            count
        end

        defp length([_|tail], count) do
            length(tail, count + 1)
        end
    end
end
