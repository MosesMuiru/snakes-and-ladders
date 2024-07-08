defmodule Snl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SnlWeb.Telemetry,
      # Start the Ecto repository
      Snl.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Snl.PubSub},
      # Start Finch
      {Finch, name: Snl.Finch},
      # Start the Endpoint (http/https)
      SnlWeb.Endpoint,
      # Start a worker by calling: Snl.Worker.start_link(arg)
      # {Snl.Worker, arg}
      # pubsub config
      {Phoenix.PubSub, name: Snl.PubSub}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Snl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SnlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
