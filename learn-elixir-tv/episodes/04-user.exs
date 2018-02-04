defmodule User do
    @moduledoc """
    Defines the user struct and functions to handle users.
    """

    import String, only: [split: 1]
    import List, only: [first: 1, last: 1]

    defstruct name: nil, email: nil

    defp get_names(user) do
        split(user.name)
    end

    @doc """
    Returns the first name of a user.

    ## Parameters

    - `user` - A User struct.

    ## Examples

        user = %User{name: "Peyton Seigo"}
        User.first_name(user)
        "Peyton"
    """
    def first_name(user) do
        user
        |> get_names
        |> first
    end

    @doc """
    Returns the last name of a user.

    ## Parameters

        - `user` - A User struct.

    ## Examples

        user = %User{name: "Peyton Seigo"}
        User.last_name(user)
        "Seigo"
    """
    def last_name(user) do
        user
        |> get_names
        |> last
    end
end
