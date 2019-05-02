# ENUMS
defmodule Episode do
  defmodule Enum do
    @doc """
    The filter expression was written as

        Enum.filter(peyton, &is_number(elem(&1, 1)))

    Alternatively, it could have been written as

        Enum.filter peyton, fn({_key, val}) ->
          is_number(val)
        end

    The first solution takes the entire tuple and accesses the value using
    `elem/2`, while the second solution uses pattern matching to extract the
    value.
    """
    def example do
      peyton = %{name: "Peyton", age: 19, eyes: "hazel", favnumber: 42}

      peyton_numbered_values = peyton
                              |> Enum.filter(&is_number(elem(&1, 1)))
                              |> Enum.into(%{})

      IO.puts "Before: "
      IO.puts(inspect peyton)

      IO.puts "After: "
      IO.puts(inspect peyton_numbered_values)
    end
  end

  defmodule Stream do

    def example do
      # ...
    end

    def month_in(number_of_months) do
      months = Stream.cycle [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ]
    end
  end
end

# STREAMS
