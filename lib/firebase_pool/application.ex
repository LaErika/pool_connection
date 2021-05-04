defmodule FirebasePool.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  defp poolboy_config do
    [
      name: {:local, :worker},
      worker_module: FirebasePool.FirebaseConnection,
      size: 3,
      max_overflow: 2
    ]
  end


  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FirebasePool.Repo,
      # Start the Telemetry supervisor
      FirebasePoolWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FirebasePool.PubSub},
      # Start the Endpoint (http/https)
      FirebasePoolWeb.Endpoint,
      :poolboy.child_spec(:worker, poolboy_config())
      # Start a worker by calling: FirebasePool.Worker.start_link(arg)
      # {FirebasePool.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirebasePool.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FirebasePoolWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
