defmodule Date do
  @moduledoc """
  # Exercises

  1. Read the docs for `Enum` and `Stream`.
  2. Create a `Stream` of all the months in a year.
  3. Write a function that returns every other word in the `sample.txt` file which
     starts with "D", sorted by length and capitalized.
  """

  def months do
    months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "Semptember",
      "October",
      "November",
      "December"
    ]

    Stream.cycle(months)
  end
end

defmodule MyFile do
  # Initial attempt.
  def get(filename) do
    filename
    |> Path.expand()                            # ok, but required?
    |> File.read!()                             # ok, but it's eager
    |> String.split()                           # ok, but treats "data Base" as two different words
    |> Stream.map(&String.capitalize/1)         # ok
    |> Stream.filter(&String.at(&1, 0) == "D")  # ok
    |> Stream.drop_every(2)                     # error: off by one
    |> Enum.sort()                              # error: sort by LENGTH, not by contents
  end

  # Improved solution after looking at discussion and solutions, and reconsidering the problem.
  def get_refactored(filename) do
    filename
    |> File.stream!()                   # Lazy rather than eager.
    |> Stream.reject(&(&1 == "n"))      # Remove "\n" elements.
    # |> Stream.take_every(2)             # Alternative to the line above; faster, but not flexible.
    |> Stream.map(&String.capitalize/1) # So "d" and "D" are treated the same for the filter.
    |> Stream.filter(&String.starts_with?(&1, "D"))
    |> Stream.take_every(2)             # Take every 2nd element starting with "D".
    |> Stream.map(&String.trim/1)       # Trim '\n' from each element.
    |> Enum.sort()                      # Sorted alphabetically. Causes stream to execute.
    |> Enum.sort_by(&String.length/1)   # Sorted by length.
  end
end


IO.puts "Exercise 2:"

Date.months
|> Enum.take(15)
|> Enum.each(&IO.puts(&1))

IO.puts "\nExercise 3: "

"07-sample.txt"
|> MyFile.get_refactored()
|> IO.inspect
