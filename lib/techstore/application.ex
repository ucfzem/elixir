defmodule Techstore.Application do
  use Application

  @impl true
  def start(_type, _args) do
    if Application.get_env(:techstore, :auto_migrate, false) do
      migrate()
    end

    children = [
      Techstore.Repo,
      {Phoenix.PubSub, name: Techstore.PubSub},
      TechstoreWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Techstore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    TechstoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp migrate do
    Application.ensure_all_started(:ssl)
    Application.ensure_all_started(:postgrex)
    Application.ensure_all_started(:ecto)

    path = Application.app_dir(:techstore, "priv/repo/migrations")
    if File.exists?(path) do
      Ecto.Migrator.run(Techstore.Repo, path, :up, all: true)
    end
  end
end
