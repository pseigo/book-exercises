defmodule Todo.Server do
  use DynamicSupervisor

  alias Todo.List

  # Child spec for running in a supervision tree
  def child_spec(_args) do
    name = __MODULE__
    %{
      id: name,
      start: {__MODULE__, :start_link, [name]},
      restart: :temporary,
      shutdown: 5000,
      type: :supervisor
    }
  end

  def add_list(name) do
    DynamicSupervisor.start_child(__MODULE__, List.child_spec(name))
  end

  def start_link(init_arg) do
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
