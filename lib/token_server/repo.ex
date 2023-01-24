defmodule TokenServer.Repo do
  use Ecto.Repo,
    otp_app: :token_server,
    adapter: Ecto.Adapters.Postgres
end
