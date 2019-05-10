defmodule TodoListApp.Todo do
  defstruct date_created: nil,
            complete: false,
            description: ""
  @opaque t :: %__MODULE__{date_created: DateTime.t(),
                           complete: boolean,
                           description: String.t()}

  @spec new(String.t()) :: Todo.t()
  def new(description) when is_binary(description) do
    %__MODULE__{
      date_created: DateTime.utc_now(),
      complete: false,
      description: description
    }
  end

  @spec complete(Todo.t()) :: Todo.t()
  def complete(todo) when is_map(todo) do
    %{todo | complete: true}
  end
end
