---
title: "Episode 09: Channels"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-02-06"
titlepage: true
---

- Analogous to controllers, but has bi-directional communication with persistent connections.
- Splits WebSocket messages into separate topics.
- Clients can subscribe to many channels over one socket connection.

## Channel API: Callbacks

- `join/3`: is client allowed to join topic?
- `handle_in/3`: handles incoming messages
- `handle_out/3`: intercepts outgoing messages to enrich w/ more data
- `terminate/2`: called if client leaves or disconnects

## Sending Messages From a Channel Module

- `broadcast/3`: send message to all subscribers, _including_ current channel
- `broadcast_from/3`: sends messages to _other_ channels
- `push/3`: send message to a single channel only

### Intercepting messages

This is where `handle_out/3` in a channel module is useful.

```elixir
intercept ["new_msg"]

def handle_out("new_msg", payload, socket) do
  # Customize payload
  push socket, "new_msg", payload
  {:noreply, socket}
end
```
