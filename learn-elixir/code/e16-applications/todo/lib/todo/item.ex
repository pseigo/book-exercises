defmodule Todo.Item do
  @moduledoc """
  A todo list item.
  """

  defstruct id: nil,
            description: nil,
            complete: false

  @type t :: %__MODULE__{
    id: non_neg_integer(),
    description: binary(),
    complete: boolean()
  }

  @spec new(binary) :: t
  def new(description) when is_binary(description) do
    %__MODULE__{
      id: :random.uniform(1_000_000_000),
      description: description
    }
  end

  @spec complete(t) :: t
  def complete(%__MODULE__{} = item) do
    %{item | complete: true}
  end 
end
