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
  def blank?(nil),  do: true
  def blank?(false),  do: true
  def blank?(""),   do: true
  def blank?(_other), do: false

  # using guards and pattern matching together
  def blank?(value) when value in [nil, false, ""], do: true
  def blank?(_other), do: false

  # best real world way for this situation: only uses `in` operator.
  # doesn't use guards or pattern matching.
  def blank?(value), do: value in [nil, false, ""]

  # "Static typing" .. sort of
  @doc """
    Argument must be a `User` struct. If it is, `user` will be bound to the passed
  in struct.
  """
  def name(%User{} = user) do
    user.first_name <> " " <> user.last_name
  end

  @doc """
    Argument must be an `Episode` struct. If it is, `name` will be bound to the
  `:name` attribute's value. `name` must also be a binary, otherwise the guard
  will fail.
  """
  def name(%Episode{name: name}) when is_binary(name) do
    name
  end

  def name(unsupported) do
    raise "name? does not support #{inspect unsupported}"
  end


end
