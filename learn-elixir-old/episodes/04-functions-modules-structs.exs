defmodule Math do
  @doc """
  # Anonymous functions

  Anonymous because they derive their name from the variable they are bound to.
  """
  def anonymous_functions do
    # Defining an anonymous function
    add = fn(a, b) ->
      a + b
    end

    # Calling an anonymous function
    add.(1, 2) # -> 3

    # Creating a synonym for the function
    hello = add
    hello.(1, 2) # -> 3
  end


  @doc """
  # Named functions

  - Have a permanent name
  - Don't have to be bound to variables
  - Can only be defined in modules

  """
  def add(a, b) do
    a + b
  end
end

# Calling a named function from outside a module
# [module].[function_name]([args])
Math.add(1, 2) # -> 3

# Nested modules: both are equivalent
defmodule Math do
  defmodule Division do
    # ...
  end
end

defmodule Math.Division do
  # ...
end
