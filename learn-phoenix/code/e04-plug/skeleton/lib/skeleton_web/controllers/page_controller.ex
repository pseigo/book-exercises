defmodule SkeletonWeb.PageController do
  use SkeletonWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Info")
    |> put_flash(:warning, "Warning")
    |> put_flash(:error, "Error")
    # |> put_layout("admin.html")
    |> render("index.html")
  end
end
