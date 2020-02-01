---
title: "Phoenix Overview"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-18"
titlepage: true
---

# Phoenix Overview

## Summary

- x

## Terminology

Main words/topics

- **Endpoints**
  - Handles all aspects of requests
  - Applies core set of plugs to all requests, then calls some router
- **Routers**
  - "Routes map unique HTTP verb/path pairs to controller/action pairs which will handle them"
  - Any params passed by routers to controllers always have string-valued keys
  -     (e.g. the route `/users/:userid` passes `params = %{"userid" => ...}`)
- **Controllers**
  - Has functions called actions
- **Views**
  - Renders templates
  - Acts as a presentation layer for raw data from the controller, preparing it for use in a template
  - _Design tip_: These kinds of transformations should be functions in a View that are called from a Template -- rather than coded inline in a Template
- **Channels**
- **PubSubs**
- **Templates**
- **Precense**

Web files are located in `/lib/app_name_web/`.

## Plugs

### Plug function parameters

- `conn` - a struct which holds a ton of data about the request
- `params` - the request parameters (if not using, prepend a `_` to avoid compiler warnings)

## Templates

"The standard templating engine Phoenix uses is [EEx](https://hexdocs.pm/eex/EEx.html), which stands for Embedded Elixir. Phoenix enhances EEx to include automatic escaping of values. This protects you from security vulnerabilities like Cross-Site-Scripting with no extra work on your part. All of our template files will have the `.eex` file extension."

## Creating pages

These are the basic steps for adding a new page to a Phoenix site.

- In `router.ex`, write a `get` expression for the route path in the body of some `scope`
- Create the files in `/lib/app_name_web/`:
  - `controllers/new_page_controller.ex`
    - `use ProjectNameWeb, :controller:`
    - Define `index(conn, params)` and call `render(conn, "index.html")` to render the page
  - `views/new_page_view.ex`
    - `use ProjectNameWeb, :viewj
    - _optional:_ write any presentation layer logic here
  - `templates/new_page/index.html.eex` (or whatever you want the html filename to be)
    - Design your page

## Macros

### Router

#### `scope`



#### HTTP method macros

You can route an HTTP method with the `match` macro:

```elixir
match :get, "/", PageController, :index
```

You can write these for all of the HTTP verbs. Phoenix also provides macros that do exactly as above for `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `OPTIONS`, `CONNECT`, `TRACE` and `HEAD`. Thus, if Phoenix doesn't provide a macro for a route you want to create, you can use `match` directly.

```elixir
get "/", PageController, :index
 1   2         3            4
```

1. HTTP method
2. Route path - here we've used the root path
3. Name of controller module - `PageController` is a module defined in `controllers/page_controller.ex"`
4. Name of function to run in the controller module - the default `PageController.index` just `render`s via `PageView` in `views/page_view.ex"

The following expressions are equivalent.

```elixir
get "/", :index, do: ...

plug :match
match "/", via: :get, do: ...

def match(%{path_info: ["hello"]} = conn, _opts), do: ...
```
