defmodule LearnSupervisorTest do
  use ExUnit.Case
  doctest LearnSupervisor

  test "greets the world" do
    assert LearnSupervisor.hello() == :world
  end
end
