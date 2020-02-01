defmodule FirstAppWeb.PageController do
  use FirstAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
