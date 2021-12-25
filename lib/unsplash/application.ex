defmodule Unsplash.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Unsplash.Repo,
      # Start the Telemetry supervisor
      UnsplashWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Unsplash.PubSub},
      # Start the Endpoint (http/https)
      UnsplashWeb.Endpoint
      # Start a worker by calling: Unsplash.Worker.start_link(arg)
      # {Unsplash.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Unsplash.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UnsplashWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
