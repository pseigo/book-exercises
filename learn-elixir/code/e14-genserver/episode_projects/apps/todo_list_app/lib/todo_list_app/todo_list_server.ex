defmodule TodoListApp.TodoListServer do
  alias TodoListApp.Todo

  def init(todos) do
    {:ok, todos}
  end

  @spec handle_cast({:add, Todo.t()}, [Todo.t()]) :: {:noreply, [Todo.t()]}
  def handle_cast({:add, item}, todos) when is_map(item) and is_list(todos) do
    {:noreply, [item | todos]}
  end

  @spec handle_cast({:remove, Todo.t()}, [Todo.t()]) :: {:noreply, [Todo.t()]}
  def handle_cast({:remove, item}, todos) when is_map(item) and is_list(todos) do
    {:noreply, List.delete(todos, item)}
  end

  @spec handle_cast({:complete, Todo.t() | String.t()}, [Todo.t()]) :: {:noreply, [Todo.t()]}
  def handle_cast({:complete, item}, todos) when (is_map(item) or is_binary(item)) and is_list(todos) do
    todos =
      case find_item(todos, item) do
        {:ok, item, index} ->
          todos = List.delete_at(todos, index)
          [Todo.complete(item) | todos]
        _other ->
          todos
      end

    {:noreply, todos}
  end

  @spec handle_cast(:pop_front, [Todo.t()]) :: {:noreply, [Todo.t()]}
  def handle_cast(:pop_front, todos) when is_list(todos) do
    {_, rest} = List.pop_at(todos, 0)
    {:noreply, rest}
  end

  @spec handle_call(:get_items, GenServer.from(), [Todo.t()]) :: {:reply, [Todo.t()]}
  def handle_call(:get_items, _from, todos) when is_list(todos) do
    {:reply, todos, todos}
  end

  defp find_item(todos, item) when is_list(todos) and is_map(item) do
    do_find_item(todos, item, 0)
  end

  defp find_item(todos, desc) when is_list(todos) and is_binary(desc) do
    do_find_item_by_desc(todos, desc, 0)
  end

  defp do_find_item([], _, _), do: nil

  defp do_find_item([first | _], item, index) when first == item do
    {:ok, first, index}
  end

  defp do_find_item([_ | rest], item, index) do
    do_find_item(rest, item, index + 1)
  end

  defp do_find_item_by_desc([], _, _), do: nil

  defp do_find_item_by_desc([first | rest], desc, index) do
    if first.description == desc do
      {:ok, first, index}
    else
      do_find_item_by_desc(rest, desc, index + 1)
    end
  end

end
