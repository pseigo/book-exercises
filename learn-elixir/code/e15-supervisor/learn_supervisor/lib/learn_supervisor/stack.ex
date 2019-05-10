defmodule LearnSupervisor.Stack do
  @moduledoc """
  Represents a stack data structure.
  """
  use GenServer

  def child_spec(_args) do
    %{
      id: __MODULE__, # required
      start: {__MODULE__, :start_link, []}, # required
      restart: :temporary,
      shutdown: 5000,
      type: :worker
    }
  end

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def push(element) do
    GenServer.cast(__MODULE__, {:push, element})
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end

  def get() do
    GenServer.call(__MODULE__, :get)
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
