defmodule Statistics do
  @doc """
  Calculates the weighted mean from a list of values and their weights. Each
  list item is represented as a tuple in the form `{value,  weight}`.

  ## Params

  - `list` - A list of tuples in the form `{value, weight}`
  """
  def weighted_mean(list) when is_list(list) do
    weighted_sum(list)/sum_weights(list)
  end

  defp weighted_sum(list) when is_list(list) do
    Enum.reduce(list, 0, fn({value, weight}, acc) ->
      value * weight + acc
    end)
  end

  defp sum_weights(list) when is_list(list) do
    Enum.reduce(list, 0, fn({_value, weight}, acc) ->
      weight + acc
    end)
  end
end
