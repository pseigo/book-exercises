---
title: "Episode 08: Sockets"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-31"
titlepage: true
---

## WebSocket protocol

- [WebSocket.org](https://www.websocket.org/)

## Phoenix Sockets

- Endpoint configuration
- Transports
- Connecting

With HTTP, a server can send data to the client only when the client asks. Over WebSockets, a server can send data whenever it wants.

## Long polling

Before WebSockets, used long polling for real-time behaviour. Downsides:

- Overhead: HTTP renegotiation for each request
  - _WebSocket connection only needs to be established once_
- Perceived latency: Delays before fresh data can be loaded
  - _Can send data over WebSockets in real-time w/o polling_

Phoenix has supported 2+ million WebSocket connections on a single server.
