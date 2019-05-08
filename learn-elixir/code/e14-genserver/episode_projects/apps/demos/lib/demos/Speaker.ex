defmodule Speaker do
  @moduledoc """
  For the home-made `GenServer` demo. Used in conjunction with `Demos.Server`.
  """

  @spec handle_message(tuple, pid, keyword) :: map
  def handle_message({:say, message}, parent, state) when is_pid(parent) and is_map(state) do
    IO.puts message
    send parent, :ok
    state
  end

  @spec handle_message(tuple, pid, keyword) :: map
  def handle_message({:setname, name}, parent, state) when is_binary(name) and is_pid(parent) and is_map(state) do
      Map.put(state, :name, name)
  end

  @spec handle_message(tuple, pid, keyword) :: map
  def handle_message(:name, parent, state) when is_pid(parent) and is_map(state) do
      case Map.get(state, :name) do
        name when is_binary(name) ->
          IO.puts "Your name is " <> state.name
        _other ->
          IO.puts "No name set! Set with the message {:setname, <name>}"
      end
      state
  end

  @spec handle_message(tuple, pid, keyword) :: map
  def handle_message(_other, _parent, state) do
    state
  end
end
