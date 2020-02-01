---
title: "Episode 06: Views and Templates"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-19"
titlepage: true
---

## Rendering templates

To-do; see the docs.

## The ErrorView

By default, `config/dev.exs` is set to show a helpful debugging page. If you want to see how the `ErrorView` will handle errors in production, you need to disable `debug_errors`.

```elixir
use Mix.Config

config :skeleton, SkeletonWeb.Endpoint,
  http: [port: 4000],
  debug_errors: false, # <-- set to false
  code_reloader: true,
  check_origin: false,
  watchers: []
```

- Phoenix catches 400 or 500 status level errors and tries to render them. In order, it tries to
  - Check for a matching `render/2` function in `ErrorView` to render an error page
  - Check for an error template in `lib/app_name_web/templates/error`
  - Any errors that can't be matched to `render/2` are caught by `template_not_found/2`

The `render/2` functions are actually called from `Phoenix.Endpoint.RenderErrors.render/5`. The `RenderErrors` module's purpose is to catch errors and render them with a view, in our case the `AppNameWeb.ErrorView`.

### Custom error pages

Phoenix doesn't encourage developers to render error pages with a layout because error pages should have as little logic as possible. The back-end threw some error and if that error came from the main app template (e.g., a database query), then your error pages will be broken as well.

Thus, if you want your error pages to have the same style as your overall website, it's a good idea to isolate your head tags, header bar, footer, and any resource includes into their own templates so that you can include them.

Here's a rough 404 page I came up with using this concept. You can see that I isolated the header tags (`html_head.html`), page header (`header.html`) and footer JavaScript includes (`footer_includes.html`) and rendered them with [`Phoenix.View.render/3`](https://hexdocs.pm/phoenix/Phoenix.View.html#render/3).

```elixir
<!DOCTYPE html>
<html lang="en">
  <head>
    <%= render(SkeletonWeb.PageView, "html_head.html", conn: @conn) %>
  </head>
  <body>
    <%= render(SkeletonWeb.PageView, "header.html", conn: @conn) %>

    <main role="main" class="container">
      <div class="phx-hero">
        <h1>500 error, something broke!</h1>
        <img src="<%= Routes.static_path(@conn, "/images/ufo-cat.svg") %>" style="max-width: 70%;" alt="Space cat being beamed up by a UFO!">
        <p>Well this is embarassing... something went wrong on our end, sorry!</p>
        <a href="">Return home</a>
      </div>
    </main>

    <%= render(SkeletonWeb.PageView, "footer_includes.html", conn: @conn) %>
  </body>
</html>
```

I could probably improve the names I used and how I isolated each part, but this is the general idea.

## Rendering JSON

We can render JSON just like we do HTML.

1. Set up your routes and `pipe_through :api`
2. Set up any controllers you need for the API

The documentation's controller example has actions for `:index` and `:show`:

```elixir
defmodule AppNameWeb.PageController do
  use HelloWeb, :controller

  def show(conn, _params) do
    page = %{title: "foo"}

    render(conn, "show.json", page: page)
  end

  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]

    render(conn, "index.json", pages: pages)
  end
end
```

In the controllers, we just `render conn, "action.json", with_any_options_we_want_for_the_json_response` and we'll make a `render/2` function in a view to match against `action.json`!

3. Create a view for each controller as usual

This is where things are a little different. We have a couple helpers, `render_one/4` and `render_many/4`. They're used like:

```elixir
render_one(params, AppNameWeb.PageView, "page.json")
render_many(params, AppNameWeb.PageView, "page.json")
```

These are used to render either one or many items using `AppNameWeb.PageView.render("page.json", params)`. In your view, `render("page.json", params)` describes how a single item should look in JSON (using Elixir constructs, of course. _Jason_ does the hard work for us), and `render_one` or `render_many` will use this 'template' to generate our JSON response!

For example, your view might look like this:

```elixir
defmodule AppNameWeb.PageView do
  use HelloWeb, :view

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, HelloWeb.PageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloWeb.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end
end
```

See [Views > Rendering JSON](https://hexdocs.pm/phoenix/views.html#rendering-json)
