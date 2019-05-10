defmodule LearnSupervisor.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: StackSupervisor)
  end

  def init(_children, _options) do
    children = [
      LearnSupervisor.Stack
    ]

    supervise(children, strategy: :one_for_one)
  end

end
