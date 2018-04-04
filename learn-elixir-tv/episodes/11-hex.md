# Hex

- Package manager for the Erlang ecosystem
- Integrates with `mix`

## Install Hex

Must install HEx before using it.

`$ mix hex.local`

## Resources for finding packages

- [h4cc/awesome-elixir](https://github.com/h4cc/awesome-elixir)
  - "A curated list of amazingly awesome Elixir libraries, resources, and shiny things inspired by awesome-php."
- [Hex Web Search](https://hex.pm/)
- `mix hex.search PACKAGE_NAME`

## Installing packages

Add `{:package_name, opts}` to the `deps` in your `mix.exs` file.

```elixir
defmodule do
  # ...

  def deps do
    [
      {:package_name, "1.0.0"}
    ]
  end
end
```

### Specifying a dependency

[Semantic versioning](https://semver.org/)

- Only version 1.0.0
  - `{:package_name, "1.0.0"}`
- Any version greater than 1.0.0
  - `{:package_name, "> 1.0.0"}`
- Any version less than 2.0.0
  - `{:package_name, "< 2.0.0"}`
- Any version between 1.0.0 and 1.1.0
  - `{:package_name, "~> 1.0.0"}`
- Any version between 1.0.0 and 2.0.0
  - `{:package_name, "~> 1.0"}`

## Mix tasks
