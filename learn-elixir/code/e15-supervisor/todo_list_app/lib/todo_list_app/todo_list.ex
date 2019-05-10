defmodule TodoListApp.TodoList do
  alias TodoListApp.Todo
  alias TodoListApp.TodoListServer

  def demo() do
    todos = [Todo.new("Bananas"), Todo.new("Milk"), Todo.new("Paper towels"), Todo.new("Do homework")]
    __MODULE__.start(todos)
  end

  @spec start([Todo.t()]) :: pid
  def start(todos \\ []) when is_list(todos) do
    {:ok, todo_list} = GenServer.start(TodoListServer, todos)
    todo_list
  end

  @spec add(pid, Todo.t()) :: :ok
  def add(todo_list, item) when is_pid(todo_list) and is_map(item) do
    GenServer.cast(todo_list, {:add, item})
  end

  @spec remove(pid, Todo.t()) :: :ok
  def remove(todo_list, item) when is_pid(todo_list) and is_map(item) do
    GenServer.cast(todo_list, {:remove, item})
  end

  @spec pop_front(pid) :: :ok
  def complete(todo_list, item) when is_pid(todo_list) and (is_map(item) or is_binary(item)) do
    GenServer.cast(todo_list, {:complete, item})
  end

  @spec pop_front(pid) :: :ok
  def pop_front(todo_list) when is_pid(todo_list) do
    GenServer.cast(todo_list, :pop_front)
  end

  @spec get_items(pid) :: [Todo.t()]
  def get_items(todo_list) when is_pid(todo_list) do
    GenServer.call(todo_list, :get_items)
  end
end
