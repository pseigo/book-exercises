defmodule LearnSupervisor.Supervisor do
  use Supervisor

  @moduledoc """
  # Init
  
  Calls `Supervisor.init/3` with a list of child processes.

  For the children, using `{:ModuleName, args}` for each module automatically
  calls `:ModuleName.child_spec(args)` to get the child specification. This
  allows modules to **define their own** child spec rather than making the
  supervisor define it. This is useful for

  - Separating concerns about how a module should be supervised
  - Being able to see how a module should be used without navigating to its supervisor
  - Reducing bugs/typos in Supervisors

  ## Example
  
  Here's an example of how the Supervisor module might define `children`
  if the module has no `child_spec/1`.

  ```elixir
  # in MySupervisor.init
  children = %{
    id: Stack,
    start: {Stack, :start_link, [[:hello]]}
  }
  ```

  And here's an example where we use the module's `child_spec/1` config.

  ```elixir
  # in MySupervisor.init
  children = [
    Stack             # No args
    {Stack, [:hello]} # Passing [:hello] as the args
  ]

  # in Stack
  def child_spec(arg) do
    %{
      id: Stack,
      start: {Stack, :start_link, [arg]}
    }
  end
  ```

  [Source for examples](https://devdocs.io/elixir~1.9/supervisor)
  """

  @doc """
  Starts a module-based supervisor for `Stack`.
  """
  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: StackSupervisor)
  end

  @doc """
  Configures the supervisor. Configures three children respectively:

  1. Has no args
  2. Has `%{type: :forever}` as arg
  3. Has `init_arg` as arg which is retrieved from `start_link/1`?
  """
  @impl true
  def init(init_arg) do
    children = [
      LearnSupervisor.Stack,
      {LearnSupervisor.Stack, %{type: :forever}}
      {LearnSupervisor.Stack, init_arg}
    ]
    opts = [strategy: :one_for_one]
    Supervisor.init(children, opts)
  end
end
