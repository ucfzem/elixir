defmodule Techstore.MixProject do
  use Mix.Project

  def project do
    [
      app: :techstore,
      version: "1.0.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Techstore.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:dev), do: ["lib"]
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.7.14"},
      {:phoenix_view, "~> 2.0"},
      {:phoenix_ecto, "~> 4.5"},
      {:ecto_sql, "~> 3.11"},
      {:ecto_sqlite3, "~> 0.18"},
      {:phoenix_live_view, "~> 1.0.0"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_reload, "~> 1.5", only: :dev},
      {:heroicons, "~> 0.5"},
      {:jason, "~> 1.4"},
      {:plug_cowboy, "~> 2.7"},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:gettext, "~> 0.26"}
    ]
  end

  def releases do
    [
      techstore: [
        include_executables_for: [:unix],
        steps: [:assemble, :tar],
        config_providers: [
          {Config.Provider, [{:system, :all, "/app/releases/*/runtime.exs"}]}
        ]
      ]
    ]
  end
end
