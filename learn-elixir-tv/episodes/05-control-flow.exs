defmodule Flow do
    @doc """
    "Main" function to test each concept.
    """
    def main do
        # cond
        cond do
            1 + 1 == 1 ->
                "This will never happen."
            2 * 2 != 4 ->
                "Nor this."
            true ->
                "This will!"
        end
    end

    # pattern matching: executes the first function definition that matches, if any
    def blank?(nil),    do: true
    def blank?(false),  do: true
    def blank?(""),     do: true
    def blank?(_other), do: false

    # using guards and pattern matching together
    def blank?(value) when value in [nil, false, ""], do: true
    def blank?(_other), do: false

    # best real world way for this situation: only uses `in` operator.
    # doesn't use guards or pattern matching.
    def blank?(value), do: value in [nil, false, ""]
end
