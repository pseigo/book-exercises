defmodule Search.Printer do
  @moduledoc """
  Contains functions for displaying information to the user.
  """

  @doc """
  Prints a search term and its related search terms.

  ## Parameters

  - `term` - The term name as a `string`.
  - `data` - Related terms as a list, where each term is `{"term", search_history_list}`
  """
  def print_search_terms(term, data) when is_binary(term) and is_list(data) do
    IO.puts(term)

    # Without messing with extra characters, using `\t` misaligns everything due
    # to different lengths of terms. This is not an ideal solution, but it works.
    Enum.each data, fn({term, score}) ->
      IO.puts "#{term}      \t(score: #{score})"
    end
  end
end
