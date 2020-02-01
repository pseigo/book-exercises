defmodule Todo.List do
  use GenServer

  alias Todo.Item

  @typep todo_list :: pid
  @typep state :: %{name: term, items: [Item.t]}

  # Child spec for running in a supervision tree
  def child_spec(name) do
    name = Module.concat(__MODULE__, name)
    %{
      id: name,
      start: {__MODULE__, :start_link, [name]},
      restart: :transient,
      shutdown: 5000,
      type: :worker
    }
  end
  
  # Public API
  @spec items(todo_list) :: list[Item.t]
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

  ###
  # GenServer API
  ###

  # GenServer client code
  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  # GenServer server code
  @impl true
  def init(name) do
    state = %{name: name, items: []}
    {:ok, state}
  end

  @spec handle_call(:get, GenSever.from, state) :: {:reply, [Item.t], state}
  @impl true
  def handle_call(:get, _from, state) do
    {
      :reply,
      state.items,
      state
    }
  end

  @spec handle_cast({:add, Item.t}, state) :: {:noreply, state}
  @impl true
  def handle_cast({:add, %Item{} = item}, state) do
    {
      :noreply,
      %{state | items: [item | state.items]}
    }
  end

  @spec handle_cast({:remove, Item.t}, state) :: {:noreply, state}
  @impl true
  def handle_cast({:remove, %Item{} = item}, state) do
    {
      :noreply,
      %{state | items: List.delete(state.list, item)}
    }
  end

  @spec handle_cast({:update, Item.t}, state) :: {:noreply, state}
  @impl true
  def handle_cast({:update, %Item{} = item}, state) do
    state.items
    |> Enum.find_index(&(&1.id == item.id))
    |> do_update(item, state)
  end

  defp do_update(nil, item, state) do
    handle_cast({:add, item}, state) 
  end

  defp do_update(index, item, state) do
    updated_items = List.replace_at(state.items, index, item)
    {
      :noreply,
      %{state | items: updated_items} 
    }
  end
end
