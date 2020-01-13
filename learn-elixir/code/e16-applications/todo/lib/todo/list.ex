defmodule Todo.List do
  alias Todo.Item

  @typep todo_list :: pid

  # Child spec for running in a supervision tree
  def child_spec(_args) do
    name = __MODULE__
    %{
      id: name,
      start: {__MODULE__, :start_link, [name]},
      restart: :temporary,
      shutdown: 5000
    }
  end

  # GenServer client code
  def start_link(name) do
    GenServer.start_link(Todo.Server, name)
  end

  def items(list) when is_pid(list) do
    GenServer.call(list, :get)
  end

  @spec add(todo_list, Item.t) :: GenServer.term
  def add(list, %Item{} = item) when is_pid(list) do
    GenServer.cast(list, {:add, item})
  end

  @spec remove(todo_list, Item.t) :: GenServer.term
  def remove(list, %Item{} = item) when is_pid(list) do
    GenServer.cast(list, {:remove, item}) 
  end

  @spec update(todo_list, Item.t) :: GenServer.term
  def update(list, %Item{} = item) when is_pid(list) do
    GenServer.cast(list, {:update, item})
  end
end
