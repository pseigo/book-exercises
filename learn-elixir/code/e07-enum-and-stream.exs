defmodule Episode.Enum do
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

defmodule Episode.Stream do
  import Stream, only: [resource: 3]

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
    Enum.at(months, Date.utc_today().month - 1 + number_of_months)
  end

  def month_in_alternate(number_of_months) when is_integer(number_of_months) do
    month_now_zero_based = Date.utc_today().month - 1
    month_then_zero_based = rem(month_now_zero_based + number_of_months, 12)
    months = [
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
    Enum.at(months, month_then_zero_based)
  end

  @doc """
  From [resource/3 docs](https://hexdocs.pm/elixir/Stream.html#resource/3).
  """
  def read(file_path) when is_binary(file_path) do
    resource(
      fn -> File.open!(file_path) end,
      fn file ->
        case IO.read(file, :line) do
          data when is_binary(data) -> {[data], file}
          _ -> {:halt, file}
        end
      end,
      fn file -> File.close(file) end
    )
  end

  @doc """
  Returns every other word in the `e07-sample.txt` file which starts with “D”,
  sorted by length and capitalized
  """
  def exercise3 do
    "e07-sample.txt"
    |> File.stream!([:read, :utf8], :line)
    |> Stream.filter(&String.starts_with?(&1, ["d", "D"]))
    |> Stream.take_every(2)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.capitalize/1)
    |> Enum.sort(&(String.length(&1) <= String.length(&2)))
  end
end
