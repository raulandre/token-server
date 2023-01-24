defmodule TokenServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TokenServer.Repo,
      # Start the Telemetry supervisor
      TokenServerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TokenServer.PubSub},
      # Start the Endpoint (http/https)
      TokenServerWeb.Endpoint
      # Start a worker by calling: TokenServer.Worker.start_link(arg)
      # {TokenServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TokenServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TokenServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
