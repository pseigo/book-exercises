defmodule CalculusTest do
  use ExUnit.Case
  doctest Calculus

  test "greets the world" do
    assert Calculus.hello() == :world
  end
end
