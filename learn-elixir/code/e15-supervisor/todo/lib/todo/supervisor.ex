defmodule Todo.Supervisor do
  @moduledoc """
  Supervises an arbitrary number of todo lists.

  ## Creating a todo list

  Calling `start_link/1` creates a todo list child with the id `Todo.List`. You
  can create additional todo lists using `start_child/1`. The `GenServer`
  documentation specifies formats for the `name` argument. In particular, see
  the "Name registration" section and the type `GenServer.name()`.

  You can get information on the supervisor's children using

  - `Supervisor.which_children(supervisor())` - Returns a list containg each child's id, pid, type and module
  - `Supervisor.count_children(supervisor())` - Shows the number of children

  The supervisor pid is returned from `start_link/1` in the form `{:ok, pid}`.

  ## Sending commands

  The `Todo.List` module defines the available commands. The general format is

      Todo.List.operation(ChildId, args)

  ## Demo

      iex> {:ok, pid} = Todo.Supervisor.start_link
      {:ok, #PID<0.181.0>}

      iex> Todo.Supervisor.start_child Todo.List.Groceries
      iex> Todo.Supervisor.start_child Todo.List.Games
      iex> Supervisor.which_children pid
      [
        {Todo.List.Games, #PID<0.187.0>, :worker, [Todo.List]},
        {Todo.List.Groceries, #PID<0.185.0>, :worker, [Todo.List]},
        {Todo.List, #PID<0.182.0>, :worker, [Todo.List]}
      ]

      iex> Supervisor.count_children pid
      %{active: 3, specs: 3, supervisors: 0, workers: 3}

      iex> Todo.List.add Todo.List.Groceries, Todo.Item.new("Milk")
      iex> Todo.List.add Todo.List.Groceries, Todo.Item.new("Bananas")
      iex> Todo.List.add Todo.List.Groceries, Todo.Item.new("Oatmeal")
      iex> Todo.List.add Todo.List.Games, Todo.Item.new("The Witcher 3")
      iex> Todo.List.add Todo.List.Games, Todo.Item.new("Elder Scrolls IV: Oblivion")

      iex> Todo.List.get_items Todo.List.Groceries
      [
        %Todo.Item{
          complete: false,
          date_created: #DateTime<2019-05-12 03:55:15.596694Z>,
          description: "Oatmeal"
        },
        %Todo.Item{
          complete: false,
          date_created: #DateTime<2019-05-12 03:55:11.326741Z>,
          description: "Bananas"
        },
        %Todo.Item{
          complete: false,
          date_created: #DateTime<2019-05-12 03:55:07.801527Z>,
          description: "Milk"
        }
      ]

      iex> Todo.List.get_items Todo.List.Games
      [
        %Todo.Item{
          complete: false,
          date_created: #DateTime<2019-05-12 03:55:44.197447Z>,
          description: "Elder Scrolls IV: Oblivion"
        },
        %Todo.Item{
          complete: false,
          date_created: #DateTime<2019-05-12 03:55:30.795547Z>,
          description: "The Witcher 3"
        }
      ]
  """

  use Supervisor

  def start_link(init_arg \\ []) do
    Supervisor.start_link(__MODULE__, init_arg, name: TodoSupervisor)
  end

  # TODO: idk what init_arg is used for
  @impl true
  def init(_init_arg) do
    children = [
      Todo.List
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def start_child(name) do
    Supervisor.start_child TodoSupervisor, build_child_spec(name)
  end

  defp build_child_spec(name) do
    override = [
      id: name,
      start: {Todo.List, :start_link, [name]}
    ]
    Supervisor.child_spec(Todo.List, override)
  end
end
