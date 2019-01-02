defmodule Parallel do
  @moduledoc """
  # Why is this useful?

  A process is created for each element in the list. Delegating tasks to many
  processes at once can make long operations on many elements execute a lot
  faster. More CPU cores == faster execution.

  A time where this is not beneficial is if spawning processes will take longer
  than executing the operations.
  """

  def pmap(collection, fun) when is_function(fun) do
    collection
    |> Enum.map(&spawn_process(&1, self(), fun))
    # |> Enum.map(&await/1)
  end

  defp spawn_process(item, parent, fun) when is_pid(parent) and is_function(fun) do
    spawn_link fn ->
      send parent, {self(), fun.(item)}
    end
  end

  defp await(pid) when is_pid(pid) do
    receive do
      # This pattern match on the pid is necessary to ensure that results are
      # returned in the same order as they were given in the original
      # collection.
      {^pid, result} -> result
    end
  end
end

Parallel.pmap 1..10, &(&1 * &1)
