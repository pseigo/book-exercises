defmodule Todo.List do
  alias Todo.Item

  @type t :: [Todo.Item.t()]

  @spec demo() :: pid()
  def demo() do
    todos = [
      Item.new("Bananas"),
      Item.new("Milk"),
      Item.new("Paper towels"),
      Item.new("Do homework")
    ]
    __MODULE__.start(todos)
  end

  @spec start(Todo.List.t()) :: GenServer.server()
  def start(todos \\ []) when is_list(todos) do
    {:ok, todo_list} = GenServer.start(Todo.Server, todos)
    todo_list
  end

  @spec add(pid(), Item.t()) :: :ok
  def add(todo_list, %Item{} = item) when is_pid(todo_list) do
    GenServer.cast(todo_list, {:add, item})
  end

  @spec remove(pid(), Item.t()) :: :ok
  def remove(todo_list, %Item{} = item) when is_pid(todo_list) and is_map(item) do
    GenServer.cast(todo_list, {:remove, item})
  end

  @spec complete(pid(), Item.t() | binary()) :: :ok
  def complete(todo_list, item) when is_pid(todo_list) and (is_map(item) or is_binary(item)) do
    GenServer.cast(todo_list, {:complete, item})
  end

  @spec pop_front(pid()) :: :ok
  def pop_front(todo_list) when is_pid(todo_list) do
    GenServer.cast(todo_list, :pop_front)
  end

  @spec get_items(pid()) :: Todo.List.t()
  def get_items(todo_list) when is_pid(todo_list) do
    GenServer.call(todo_list, :get_items)
  end
end
