# Folders and files

## `lib/`

- Contains code for the project.
- Better to split code into multiple modules and files rather than put everything in the top of the `lib/` directory
  - Put code in a folder with the same name as the project in `lib/`
- Prefix module names with their directory name.
  - eg. A module in `lib/crypto/` should be prefixed `Crypto.ModuleName`

# Config

## Creating `opts` in `config.exs`

`config/2` and `config/3`

```elixir
config :app_name, opt1: "value", opt2: "another value"
config :app_name, AppName.SomeModule, prefix: "Encrypted: "
```

## Using `opts` in a module

```elixir
Application.get_env(:app_name, __MODULE__)[:opt]
# module refers to the current module
```

> **TIP:**
> use _Module Attributes_ as a constant for environment config.
> ```elixir
>   @prefix Application.get_env(:app_name, __MODULE__)[:opt]
>
>  def encrypt(text) do
>    @prefix <> String.reverse(text)
>  end
> ```

## A config for specific scenarios

Mix **environments** allow customized compilation and options for specific scenarios. See the [official documentation](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html#environments) for info on the three default environments and how they're used.

When testing from the command line, the environment can be chosen by the following command:

- Unix: `$ MIX_ENV=<env> & mix compile`
- Windows: `> set "MIX_ENV=<env>" && mix compile`

# Tasks

- `mix help`
- `mix compile`
  - Only compiles if necessary.

## Creating tasks

- Create tasks as `taskname.ex` in `lib/mix/tasks/`.

## Documentation

Tasks can be documented in two ways with module attributes.

1. `@shortdoc "Does a thing"`
2. `@moduledoc """ Long explanation & example """`

`@shortdoc` allows the task to show up in the `mix help` list and gives the task some helpful text.

`@moduledoc` works like any other module documentation and is printed by running `mix help <task name>`.

## Parsing command line options

The `OptionParser` module contains useful functions to parse command line options. Refer to the incredible [`parse/2` function](https://hexdocs.pm/elixir/OptionParser.html#parse/2) to understand how this works.

# Show notes

How to create a new mix project:

`$ mix new project_name`

How to create an umbrella project:

`$ mix new project_name --umbrella`

Then, create component projects within the umbrella project:

`$ cd project_name/apps`

`$ mix new component_name`
# Common commands

Launching iex in the context of a mix project:

`$ iex -S mix`

# Notes

- `.exs` files are scripts and are ignored by the mix compiler unless explicitly ran.
- Use `recompile()` to recompile within IEX.
- The term "app", in the context of umbrella projects, is synonymous to a mix project.
