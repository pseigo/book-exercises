defmodule Todo.List do
  @moduledoc """
  An interface for manipulating todo lists.

  This module provides an interface for common todo list operations such as
  adding and removing `Todo.Item` elements and retrieving elements.
  """

  alias Todo.Item

  @type t :: [Todo.Item.t()]

  def child_spec(state) when is_list(state) do
    name = __MODULE__
    %{
      id: name,
      start: {__MODULE__, :start_link, [name, state]},
      restart: :permanent
    }
  end

  def start_link(name, state \\ []) do
    GenServer.start(Todo.Server, state, name: name)
  end

  @spec add(GenServer.server(), Item.t()) :: :ok
  def add(server, %Item{} = item)do
    GenServer.cast(server, {:add, item})
  end

  @spec remove(GenServer.server(), Item.t()) :: :ok
  def remove(server, %Item{} = item) when is_map(item) do
    GenServer.cast(server, {:remove, item})
  end

  @spec complete(GenServer.server(), Item.t() | binary()) :: :ok
  def complete(server, item) when is_map(item) or is_binary(item) do
    GenServer.cast(server, {:complete, item})
  end

  @spec pop_front(GenServer.server()) :: :ok
  def pop_front(server) do
    GenServer.cast(server, :pop_front)
  end

  @spec get_items(GenServer.server()) :: Todo.List.t()
  def get_items(server) do
    GenServer.call(server, :get_items)
  end
end
