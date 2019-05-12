defmodule LearnSupervisor.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: StackSupervisor)
  end

  @impl true
  def init(_init_arg) do
    children = [
      LearnSupervisor.Stack,
      {LearnSupervisor.Stack, %{type: :forever}}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def start_child(name) do
    Supervisor.start_child StackSupervisor, build_child_spec(name)
  end

  defp build_child_spec(name) do
    override = [
      id: name,
      start: {LearnSupervisor.Stack, :start_link, [name]}
    ]
    Supervisor.child_spec(LearnSupervisor.Stack, override)
  end

  # def start_link() do
  #   children = [
  #     LearnSupervisor.Stack,
  #     {LearnSupervisor.Stack, %{type: :forever}}
  #   ]

  #   Supervisor.start_link(children, strategy: :one_for_one, name: StackSupervisor)
  # end
end
