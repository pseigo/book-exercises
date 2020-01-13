defmodule Todo.Server do
  use GenServer

  alias Todo.Item

  @typep state :: %{name: term, items: [Item.t]}

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

  @impl true
  def handle_cast({:update, %Item{} = item}, state) do
    state.items
    |> Enum.find_index(fn (element) -> element.id == item.id end)
    |> do_update(item, state)
  end

  defp do_update(nil, item, state), do: handle_cast({:add, item}, state) # TODO: default behaviour if not found? add, ignore, or throw error??
  defp do_update(index, item, state) do
    updated_items = List.update_at(state.items, index, fn (_) -> item end)
    {
      :noreply,
      %{state | items: updated_items} 
    }
  end
end
