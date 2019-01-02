defmodule Search.Analyzer do
  @moduledoc """
  Contains functions for analyzing and performing computations on search data.
  """

  @score_max_history Application.get_env(:search, __MODULE__)[:score_max_history]

  @doc """
  Calculates the overall score for a history of searches according to the _Seigo Series_.

  ## Parameters

  - `searches` - A list of searches for each day, where the first element is today.
  """
  def score(searches) when is_list(searches) do
    do_score(searches, 0, 0)
  end

  defp do_score([], _index, acc) do
    acc
  end

  # Limits calculations to a configured number of days.
  defp do_score(_, index, acc) when index == @score_max_history do
    acc
  end

  defp do_score([term | tail], index, acc) do
    index_score = term / (:math.sqrt(index + 1))

    do_score(tail, index + 1, acc + index_score)
  end

  @doc """
  Returns a sorted list of terms and their scores.

  ## Parameters

  - `data` - A list containing tuples in the form `{"term", search_history_list}`
  """
  def sort_related_terms(data) when is_list(data) do
    data = Enum.map data, fn({term, searches}) ->
             {term, score(searches)}
           end

    Enum.sort data, fn({_term1, score1}, {_term2, score2}) ->
      score2 <= score1
    end
  end
end
