defmodule ComponentBTest do
  use ExUnit.Case
  doctest ComponentB

  test "greets the world" do
    assert ComponentB.hello() == :world
  end
end
