defmodule FirstApp.Repo do
  use Ecto.Repo,
    otp_app: :first_app,
    adapter: Ecto.Adapters.Postgres
end
