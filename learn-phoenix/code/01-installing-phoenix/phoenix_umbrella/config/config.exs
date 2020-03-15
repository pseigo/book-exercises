# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :phoenix,
  ecto_repos: [Phoenix.Repo]

config :phoenix_web,
  ecto_repos: [Phoenix.Repo],
  generators: [context_app: :phoenix]

# Configures the endpoint
config :phoenix_web, PhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WdjUC3LeWf4LcTXuxhV0RqUmlLIqlLLWCNwMRGJ897tn2BC9dS87/DimBblUrGC3",
  render_errors: [view: PhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
