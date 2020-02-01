---
title: "Episode 04: Routing"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-19"
titlepage: true
---

# Episode 04: Routing

## Summary

"Routing is a big topic, and we have covered a lot of ground here. The important points to take away from this guide are:

- Routes which begin with an HTTP verb name expand to a single clause of the match function.
- Routes which begin with 'resources' expand to 8 clauses of the match function.
- Resources may restrict the number of match function clauses by using the only: or except: options.
- Any of these routes may be nested.
- Any of these routes may be scoped to a given path.
- Using the as: option in a scope can reduce duplication.
- Using the helper option for scoped routes eliminates unreachable paths."

Source: [Phoenix Guides > Routing](https://hexdocs.pm/phoenix/routing.html)

## Notes

- Routes are evaluated from top to bottom. First one to match the parameters (verb and path) is executed and the search stops.
  - Thus, possible to create routes that will _never match_
- Can view all routes by running `mix phx.routes`
  - First column is the **path helper**

## Resources

Beyond HTTP verbs, the most important `Router` macro is `resources` which expands out to eight `match/5` clauses. You can view all the routes in your Phoenix app by running `mix phx.routes`.

You can also be selective and only generate some clauses with the `:only` option (e.g., for a read-only resource), or `:except` to exclude some.

```elixir
resources "/posts", PostController, only: [:index, :show]
resources "/comments", CommentController, except: [:delete]
```

See [Routing > Resources](https://hexdocs.pm/phoenix/routing.html#resources) for examples.

## Nested Resources

You can also nest resources. For example,

```elixir
resources "/users", UserController do
  resources "/posts", PostController
end
```

In my `Skeleton` project, this adds a set of routes:

```elixir
$ mix phx.routes
     user_path  GET     /users                                 SkeletonWeb.UserController :index
     user_path  GET     /users/:id/edit                        SkeletonWeb.UserController :edit
     user_path  GET     /users/new                             SkeletonWeb.UserController :new
     user_path  GET     /users/:id                             SkeletonWeb.UserController :show
     user_path  POST    /users                                 SkeletonWeb.UserController :create
     user_path  PATCH   /users/:id                             SkeletonWeb.UserController :update
                PUT     /users/:id                             SkeletonWeb.UserController :update
     user_path  DELETE  /users/:id                             SkeletonWeb.UserController :delete
user_post_path  GET     /users/:user_id/posts                  SkeletonWeb.PostController :index
user_post_path  GET     /users/:user_id/posts/:id/edit         SkeletonWeb.PostController :edit
user_post_path  GET     /users/:user_id/posts/new              SkeletonWeb.PostController :new
user_post_path  GET     /users/:user_id/posts/:id              SkeletonWeb.PostController :show
user_post_path  POST    /users/:user_id/posts                  SkeletonWeb.PostController :create
user_post_path  PATCH   /users/:user_id/posts/:id              SkeletonWeb.PostController :update
                PUT     /users/:user_id/posts/:id              SkeletonWeb.PostController :update
user_post_path  DELETE  /users/:user_id/posts/:id              SkeletonWeb.PostController :delete
```

THe `UserController` routes are from `resources "/users", UserController`, and the `PostController` routes are from `resources "/posts", PostController`.

See [Routers > Nested Resources](https://hexdocs.pm/phoenix/routing.html#nested-resources) for a complete explanation of how this works.

## Forward

See the docs.

## Path Helpers

Path helpers, which are dynamically defined in `AppNameWeb.Router.Helpers`, can generate URIs for your routes! You can find the URI for any combination of actions and URL parameters in a route.

In particular, if you have a controller called `PageController`, there will be a function `AppNameWeb.Router.Helpers.page_path` you can use to generate URIs.

**Tip**: This module is aliased as `Routers` by default for `view` and `controller` in `lib/app_name_web.ex`. This means in a template you can write

```elixir
<a href="<%= Routes.page_path(@conn, :index) %>">To the Welcome Page!</a>
```

instead of

```elixir
<a href="<%= AppNameWeb.Router.Helpers.page_path(@conn, :index) %>">To the Welcome Page!</a>
```

Also, "whenever possible prefer to pass a `conn` in place of an `Endpoint`."

See [Routing > Path Helpers](https://hexdocs.pm/phoenix/routing.html#path-helpers) for examples.

## Scoped Routes

When using `scope`, the `as: :prefix` option (e.g., `scope "/admin", as: :admin, do: ...`) adds `:prefix_` in front of each path helper for the routes defined in that scope.

See [Routing > Scoped Routes](https://hexdocs.pm/phoenix/routing.html#scoped-routes) to see why this might be useful, they have a great example there!

## Pipelines

- Pipelines are an ordered collection of plugs in the router that can be applied before handling requests
  - New Phoenix projects define `:browser` and `:api`
- Can apply pipeline to a request using `pipe_through/1`
  - If not defined in a scope, pipeline will be invoked on all routes in the router
  - Nested scopes get pipelines from any parent scopes first
- `pipe_through/1` can take a list of pipelines, e.g., `pipe_through [:browser, :review_checks, :other_great_stuff]`
- Can create new pipelines with `pipeline/2` macro

See [Routing > Pipelines](https://hexdocs.pm/phoenix/routing.html#pipelines) for an explanation of the plugs in the default Phoenix endpoint module (`Plug.Static`, `Phoenix.CodeReloader`, etc.).

## Channel Routes

- Mount socket handlers in endpoint using `socket` macro
  - Phoenix supports websockets and longpoll via `Phoenix.Endpoint.socket/3`
  - Can mount multiple socket handlers
- Define channel routes in socket modules using `channel` macro
  - Matches a topic pattern to a channel to handle events
  - Each socket can handle requests for multiple channels

```elixir
# lib/app_name_web/endpoint.ex
defmodule AppNameWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :app_name

  socket "/socket", AppName.UserSocket,
    websocket: true,
    longpoll: false
  socket "/admin-socket", AppName.AdminSocket
  # ...
end

# lib/app_name_web/channels/user_socket.ex
defmodule AppNameWeb.UserSocket do
  use Phoenix.Socket

  channel "rooms:*", AppNameWeb.RoomChannel
  channel "rooms:*", AppNameWeb.FoodChannel
  # ...
end
```

See [Routing > Channel Routes](https://hexdocs.pm/phoenix/routing.html#channel-routes) for this brief section. They don't go very far in depth, so I think I covered everything here. The place to look for more details would be the [Channel guide](https://hexdocs.pm/phoenix/channels.html).
