defmodule Phoenix.Repo do
  use Ecto.Repo,
    otp_app: :phoenix,
    adapter: Ecto.Adapters.Postgres
end
