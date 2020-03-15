---
title: "Episode 11: Contexts and Phoenix Design Principles"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-02-06"
titlepage: true
---

## Useful generators

```elixir
mix phx.gen.html Accounts User users name:string age:integer
```

- Context module name
- Schema module name
- Plural form of schema module (used as schema table name)
- Columns for the table in the form `name:type`

**NOTE**: A resource may also be split over distinct contexts (such as `Accounts.User` and `Payments.User`)

### Generating schemas

See docs for the functions in [`Ecto.Migration`](https://hexdocs.pm/ecto/2.0.2/Ecto.Migration.html) for useful options like generating foreign keys (with `references/2`) or enforcing data integrity as seen in the [Contexts guide](https://hexdocs.pm/phoenix/contexts.html#in-context-relationships) by setting the foreign key's `:on_delete` option to `:delete_all`.

> "By using [database constraints], we enforce data integrity at the database level, rather than relying on ad-hoc and error-prone application logic."

## Contexts

> "Sometimes it may be tricky to determine if two resources belong to the same context or not. In those cases, prefer distinct contexts per resource and refactor later if necessary. Otherwise you can easily end-up with large contexts of loosely related entities. In other words: if you are unsure, you should prefer explicit modules (contexts) between resources."

The same advice is reiterated when using `mix phx.gen.html`:

> It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart. The fact two entities are related in the database does not mean they belong to the same context.
>
> If they are not closely related, another context probably works better. If you are not sure, prefer creating a new context over adding to the existing one.

## Advice on umbrella projects from Elixir docs

- Umbrella projects: convenience to help organize + manage multiple apps
  - Provides some separation between apps, but they are not fully decoupled as they share the same config and dependencies.
- "Mono-repo": pattern of keeping multiple apps in the same repo
  - Umbrella projects use this pattern to compile, test and run multiple apps at once
  - If you need to use different configs in each app for the same dependency or use different dependency versions, then it is likely your codebase has grown beyond what umbrellas can provide.

"The good news is that breaking an umbrella apart is quite straightforward, as you simply need to move applications outside of the umbrella project’s `apps/` directory. In the worst case scenario, you can discard the umbrella project and all related configuration (`build_path`, `config_path`, `deps_path` and `lockfile`) and still leverage the “mono-repo” pattern by keeping all applications together in the same repository. Each application will have its own dependencies and configuration. Dependencies between those applications can still be explicitly listed by using the :`path` option (in contrast to `:git`)."

- Apps in umbrella projects must only use public APIs of the other apps and not any private functionality
  - Think of umbrella apps as any other dependency or even Elixir itself: you can only access what is public and documented.
  - Reaching into private functionality in your dependencies causes coupling which will make things break later
- Umbrella apps can be used as a stepping stone for eventually extracting an application from your codebase
  - Can develop separate apps in an umbrella and eventually move it to a private repo or Hex package to use in other projects

"Developers may also use umbrella projects to break large business domains apart. The caution here is to make sure the domains don’t depend on each other (also known as cyclic dependencies). If you run into such situations, it means those applications are not as isolated from each other as you originally thought, and you have architectural and design issues to solve."

"Finally, keep in mind that applications in an umbrella project all share the same configurations and dependencies. If two applications in your umbrella need to configure the same dependency in drastically different ways or even use different versions, you have probably outgrown the benefits brought by umbrellas. Remember you can break the umbrella and still leverage the benefits behind 'mono-repos'."

Source: [Dependencies and umbrella projects](https://elixir-lang.org/getting-started/mix-otp/dependencies-and-umbrella-projects.html)

## Design Principles - Learn Phoenix: "Changes in 1.3"

- In Phoenix projects, entire API for business logic apps should live in the top-level `.ex` file
