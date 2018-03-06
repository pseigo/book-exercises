defmodule User do
  @moduledoc """
  Defines the User struct and functions to handle users.
  """

  import List, only: [first: 1, last:  1]
  import String, only: [split: 1]

  defstruct name: nil, email: nil

  defp get_names(user) do
    split(user.name)
  end

  @doc """
  Get the first name of a user.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Linus Torvalds"}
      User.first_name(user)
      "Linus"
  """
  def first_name(%User{} = user) do
    user
    |> get_names
    |> first()
  end

  @doc """
  Get the last name of a user.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Linus Torvalds"}
      User.first_name(user)
      "Torvalds"
  """
  def last_name(%User{} = user) do
    user
    |> get_names
    |> last()
  end
end
