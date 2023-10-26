defmodule BlogJson.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlogJsonWeb.Telemetry,
      BlogJson.Repo,
      {DNSCluster, query: Application.get_env(:blog_json, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BlogJson.PubSub},
      # Start a worker by calling: BlogJson.Worker.start_link(arg)
      # {BlogJson.Worker, arg},
      # Start to serve requests, typically the last entry
      BlogJsonWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlogJson.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlogJsonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
