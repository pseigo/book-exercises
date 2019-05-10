defmodule Todo.Item do
  @enforce_keys [:date_created, :complete, :description]
  defstruct date_created: nil,
            complete: false,
            description: ""
  @type t :: %__MODULE__{date_created: DateTime.t() | nil,
                           complete: boolean,
                           description: String.t()}

  @spec new(String.t()) :: t()
  def new(description) when is_binary(description) do
    %__MODULE__{
      date_created: DateTime.utc_now(),
      complete: false,
      description: description
    }
  end

  @spec complete(t()) :: t()
  def complete(todo) when is_map(todo) do
    %{todo | complete: true}
  end
end
