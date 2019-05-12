---
title: "Episode 15: Supervisor"
subtitle: "Learn Elixir ([https://www.learnelixir.tv/](https://www.learnelixir.tv/))"
author: [Peyton Seigo]
date: "2019-05-08"
titlepage: true
---

# Episode 15: Supervisor

## Summary

- Erlang's error handling philosophy
- How to construct a supervision tree
- Real-world examples

## Supervisors

- In Elixir, you do not write code to handle unknown errors
- Instead of "what classes do I need?" you ask, "what **processes** do I need?"
- Supervisors watch other processes and automatically restart them if they crash.

Supervision trees enable

1. Error isolation
2. Elegant error recovery
3. Self-healing systems

### Elixir 1.5 Changes

> *Note*: Since Supervisors were revamped in Elixir 1.5, the example in the video has been deprecated.

For the new method of using Supervisors, see the [documentation](https://hexdocs.pm/elixir/Supervisor.html) first and the `learn_supervisor` example in this repository.

As a result, the code samples for headings past 'Strategies' shown below may be outdated.

## Module-based Supervisors vs. Implicit Supervisors

There are two ways to create a supervisor.

1. Call `Supervisor.start_link/2` with a list of children (automatically initialized)
    - "A supervisor started with this function is linked to the parent process and exits not only on crashes but also if the parent process exits with `:normal` reason."
2. Call `Supervisor.start_link/3` in its own module. Children are manually initialized in an `init/1` function
   1. Create your module (e.g., `Sup`)
   2. Add `use Supervisor`. This automatically defines `child_spec/1`
   3. Write `start_link/1` and call `Supervisor.start_link/3`
   4. Write `@impl true` with `init/1`. Make a list of children and call `Supervisor.init/2`

The [docs](https://hexdocs.pm/elixir/Supervisor.html#module-module-based-supervisors) recommend to make a supervisor without a callback module only at the top of supervision tree. All other supervisors should be module-based for the automatic `child_spec/1`.

### Strategies

| Strategy | Description
|-|-
| `:one_for_one` | if a child process terminates, only that process is restarted.
| `:rest_for_one` | if a child process terminates, the terminated child process and the rest of the children started after it, are terminated and restarted.
| `:one_for_all` | if a child process terminates, all other child processes are terminated and then all child processes (including the terminated one) are restarted.
| `:simple_one_for_one` | for dynamically adding child processes. (_deprecated, replaced by `DynamicSupervisor`_)

> **Suggestion**: use `:one_for_one` until it doesn't work for you

## Tips

1. You can create a supervised mix project with `mix new app_name --sup`
2. GenServer processes can be named
3. Worker processes can have IDs
4. Supervisors can be supervised
5. Try a built-in Erlang database for storage

### 1. Mix Project with a Supervisor

Add `--sup` to generate a supervised mix project.

```bash
mix new my_app --sup

# lib/my_app.ex will be a supervisor
```

### 2. GenServer Processes can be Named

You can use `GenServer` processes **without knowing their `pid`** by using the `:name` option:

```elixir
GenServer.start_link(Game.Cache, [], name: Game.Cache)
GenServer.cast(Game.Cache, {:save, state})
```

This is helpful for reflecting your model of the supervisor tree in your code.

### 3. Workers can have IDs

Using the `:id` option:

```elixir
worker(SupervisedProcess, [], id: "some-id")
```

### 4. Supervisors can be Supervised

Supervising other supervisors allows for complex supervision trees. Use `supervisor` instead of `worker`:

```elixir
supervisor(Game.Supervisor, [])
```

### 5. Try ETS for Caching

Don't go straight to a third-party tool if you need a data store. Give the `ets` or `dets` Erlang modules a try.

- `ets` - memory-based store
- `dets` - disk-based store
- Mnesia - relational database
