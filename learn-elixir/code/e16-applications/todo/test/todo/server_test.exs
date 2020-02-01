defmodule Todo.ServerTest do
  use ExUnit.Case

  alias Todo.Server

  test ".add_list adds a new supervised todo list" do
    Server.add_list("Home")
    Server.add_list("Work")

    counts = Supervisor.count_children(Server)
    assert counts.active == 2
  end
end
