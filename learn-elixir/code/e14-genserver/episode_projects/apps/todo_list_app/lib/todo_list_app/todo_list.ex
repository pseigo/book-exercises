defmodule TodoListApp.TodoList do
  alias TodoListApp.Todo
  alias TodoListApp.TodoListServer

  def demo() do
    todos = [Todo.new("Bananas"), Todo.new("Milk"), Todo.new("Paper towels"), Todo.new("Do homework")]
    __MODULE__.start(todos)
  end

  @spec start([Todo.t()]) :: pid
  def start(todos \\ []) when is_list(todos) do
    {:ok, pid} = GenServer.start(TodoListServer, todos)
    pid
  end

  @spec add(pid, Todo.t()) :: :ok
  def add(pid, item) when is_pid(pid) and is_map(item) do
    GenServer.cast(pid, {:add, item})
  end

  @spec remove(pid, Todo.t()) :: :ok
  def remove(pid, item) when is_pid(pid) and is_map(item) do
    GenServer.cast(pid, {:remove, item})
  end

  @doc """
  Finds the first item in the todo list to match given `item`, sets its
  `complete` flag to true, and brings the item to the front of the list.

  `item` can either be a `Todo` struct equal to some item in the list or `item`
  can be a binary string equal to the description of some item in the list. If
  a matching item is not found, the list is not modified.
  """
  @spec complete(pid, Todo.t()) :: :ok
  def complete(pid, item) when is_pid(pid) and (is_map(item) or is_binary(item)) do
    GenServer.cast(pid, {:complete, item})
  end

  @spec pop_front(pid) :: :ok
  def pop_front(pid) when is_pid(pid) do
    GenServer.cast(pid, :pop_front)
  end

  @spec get_items(pid) :: [Todo.t()]
  def get_items(pid) when is_pid(pid) do
    GenServer.call(pid, :get_items)
  end

  @spec get(pid, non_neg_integer) :: Todo.t() | nil
  def get(pid, index) when is_pid(pid) and is_number(index) and index >= 0 do
    pid
    |> __MODULE__.get_items()
    |> Enum.at(index)
  end
end
