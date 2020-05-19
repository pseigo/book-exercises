---
title: "Episode 08: Sockets"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-31"
titlepage: true
---

## Video Topics

Some highlights from the [Learn Phoenix Socket video](https://www.learnphoenix.tv/episodes/sockets). There are some useful examples there that I might want to come back to.

- Authorizing WS connections with valid user credentials
- Identifying connections uniquely (e.g., so the server can disconnect all WS sessions after a user changes their password)
- JS client examples — can just refer to the [docs](https://hexdocs.pm/phoenix/js/) instead

## Relevant Docs and Specs

### Specs

- [WebSocket.org](https://www.websocket.org/)
- [RFC 6455 - WebSocket Protocol](https://tools.ietf.org/html/rfc6455)
- [RFC 793 - TCP](https://tools.ietf.org/html/rfc793)

### Phoenix documentation

- [Phoenix.Socket](https://hexdocs.pm/phoenix/Phoenix.Socket.html)
- [Phoenix.Channel](https://hexdocs.pm/phoenix/Phoenix.Channel.html)
- [Channels](https://hexdocs.pm/phoenix/channels.html)
- [Testing Channels](https://hexdocs.pm/phoenix/testing_channels.html)

Phoenix bundles a front-end JavaScript client.

- [JavaScript WebSocket Client Documentation](https://hexdocs.pm/phoenix/js/)
- [JavaScript WebSocket Client Source Code](https://github.com/phoenixframework/phoenix/blob/master/assets/js/phoenix.js)

See the full list of 3rd party WebSocket clients for other languages at [Phoenix - Channels - Client Libraries](https://hexdocs.pm/phoenix/channels.html#client-libraries).

## Phoenix Sockets

- Endpoint configuration
- Transports
- Connecting

With HTTP, a server can send data to the client only when the client asks. Over WebSockets, a server can send data whenever it wants.

## Long Polling

Before WebSockets, used long polling for real-time behaviour. Downsides:

- Overhead: HTTP renegotiation for each request
  - _WebSocket connection only needs to be established once_
- Perceived latency: Delays before fresh data can be loaded
  - _Can send data over WebSockets in real-time w/o polling_

Phoenix has supported 2+ million WebSocket connections on a single server.
