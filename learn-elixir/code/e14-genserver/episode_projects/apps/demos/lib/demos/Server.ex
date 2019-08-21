defmodule Server do
  @moduledoc """
  For the homemade `GenServer` demo. Used in conjunction with `Demos.Speaker`.
  """

  @spec start(module, any) :: none
  def start(callback_module, state \\ Map.new()) do
    spawn fn ->
      loop(callback_module, self(), state)
    end
  end

  @spec loop(module, pid, any) :: none
  defp loop(callback_module, parent, state) do
    receive do
      message ->
        state = callback_module.handle_message(message, parent, state)
        loop(callback_module, parent, state)
    end
  end
end
