defmodule SkeletonWeb.Router do
  use SkeletonWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SkeletonWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/users", UserController do
      resources "/posts", PostController
    end
  end

  scope "/admin", SkeletonWeb.Admin do
    pipe_through :browser

    resources "/reviews", ReviewController
  end

  # Other scopes may use custom stacks.
  scope "/api", SkeletonWeb.Api do
    pipe_through :api

    get "/courses", CourseController, :index
    get "/courses/:name/:code", CourseController, :show
  end
end
