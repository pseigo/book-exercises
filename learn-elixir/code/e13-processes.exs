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

  Daniel Berkompas notes that the benefits
  """

  def pmap(collection, fun) when is_function(fun) do
    collection
    |> Enum.map(&spawn_process(&1, self(), fun))
    |> Enum.map(&await/1)
  end

  defp spawn_process(element, parent, fun) when is_pid(parent) and is_function(fun) do
    spawn_link fn ->
      # IO.write to_string(element) <> " "
      send parent, {self(), fun.(element)}
    end
  end

  defp await(pid) when is_pid(pid) do
    receive do
      {^pid, result} -> result
    end
  end

  # def pmap(collection, fun) when is_function(fun) do
  #   collection
  #   |> Enum.map(&spawn_process(&1, self(), fun))
  #   |> Enum.map(&await/1)
  # end

  # defp spawn_process(element, parent, fun) when is_pid(parent) and is_function(fun) do
  #   spawn_link fn ->
  #     sleep_time = :rand.uniform(round(5000 * :math.sqrt(element)))
  #     :timer.sleep(sleep_time)
  #     send parent, {self(), fun.(element), sleep_time}
  #   end
  # end

  # defp await(pid) when is_pid(pid) do
  #   IO.puts "\nCalled await/1 on pid: " <> Kernel.inspect(pid)
  #   receive do
  #     {^pid, result, sleep_time} ->
  #       IO.puts "Received result: " <> Kernel.inspect(result) <> " from pid: " <> Kernel.inspect(pid)
  #       IO.puts "Computed in " <> to_string(sleep_time / 1000) <> " seconds"
  #       result
  #   end
  # end
end
