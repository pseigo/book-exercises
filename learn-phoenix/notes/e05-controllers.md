---
title: "Episode 05: Controllers"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-19"
titlepage: true
---

## Standard action names

```elixir
def action_name(conn, params), do: ...
```

- index - renders a list of all items of the given resource type
- show - renders an individual item by id
- new - renders a form for creating a new item
- create - receives params for one new item and saves it in a datastore
- edit - retrieves an individual item by id and displays it in a form for editing
- update - receives params for one edited item and saves it to a datastore
- delete - receives an id for an item to be deleted and deletes it from a datastore

## Data access

Options for data access in Elixir

- [Ecto](https://hexdocs.pm/ecto) project with SQL relational databases (Postgres or MySQL)
- [Ets](http://www.erlang.org/doc/man/ets.html) - OTP key-value data store
- [Dets](http://www.erlang.org/doc/man/dets.html) - OTP key-value data store
- [Mnesia](http://erlang.org/doc/man/mnesia.html) - OTP relational database with its QLC query language

## Flash messages

Can communicate with user using flash messages -- e.g., error or welcome messages. Flash functions live in `Phoenix.Controller`.

- `put_flash/3` and `get_flash/2` to put and get flash messages by key
- `clear_flash/1` removes any flash messages stored in the session for the given `conn`
- Can access flash messages in templates
  - e.g., `<%= get_flash(@conn, :info) %>`
  - _The default Phoenix css template shows how you can make messages appear only when there is some text inside them_

## Rendering

In actions, can render using

- `text/2`
- `json/2`
- `html/2` -- can't use EEx tags, rather must use string interpolation
- `render/3` for rendering a template into a layout
  - Can pass in @variables with the third arg (a list `[]`), OR by first piping `conn` into `Plug.Conn.assign/3` (which `Phoenix.Controller` imports)

You can also set default variable values for `render` by making a plug that calls `assign/3`

```elixir
# Sets a default :message, but only for :index and :show actions
plug :assign_welcome_message, "Welcome back!" when action in [:index, :show]

def index(conn, params) do
  conn
  |> assign(:message, "Welcome back, but with a twist!")
  |> render("index.html")
end

defp assign_welcome_message(conn, msg) do
  assign(conn, :message, msg)
end
```

### Sending responses directly

Can also compose your own reponse if none of the other rendering options are enough.

- `put_resp_content_type(conn, type)`: sets [content type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) which is an [HTTP header field](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Standard_response_fields) -- don't think this is always required?
- `send_resp(conn, status, body)`: sends response with [status code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) and a body
- `halt(conn)`: required to make the Plug pipeline stop!

```elixir
def index(conn, _params) do
  conn
  |> put_resp_content_type("text/html")
  |> send_resp(200, "")
  |> halt()
end
```

### Assigning layouts

- Layouts are a subset of templates
  - Need a view to render them -- `LayoutView` in `lib/app_name_web/views/layout_view.ex`
- Live in `lib/app_name_web/templates/layout`

Can switch layouts by applying `put_layout/2` before rendering. `put_layout(conn, false)` will render without a layout.

### Overriding rendering formats

This section shows how to add templates for alternative rendering formats like HTML, plain text, or JSON based on a `:format` URL argument. [See the docs](https://hexdocs.pm/phoenix/controllers.html#overriding-rendering-formats) to learn how to do this.

### Setting the content type

See the docs.

### Setting the HTTP status

See the docs.

## Redirection

See the docs.

## Action fallback

See the docs.

## Halting the plug pipeline

`halt(conn)` is required to make the plug pipeline stop. It doesn't stop functions locally (e.g., in the same action), but will take effect when `conn` is passed to the next plug downstream.
