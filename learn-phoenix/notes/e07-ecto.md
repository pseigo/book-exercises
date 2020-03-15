---
title: "Episode 07: Ecto"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-19"
titlepage: true
---

## Ecto

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

## Consider Erlang's built-in databases

- **Erlang Term Storage (ETS)** - similar to NoSQL, but stores actual Erlang terms
  - A lot of apps use Redis for server-side caching, but consider ETS first when using Elixir!
- **Mnesia** - hybrid relational/object database optimized for high-availability

## Terminology

- x

## Ecto overview

Ecto is split into 4 main components:

- [Ecto.Repo](https://hexdocs.pm/ecto/Ecto.Repo.html)
- [Ecto.Schema](https://hexdocs.pm/ecto/Ecto.Schema.html)
- [Ecto.Changeset](https://hexdocs.pm/ecto/Ecto.Changeset.html)
- [Ecto.Query](https://hexdocs.pm/ecto/Ecto.Query.html)

## `psql` CLI tool for Postgres

- `psql database_name` to connect
- `show data_directory;` to show where files are stored
- `\d` to list the relations (tables) in the database
- `TABLE table_name;` or `SELECT * FROM table_name;` to list entries in a table

You can also run SQL queries from pgAdmin 4 by going to _Tools > Query Tool_.

## Ecto setup

```elixir
mix ecto.gen.repo -r AppName.Repo
```

This generator creates two files:

- `AppName.Repo` module
  - in `use Ecto.Repo` macro, the `:otp_app` option tells Ecto which Elixir app to look for database configuration in
  - `Ecto.Repo` adds a TON of database functions like `insert` and `get`
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
- The naming convention for tables in Ecto databases is to use a pluralized name (users, not user)

Once your migration is setup, you can create the table by running

```elixir
mix ecto.migrate
```

You can use `mix ecto.rollback` to undo.

## Schemas

Schemas are Elixir representations of data from a database. Commonly associated with a database table, but can also be associated with a database view.

- Can make a type (as a struct) in a module with `use Ecto.Schema`
  - The `schema` macro defines how columns from a particular table will map to the struct -- can use `:virtual` option in `field` entries if you want struct fields that aren't stored in the DB
- Naming convention in Ecto for schemas is a singularized name (user, not users)

### Changesets for validating changes

You can create functions called _changesets_ to validate changes on a schema.

Consider you have a schema called `User`, then you could define `changeset(user, params \\ %{})`. `user` is the object you want to modify and `params` describes desired changes to the fields.

```elixir
def changeset(user, params \\ %{}) do
  user
  |> Ecto.Changeset.cast(params, [:first_name, :last_name, :age])
  |> Ecto.Changeset.validate_required([:first_name, :last_name])
end
```

- `Ecto.Changeset.cast` tells the changeset what parameters are allowed to be passed through; anything _not_ in the list will be ignored
- `Ecto.Changeset.validate_required` defines which fields _must_ have values specified
  - _In the example above, any `user` passed through `changeset/2` must have a first and last name_

### The Ecto.Changeset struct

From [`Ecto.Changeset`](https://hexdocs.pm/ecto/Ecto.Changeset.html#module-the-ecto-changeset-struct):

The public fields are:

- `valid?` - Stores if the changeset is valid
- `data` - The changeset source data, for example, a struct
- `params` - The parameters as given on changeset creation
- `changes` - The `changes` from parameters that were approved in casting
- `errors` - All errors from validations
- `required` - All required fields as a list of atoms
- `action` - The action to be performed with the changeset
- `types` - Cache of the data's field types
- `empty_values` - A list of values to be considered empty
- `repo` - The repository applying the changeset (only set after a Repo function is called)
- `repo_opts` - A keyword list of options given to the underlying repository operation

The following fields are private and must not be accessed directly.

- `validations`
- `constraints`
- `filters`
- `prepare`

### Validations and constraints

From [`Ecto.Changeset`](https://hexdocs.pm/ecto/Ecto.Changeset.html#module-validations-and-constraints):

"Ecto changesets provide both validations and constraints which are ultimately turned into errors in case something goes wrong.

- Most validations can be executed without a need to interact with the database
  - Thus, always executed before attempting to insert or update an entry in the database
  - Some validations may happen against the database but they are inherently unsafe. Those validations start with an `unsafe_` prefix, such as `unsafe_validate_unique/3`
- Constraints rely on the database and are always safe
  - As a consequence, validations are always checked before constraints. Constraints won't even be checked in case validations failed"

### Inserting changesets into the database

You can `insert` a changeset into a database add OR update an entry. `insert` will return `{:ok, inserted_object`} on success and `{:error, changeset}` on failure.

**NOTE**: Changesets have a `valid?` field that returns true if the changeset satisfies all validations. However, `valid?` does NOT check constraints. For this, you must attempt an insertion and check for errors from the database.

Thus, it is best practice to try `insert`ing data and validate the returned tuple:

```elixir
case AppName.Repo.insert(changeset) do
  {:ok, user} ->
    # do something with user
  {:error, changeset} ->
    # do something with changeset
end
```

### Changeset `errors`

The `errors` field in changesets describe any validation errors.

```elixir
iex> changeset.errors
[
  last_name: {"can't be blank", [validation: :required]}
]
```

See [`traverse_errors/2`](https://hexdocs.pm/ecto/Ecto.Changeset.html#traverse_errors/2) to display these errors in a more human-friendly way.

## Queries

1. Construct a query
2. Execute query against database by passing query to the repository

### Constructing an `Ecto.Query`

Can either construct a query from the functions in `Ecto.Query`:

```elixir
Ecto.Query.first(AppName.User)
```

Or you can construct a SQL-like query in Elixir syntax:

```elixir
require Ecto.Query  # enables macros from Ecto.Query
Ecto.Query.from(p in AppName.Person, order_by: [asc: p.id, limit: 1])
```

### Executing a query

```elixir
def example() do
  AppName.User
  |> Ecto.Query.first() # constructs a query
  |> AppName.Repo.one() # executes against database
end

iex> example()
%AppName.User{
  __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
  id: 1,
  ...
}
```

### Fetching records

Just a few functions for common operations.

| Behaviour | Query construction | Query execution |
| - | - |
| All records | `AppName.User` | `AppName.Repo.all/1` |
| Single record by ID | `AppName.User` | `AppName.Repo.get/2` |
| Single record by attribute | `AppName.User` | `AppName.Repo.get_by/2` |
| Filtering results | `AppName.User |> Ecto.Query.where(attribute: "value")` | `AppName.Repo.all/1` |
