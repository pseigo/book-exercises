defmodule MixDemoTest do
  use ExUnit.Case
  doctest MixDemo

  test "greets the world" do
    assert MixDemo.hello() == :world
  end
end
