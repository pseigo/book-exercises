defmodule SkeletonWeb.UserController do
  use SkeletonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def profile(conn, %{"username" => username}) do
    render(conn, "profile.html", username: username)
  end
end
