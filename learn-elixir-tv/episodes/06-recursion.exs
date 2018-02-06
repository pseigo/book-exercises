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

    # 1. Write a sum function which calculates the total of a list of numbers.
    def sum(list) do
        sum(list, 0)
    end

    def sum([], sum) do
        sum
    end

    def sum([head|tail], sum) do
        sum(tail, sum + head)
    end

    # 2. Generalize your sum function so that the user can pass in a function to customize what it does.
    def reduce(list, fun) do
        do_reduce(list, fun, 0)
    end

    defp do_reduce([], _fun, acc) do
        acc
    end

    defp do_reduce([head | tail], fun, acc) do
        result = fun.(head, acc)
        do_reduce(tail, fun, result)
    end

    def reduce_test() do
        list = [1, 2, 3, 4]
        sum = fn(num, acc) ->
            num + acc
        end

        reduce(list, sum)
    end

    # Extra credit: Write your own reverse function.
    @doc """
    Returns a list with each element in reversed order.

    ## Parameters

    - `list` - A list collection.

    ## Examples

        iex> list = [1, 2, 3, 4]
        iex> Recursion.reverse(list)
        [4, 3, 2, 1]

        iex> char_list = 'Hello, World!'
        iex> Recursion.reverse(char_list)
        '!dlroW ,olleH'

    """
    def reverse(list) when is_list(list) do
        do_reverse(list, [])
    end

    defp do_reverse([], acc) do
        acc
    end

    defp do_reverse([head|tail], acc) do
        do_reverse(tail, [head|acc])
    end

    # Reversing a string/binary (my own little experiment)
    @doc """
    Returns a binary with each byte in reversed order.

    ## Parameters

    - `binary` - A binary or string.

    ## Examples

        iex> binary = <<239, 191, 19>>
        iex> Recursion.reverse(binary)
        <<19, 191, 239>>

        iex> string = "Hello, World!"
        iex> Recursion.reverse(string) # => strings are implemented as binaries
        "!dlroW ,olleH"

    ## Background
    I don't know much about binaries yet but was I able to do this by following
        the elixir-lang.org wiki:
    https://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html

    It's probably a bad way of doing it so don't use my code as an exemplar!! :)

    """
    def reverse(binary) when is_binary(binary) do
        do_reverse(binary, <<>>)
    end

    defp do_reverse(<<>>, acc) do
        acc
    end

    defp do_reverse(<<head, tail :: binary>>, acc) do
        do_reverse(tail, <<head>> <> acc)
    end
end
