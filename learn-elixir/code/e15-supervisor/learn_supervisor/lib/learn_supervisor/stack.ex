defmodule LearnSupervisor.Stack do
  @moduledoc """
  Represents a stack data structure.
  """
  use GenServer

  def child_spec(%{type: :forever}) do
    name = Module.concat(__MODULE__, :Permanent)
    %{
      id: name,
      start: {__MODULE__, :start_link, [name]},
      restart: :permanent,
      shutdown: 5000,
      type: :worker
    }
  end

  def child_spec(_args) do
    name = Module.concat(__MODULE__, :Temporary)
    %{
      id: name,
      start: {__MODULE__, :start_link, [name]},
      restart: :temporary,
      shutdown: 5000,
      type: :worker
    }
  end

  def start_link(name) do
    state = []
    GenServer.start_link(__MODULE__, state, name: name)
  end

  def push(name, element) do
    GenServer.cast(name, {:push, element})
  end

  def pop(name) do
    GenServer.call(name, :pop)
  end

  def get(name) do
    GenServer.call(name, :get)
  end

  ## Callbacks
  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_cast({:push, head}, tail) do
    {:noreply, [head | tail]}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:get, _from, list) do
    {:reply, list, list}
  end
end
