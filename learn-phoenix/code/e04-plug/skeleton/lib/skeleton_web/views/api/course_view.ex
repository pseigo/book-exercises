defmodule SkeletonWeb.Api.CourseView do
  use SkeletonWeb, :view

  def render("index.json", %{courses: courses}) do
    %{data: render_many(courses, SkeletonWeb.Api.CourseView, "page.json")}
  end

  def render("show.json", %{course: course}) do
    %{data: render_one(course, SkeletonWeb.Api.CourseView, "page.json")}
  end

  def render("page.json", %{course: course}) do
    %{
      name: course.name,
      code: course.code,
      year: course.year,
      session: course.session 
    }
  end
end
