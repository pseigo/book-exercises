defmodule SkeletonWeb.HelloController do
  use SkeletonWeb, :controller 

  # This is a plug! You can tell by the arguments
  def index(conn, _params) do
    # tells Phoenix to find a template in `templates/hello` called `index.html.eex` and render it
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end
end
