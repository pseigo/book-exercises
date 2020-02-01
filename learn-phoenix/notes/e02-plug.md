---
title: "Episode 04: Plug"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-18"
titlepage: true
---

## Summary

-

## Terminology

## Notes

- Plugs are functions that take and return a `conn` struct (see `Plug.Conn`).
  - Plug converts requests into a `conn` struct  (_contains protocol/scheme, host name (the base url), request path, port, remote IP, request headers, and more_)
  - See [Plug.Conn#Request fields](https://hexdocs.pm/plug/Plug.Conn.html#module-request-fields)
  - Plugs manipulate this `conn` until a response is sent back

## How plug handles requests

```none
  http://  www.example.com  /  about-us      ?ref=google
     |             |               |                |
  Protocol      App Name      Function Name     Arguments
```

## Types of plugs

### Function plugs

```elixir
def some_plug(conn, _opts) do
  conn
  |> put_resp_content_type("text/plain")
  |> send_Resp(200, "Hello world")
end
```

### Module plugs

Requires module to define both `init/1` and `call/2`.

```elixir
defmodule HelloWorld do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end
```

If you have the `HelloWorld` module in a project and a plug module or a Router, you can start a webserver in iex like so:

```elixir
iex> Plug.Adapters.Cowboy.http HelloWorld, []
{:ok, #PID<...>}
```

Visit [localhost:4000](localhost:4000), and you should see the response from your plug.

This shows that you only need one plug to run a web server.

## `Plug.Router`

I think Phoenix provides a wrapper around this? Or at least it includes everything relevant with the `use MyAppWeb, :router` macro

Write `plug :name_of_module_or_function` for the plug you want to use.

This example shows how we can use Plug to setup simple responses.

```elixir
defmodule MyApp.Router do
  use Plug.Router

  plug :match

  @doc """
  Displays "Hello world" at `/hello`.

  _Note: `/hello` becomes `["hello"]` in `conn.path_info`_
  """
  def match(%{path_info: ["hello"]} = conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello, World!")
  end

  @doc "Displays 'Not Found' for anything else."
  def match(conn, _opts) do
    send_resp(conn, 404, "Not Found")
  end
end
```

However, we don't have to do it this way because Plug defines lots of useful macros!

```elixir
defmodule MyApp.Router do
  use Plug.Router

  # Can put other plugs here like Plug.Logger, among 8 others that Plug offers
  plug :match
  plug :dispatch # need to add this

  get "/hello" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello, World!")
  end

  match _opts do
    send_resp(conn, 404, "Not Found")
  end
end
```

> Each `Plug.Router` has a plug pipeline, defined by `Plug.Builder`, and by default it requires two plugs: `:match` and `:dispatch`. `:match` is responsible for finding a matching route which is then forwarded to `:dispatch`.

## Built-in plugs

### Plug.CSRFProtection

Protects from cross-site request forgery.

### Plug.Head

Converts `HEAD` requests to `GET` requests.

The HTTP `HEAD` method requests HTTP headers from the server. i.e., the headers that would be returned if the specified resource was requested with an HTTP GET method.

### Plug.Logger

Logs basic request information in the format:

```elixir
GET /index.html
Sent 200 in 572ms
```

### Plug.MethodOverride

Overrides the request's `POST` method with the method defined in the `_method` request parameter.

### Plug.Parsers

Parses the request body and specifies a behaviour that all parsers to be used with Plug should adopt.

### Plug.RequestId

Generates a unique request id for each request.

### Plug.SSL

Used to force SSL connections and enable HSTS. Also provides conveniences for configuring SSL (see `configure/1`).

### Plug.Session

Handles session cookies and session stores. The session is accssed via functions on `Plug.Conn`.

### Plug.Static

Serves static content. If user requests any content defined in the options, server sends the content and halts the pipeline.

## Routers as plugs

Routers are plugs too, meaning you can forward requests to other routers:

```elixir
defmodule MyApp.Router do
  use Plug.Router

  forward "/about", to: MyApp.AboutRouter
end
```
