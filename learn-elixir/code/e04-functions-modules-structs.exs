defmodule User do
  @moduledoc """
  Defines the `User` struct and functions to handle users.
  """

  import String, only: [split: 1]
  import List, only: [first: 1, last: 1]

  defstruct name: nil, email: nil

  @doc """
  Returns first name of given `user`.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Donald Knuth"}
      User.first_name(user)
      "Donald"
  """
  def first_name(user) when is_map(user) do
    user
    |> get_names()
    |> first()
  end

  @doc """
  Returns last name of given `user`.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Donald Knuth"}
      User.last_name(user)
      "Knuth"
  """
  def last_name(user) when is_map(user) do
    user
    |> get_names()
    |> last()
  end

  defp get_names(user) when is_map(user) do
    cond do
      is_binary(user.name) -> split(user.name)
      true -> []
    end
  end
end
