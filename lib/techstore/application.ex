defmodule Techstore.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Techstore.Repo,
      TechstoreWeb.Endpoint,
      {Phoenix.PubSub, name: Techstore.PubSub}
    ]

    opts = [strategy: :one_for_one, name: Techstore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    TechstoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
