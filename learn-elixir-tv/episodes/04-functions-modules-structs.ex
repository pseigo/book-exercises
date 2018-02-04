defmodule Math do
    def anon_function do
        add_anon = fn(a, b) ->
            a + b
        end

        sum = add_anon # the variable sum is another name for add_anon
        sum.(1, 2) # => 3
        add_anon.(1, 2) # => 3
    end

    @doc """
    Adds two integers together.
    """
    def add(a, b) do
        a + b
    end
end
