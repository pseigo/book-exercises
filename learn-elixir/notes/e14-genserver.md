---
title: "Episode 14: GenServer"
subtitle: "Learn Elixir ([https://www.learnelixir.tv/](https://www.learnelixir.tv/))"
author: [Peyton Seigo]
date: "2019-05-07"
titlepage: true
---

# Episode 14: GenServer

## Summary

- Introduction to OTP
- Manually creating a `GenServer`
- `GenServer` API
- When to use `GenServer`

See the mix project in `code/e14-genserver` for some fun examples!

## GenServer API

### Starting the process

```elixir
# Starts a non-linked process. Errors won't crash the current process.
{:ok, pid} = GenServer.start(CallbackModule, [arg1, arg2], opts)

# Starts a linked process. Errors WILL crash the current process.
{:ok, pid} = GenServer.start_link(CallbackModule, [arg1, arg2], opts)
```

### Sending messages

- `GenServer.cast` - sends asynchronous message to a process without expecting a response (non-blocking)
  - `:ok` is always returned, regardless of whether destination `server` received a response
- `GenServer.call/2` - sends synchronous message expecting a response (blocking)

## When to Use GenServer

- To **distribute work across cores** for asynchronous tasks or for speed
  - _Also consider `Task` and `Agent`_
- To **synchronize** multiple users of a given piece of data
  - _Sequential reading can be a bottleneck with many messages_
- For **error recovery**
  - _Processes can be supervised and restarted_
- To **update** your data format without disconnecting users
- For a **client/server** system

If none of these cases apply, try using a struct or other data structure.

> A `GenServer`, or a process in general, must be used to model runtime characteristics of your system. A `GenServer` must never be used for code organization purposes.
>
> This is an anti-pattern not only because it convolutes the logic [and] puts [it] behind a single process that will potentially become a bottleneck in your system, especially as the number of calls grow.
>
> If you don't need a process, then you don't need a process. Use processes only to model runtime properties, such as mutable state, concurrency and failures, never for code organization.
>
> _source: [When (not) to use a GenServer](https://hexdocs.pm/elixir/GenServer.html#module-when-not-to-use-a-genserver)_
