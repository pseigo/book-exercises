defmodule TodoListAppTest do
  use ExUnit.Case
  doctest TodoListApp

  test "greets the world" do
    assert TodoListApp.hello() == :world
  end
end
