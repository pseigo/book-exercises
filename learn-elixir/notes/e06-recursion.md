---
title: "Episode 06: Recursion"
subtitle: "Learn Elixir ([https://www.learnelixir.tv/](https://www.learnelixir.tv/))"
author: [Peyton Seigo]
date: "2019-04-24"
---

# Episode 06: Recursion

## Tips

For recursive functions, if you notice that you're passing the exact same arguments to a private helper function, you can probably make the helper public. In this code, the second function is doing nothing but passing the same arguments along,

```elixir
def reduce([first|rest], fun) when is_function(fun) do
  do_reduce(rest, first, fun)
end

def reduce(list, acc, fun) when is_list(list) and is_function(fun) do
  do_reduce(list, acc, fun)
end

defp do_reduce([], acc, _), do: acc

defp do_reduce([first|rest], acc, fun) do
  do_reduce(rest, fun.(first, acc), fun)
end
```

We can clean it up as so,

```elixir
def reduce([first|rest], fun) when is_function(fun) do
  reduce(rest, first, fun)
end

def reduce([first|rest], acc, fun) when is_function(fun) do
  reduce(rest, fun.(first, acc), fun)
end

def reduce([], acc, _), do: acc
```
