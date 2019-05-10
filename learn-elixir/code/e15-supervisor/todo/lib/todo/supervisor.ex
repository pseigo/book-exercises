defmodule Todo.Supervisor do
  @moduledoc """
  Supervises todo lists.
  """

  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [])
  end

  @impl true
  def init([]) do
    children = [
      worker(ProcessA, [args]),
      worker(ProcessB, [args])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
