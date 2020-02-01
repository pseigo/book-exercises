defmodule SkeletonWeb.Api.CourseController do
  use SkeletonWeb, :controller

  def index(conn, _params) do
    # pull courses from database
    courses = [
      %{name: "CPSC", code: "221", year: 2019, session: "W1"},
      %{name: "CPSC", code: "213", year: 2019, session: "W1"},
      %{name: "MATH", code: "200", year: 2019, session: "W1"},
      %{name: "MATH", code: "221", year: 2019, session: "W1"}
    ]
    render(conn, "index.json", courses: courses) 
  end
  
  def show(conn, %{"name" => name, "code" => code}) do
    # pull course from database
    course = %{name: name, code: code, year: 2020, session: "W1"}
    render(conn, "show.json", course: course) 
  end
end
