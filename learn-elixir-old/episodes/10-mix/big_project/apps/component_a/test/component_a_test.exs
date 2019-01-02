defmodule ComponentATest do
  use ExUnit.Case
  doctest ComponentA

  test "greets the world" do
    assert ComponentA.hello() == :world
  end
end
