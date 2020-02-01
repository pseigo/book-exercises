---
title: "Episode 03: Installing Phoenix"
subtitle: "Learn Phoenix ([https://www.learnphoenix.tv/](https://www.learnphoenix.tv/))"
author: [Peyton Seigo]
date: "2020-01-18"

titlepage: true
---

# Episode 03: Installing Phoenix

## Notes

- See [the docs](https://hexdocs.pm/phoenix/installation.html#content) for up to date installation instructions
- Make a new project with `mix phx.new project_name`
  - Can make without Webpack with `--no-webpack`
  - Can make without Ecto with `--no-ecto`

Here were the hints I got after making a project on Phoenix v1.4.11:

```
We are almost there! The following steps are missing:

    $ cd first_app
    $ cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server

```

## Troubleshooting webpack install problems

When trying to run

```
cd assets/ && npm install && node node_modules/webpack/bin/webpack.js --mode development
```

I received this error from `npm`:

```
npm ERR! code ENOTSUP
npm ERR! syscall symlink
npm ERR! path ../../deps/phoenix
npm ERR! dest /mnt/hgfs/codebase/book-exercises/learn-phoenix/code/e04-plug/first_app/assets/node_modules/phoenix
npm ERR! errno -95
npm ERR! nospc ENOTSUP: operation not supported on socket, symlink '../../deps/phoenix' -> '/mnt/hgfs/codebase/book-exercises/learn-phoenix/code/e04-plug/first_app/assets/node_modules/phoenix'
npm ERR! nospc There appears to be insufficient space on your system to finish.
npm ERR! nospc Clear up some disk space and try again.

```

First I tried clearing the cache with `npm cache clear --force`, but that didn't work.

Then I tried `npm install --no-bin-links` with and without `--no-link` but no luck. 

I assumed at this point it was a VM issue. In vmware, you have to add `sharedFolder0.followSymlinks = "TRUE"` to the VM's `.vmx` file after each of the `sharedFolderX` entries. See https://kb.vmware.com/s/article/2045026. 

But alas, this did not fix it either. I just decided to make my projects without webpack. Maybe I'll try it later!


## Troubleshooting `mix ecto.create`

Then I had problems with creating the ecto database. I received the error:

```
mix ecto.create
Compiling 13 files (.ex)
Generated first_app app

14:45:10.382 [error] GenServer #PID<0.329.0> terminating
** (Postgrex.Error) FATAL 28P01 (invalid_password) password authentication failed for user "postgres"
    (db_connection) lib/db_connection/connection.ex:87: DBConnection.Connection.connect/2
    (connection) lib/connection.ex:622: Connection.enter_connect/5
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: nil
State: Postgrex.Protocol
** (Mix) The database for FirstApp.Repo couldn't be created: killed
```

Keep in mind this was after a fresh install of postgresql so I had not done any config at this point. Looking at `config/dev.exs` in the app folder, the default configuration for the database is

```elixir
# Configure your database
config :first_app, FirstApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "first_app_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

```

I was able to fix my issues by changing the postgres password to `postgres`.

```
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
sudo service postgresql restart
```

Kudos to [this blog post](https://juwondaniel.wordpress.com/2016/09/23/solve-mix-ecto-create-postgresql-password-issue-with-phoenix/)!

Also note that we have `pgadmin3` installed for GUI access to postgres settings.
