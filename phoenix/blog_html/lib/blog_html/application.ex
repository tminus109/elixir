defmodule BlogHtml.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlogHtmlWeb.Telemetry,
      BlogHtml.Repo,
      {DNSCluster, query: Application.get_env(:blog_html, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BlogHtml.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BlogHtml.Finch},
      # Start a worker by calling: BlogHtml.Worker.start_link(arg)
      # {BlogHtml.Worker, arg},
      # Start to serve requests, typically the last entry
      BlogHtmlWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlogHtml.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlogHtmlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
