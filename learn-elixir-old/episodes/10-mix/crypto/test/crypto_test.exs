defmodule CryptoTest do
  use ExUnit.Case
  doctest Crypto

  test "greets the world" do
    assert Crypto.hello() == :world
  end
end
