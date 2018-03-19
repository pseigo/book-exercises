# Useful enum functions

## Fundamentals

- [reduce/3](https://hexdocs.pm/elixir/Enum.html#reduce/3): uses an `acc` and invokes a `fun` on each element to reduce it to a single value
- [map/2](https://hexdocs.pm/elixir/Enum.html#map/2): invokes `fun` on each element and saves each result to a new list
- [each/2](https://hexdocs.pm/elixir/Enum.html#each/2): invokes `fun` on each element (without saving result)

## Utility & Math

- [min/1](https://hexdocs.pm/elixir/Enum.html#min/2): returns minimal value in collection (erlang ordering)
- [min_by/2](https://hexdocs.pm/elixir/Enum.html#min_by/3): returns minimal value in collection (user defined, good for structures)
- [max/1](https://hexdocs.pm/elixir/Enum.html#max/2): returns maximal value in collection (erlang ordering)
- [max_by/2](https://hexdocs.pm/elixir/Enum.html#max_by/3): returns minimal value in collection (user defined, good for structures)
