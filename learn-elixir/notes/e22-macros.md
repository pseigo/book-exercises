---
title: "Episode 22: Macros"
subtitle: "Learn Elixir ([https://www.learnelixir.tv/](https://www.learnelixir.tv/))"
author: [Peyton Seigo]
date: "2020-01-19"
titlepage: true
---

## Summary

- x

## Terminology

- x

## Notes

- x

## Purpose of macros and usage guidelines

Problem: writing code that **is good** and **looks good**

Some of the benefits of macros are that they:

- Reduce boilerplate
- Do performance optimizations
- Make complicated problems approachable

However, poorly written macros can:

- Turn beautiful code into **bad code**
- Add complexity => increasing chance of strange compile-time bugs

### Good code

|Pros|Cons|
|-|-|
|Clear|Verbose
|Flexible|Repetitive & has boilerplate
|Easy to modify|

### Pretty code

|Pros|Cons|
|-|-|
|Concise|Not very flexible
|Fun to write|Difficult to understand
|Hides complexity|Difficult to modify

One big issue with macros is that they are usually only useful for the use cases the author came up with. Thus, macros can restrict the user from using the underlying API to its full extent.

Pretty code also tends to use 'magic tricks,' meaning it hides complexity but is hard to modify and makes it to understand what's actually going on.

Daniel Berkompas expands on how he views 'magic tricks':

> I mean using obscure or complicated aspects of the programming language purely to make syntax shorter, for it's own sake. I call this magic because many developers won't be familiar with how the prettier syntax was implemented, so it's magic to them.
>
> Elixir macros can definitely be used in this magical way, which I try to discourage in this episode. The good news is that unlike other programming languages, Elixir _only_ has macros, so once you understand how they work you'll have a basic grasp of what any macro you see must be doing. In Ruby, for example, there are a lot more moving parts.
>
> — [Daniel Berkompas](https://www.learnelixir.tv/episodes/22-macros#comment-2992230121)

Macros should strive to be

- Concise, yet expressive, and
- Powerful, yet flexible (not too restrictive or limited)

### José Valim's advice on using macros

> Data > Functions > Macros — José Valim

- Don't use macros _everywhere_
- When designing system, should
  1. Design a good, core data structure for problem
  2. Design a purely functional solution (a layer on top of the data structure)
  3. (Optional) Add cosmetic macros to make the functional solution easier to generate
- In other words, you have to write **good code** before prettying it up
- This hierarchy is great because even if the macros are poorly written, a user can still use the underlying functions or data structures

## How macros work

- Macros transform code at compile time
  - Elixir code => Abstract syntax tree (AST) => Macros transform AST => Compiled to BEAM bytecode
  - Macros should turn beautiful code into good code

### More on Elixir Abstract Syntax Trees (ASTs)

All expressions are represented as a tuple,

  `{function, context, args} = {atom | tuple, list, list | atom}`.

- The first element is an atom or another tuple in the same representation;
- The second element is a keyword list containing metadata, like numbers and contexts;
- The third element is either a list of arguments for the function call or an atom. When this element is an atom, it means the tuple represents a variable.

You can ask Elixir to show the AST representation of any expression using the `quote` macro.

```elixir
iex> quote do: sum(1, 2, 3)
{:sum, [], [1, 2, 3]}

iex> quote do: :math.pow(x + y, 2) / 2
{:/, [context: Elixir, import: Kernel],
 [
   {{:., [], [:math, :pow]}, [],
    [
      {:+, [context: Elixir, import: Kernel],
       [{:x, [], Elixir}, {:y, [], Elixir}]},
      2
    ]},
   2
 ]}
```

See the [docs](https://elixir-lang.org/getting-started/meta/quote-and-unquote.html) for more information on quoting and unquoting.

## Macro expansion

- `Macro.expand(ast, __ENV__)`: expands all the macros in `ast` until all leaves in the tree are quote literals
- `Macro.to_string(ast)`: prints `ast` as Elixir code, preserving macros

```elixir
iex> ast = quote do: unless 1 + 2 == 4, do: "Hello!"
{:unless, [context: Elixir, import: Kernel],
 [
   {:==, [context: Elixir, import: Kernel],
    [{:+, [context: Elixir, import: Kernel], [1, 2]}, 4]},
   [do: "Hello!"]
 ]}

iex> ast = Macro.expand(ast, __ENV__)
{:case, [optimize_boolean: true],
 [
   {:==, [context: Elixir, import: Kernel],
    [{:+, [context: Elixir, import: Kernel], [1, 2]}, 4]},
   [
     do: [
       {:->, [],
        [
          [
            {:when, [],
             [
               {:x, [counter: -576460752303423391], Kernel},
               {{:., [], [Kernel, :in]}, [],
                [{:x, [counter: -576460752303423391], Kernel}, [false, nil]]}
             ]}
          ],
          "Hello!"
        ]},
       {:->, [], [[{:_, [], Kernel}], nil]}
     ]
   ]
 ]}

iex> Macro.to_string(ast)
"case(1 + 2 == 4) do\n  x when Kernel.in(x, [false, nil]) ->\n    \"Hello!\"\n  _ ->\n    nil\nend"
```

## `use` macro

Used to extend another module when `import` and `alias` aren't enough.

```elixir
use OtherModule, key: val

# Expands to...
OtherModule.__using__(key: val)

# And in OtherModule, we can do whatever setup we need
defmacro __using__(_opts) do
  quote do
    import SecondModule
    import ThirdModule
  end

  def init() do
    # default implementation
  end

  defoverridable [init: 1]
end
```
