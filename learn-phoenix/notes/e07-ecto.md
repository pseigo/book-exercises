---
title: "Episode 07: Ecto"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-19"
titlepage: true
---

- Purpose: Data validation and persistence
- New projects come with Ecto with Postgres adapter by default, but can pass `--no-ecto` to exclude

## Resources

- [Ecto Getting Started](https://hexdocs.pm/ecto/getting-started.html)
  - Project creation
  - Setting up the database
  - Creating the schema
  - Inserting data
  - Validating changes
  - Queries
  - Updating and deleting records
- [Phoenix Ecto Guide](https://hexdocs.pm/phoenix/ecto.html) (Finer details of Ecto)
  - Repo
  - Schema
  - Changesets and validations
  - Data persistence
  - Using MySQL
- [Learn Phoenix Ecto Episodes](https://www.learnphoenix.tv/episodes)
  - [Ep01 - Ecto Schemas](https://www.learnphoenix.tv/episodes/ecto-schemas) maps database tables to Elixir structs
  - [Ep02 - Ecto.Repo](https://www.learnphoenix.tv/episodes/ecto-repo) connects to and runs queries against a database
  - [Ep03 - Ecto Multi](https://www.learnphoenix.tv/episodes/ecto-multi) is another way to run a series of operations as a transaction
  - [Ep04 - Migrations](https://www.learnphoenix.tv/episodes/ecto-migrations) are scripts used to modify a database schema over time
  - [Ep05 - Ecto Sandbox and Testing Ecto Schemas](https://www.learnphoenix.tv/episodes/ecto-testing)

## Terminology

- x

## Ecto setup

```elixir
mix ecto.gen.repo -r AppName.Repo
```

This generator creates two files:

- `AppName.Repo` module
  - in `use Ecto.Repo` macro, the `:otp_app` option tells Ecto which Elixir app to look for database configuration in
- Repo config in `config/config.exs`
  - See [Ecto.Adapters.Postgres](https://hexdocs.pm/ecto_sql/Ecto.Adapters.Postgres.html) for all the config options!
  - Most options are specific to the adapter (e.g. Postgres vs MySQL), but the following are common to all:
    - `:name` of Repo supervisor process
    - `:priv` directory for repo, migrations, schema, etc.
    - `:url` that specifies storage information
    - `:log` level for queries (or `false` to disable) -- defaults to `:debug`
    - `:pool_size` used by connection module -- defaults to `10`
    - `:telemetry_prefix` for adapters to publish events using the `Telemetry` library -- default is based on app name, e.g. `AppName.Repo` => prefix is `[:app_name, :repo]`

Also need to add `AppName.Repo` worker to application supervisor (in `lib/app_name/application.ex`).

And in `config/config.exs` under the generated `config` line, add

```elixir
config :app_name, ecto_repos: [AppName.Repo]
```

to tell the application about the repo.

## Database setup

Can create a database on your server with `mix ecto.create` (user needs `LOGIN` and `CREATEDB` permissions).

### Migrations

```elixir
mix ecto.gen.migration create_users
```

In the generated `priv/repo/migrations/timestamp_create_users.exs` file, you can set up the tables and columns for your database. For example,

```elixir
defmodule AppName.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer
    end
  end
end
```

- See [`Ecto.Schema` types](https://hexdocs.pm/ecto/Ecto.Schema.html#module-types-and-casting)
- The naming convention for tables in Ecto databases is to use a pluralized name

Once your migration is setup, you can create the table by running

```elixir
mix ecto.migrate
```

You can use `mix ecto.rollback` to undo.
