---
title: "Episode 13: Processes"
subtitle: "Learn Elixir ([https://www.learnelixir.tv/](https://www.learnelixir.tv/))"
author: [Peyton Seigo]
date: "2019-05-05"
titlepage: true
---

# Episode 13: Processes

## Summary

- x

## Terminology

- x

## Notes

- x

## Processes

- Spawning processes
- Messaging
- Linking
- Monitoring

## Spawning processes

- New processes are completed isolated.
- Current process is not affected by spawning a process.
- NOT O.S. processes; don't have the same downsides with threads. Not computationally expensive.

Using the `spawn` function:

```elixir
spawn fn ->
  IO.puts "This will run in a separate process"
end

spawn SomeModule, :some_function, [arg1, arg2]
```

> _"Typically developers do not use the spawn functions, instead they use abstractions such as [Task](https://hexdocs.pm/elixir/Task.html), [GenServer](https://hexdocs.pm/elixir/GenServer.html) and [Agent](https://hexdocs.pm/elixir/Agent.html), built on top of spawn, that spawns processes with more conveniences in terms of introspection and debugging."
> [source](https://github.com/elixir-lang/elixir/blob/v1.6.4/lib/elixir/lib/kernel.ex#L832)_

## Messaging

Spawning a process returns a _Process Identifier_, or `pid` (a core Elixir data type):

```elixir
pid = spawn(fn -> ... end)

# Get the current process's pid with self()
self

# Send a message to a process
send pid, :message
```

## Receiving messages

Using the `receive` macro:

```elixir
receive do
  message -> # do something with the message
end
```

Gets the first available message, or if there are none, blocks process until a message is available.

`receive` supports pattern matching:

```elixir
receive do
  {:say, msg} ->
    IO.puts(msg)

  {:think, msg} ->
    Logger.debug(msg)

  _other ->
    # default case
end
```

**Messages that can not be matched are left in the mailbox.** Add a default case to prevent the mailbox from filling up and crashing the process.

Wait only a specified time (in ms) with `after`:

```elixir
receive do
  message -> process(message)
after 500 ->
  # do something
end
```

## Killing a process

See [`Process.exit/2`](https://github.com/elixir-lang/elixir/blob/v1.6.4/lib/elixir/lib/process.ex#L143).

```elixir
pid = spawn(fn -> ... end)
Process.exit(pid, :kill)
```

By default, if a spawned process dies (either by crash, an error, or manually killing it), the spawner will not be notified. It is completely isolated from the rest of the system.

## Linking processes together

Tie two processes together with `spawn_link`. If one process dies, the other will die as well.

```elixir
romeo = self
juliet = spawn_link(fn -> ... end)

# Causes the current process to also exit, because it is linked to the
# process we are killing.
Process.exit(juliet, :kill)
```

Process death with the `:trap_exit` flag. The current process will receive an `!EXIT` message when the linked process dies (probably a good idea).

```elixir
Process.flag(:trap_exit, true)
juliet = spawn_link(fn -> ... end)

receive do
  {:EXIT, pid, reason} ->
    # Revive Juliet?
end
```

## Spawn monitor

Monitor spawned processes with `spawn_monitor`. It returns `{pid, ref_to_monitor}`. When the process dies, it sends a `:DOWN` message rather than an `:EXIT` message.

```elixir
{juliet, _ref} = spawn_monitor(fn -> ... end)

receive do
  {:DOWN, _ref, :process, pid} ->
    # Revive Juliet?
end
```

## Exercises

1. Examine the `pmap` function for performance--compare it to Enum using different data and see which performs quicker.
2. Create a long-running process and send it messages.
