defmodule Parallel do
  @moduledoc """
  Demo from episode 13.

  ## My Interpretation/Explanation

  First, `pmap/2` will immediately call `spawn_process/3` on every element in
  the list. These processes will begin doing their job and may not finish until
  long after each process has started. That is, you might have 10 processes
  doing some long, tediuous calculation for 10 minutes, way after
  `spawn_process/3` was called on each element.

  With small sample sizes, the outcome appears no different than just
  mapping sequentially. However, we are actually doing lots of small
  computations concurrently.
  """

  def pmap(collection, fun) when is_function(fun) do
    collection
    |> Enum.map(&spawn_process(&1, self(), fun))
    |> Enum.map(&await/1)
  end

  # Called on each element right away; perhaps before all the work is done!
  defp spawn_process(element, parent, fun) when is_pid(parent) and is_function(fun) do
    spawn_link fn ->
      send parent, {self(), fun.(element)}
    end
  end

  # Enum.map calls this in the correct order of the list, so messages are
  # matched in the correct order
  defp await(pid) when is_pid(pid) do
    receive do
      {^pid, result} -> result
    end
  end
end
