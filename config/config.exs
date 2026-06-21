import Config

config :techstore,
  ecto_repos: [Techstore.Repo]

config :techstore, Techstore.Repo,
  database: "techstore_dev.db",
  pool_size: 5

config :techstore, TechstoreWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [formats: [html: TechstoreWeb.ErrorHTML], layout: false],
  pubsub_server: Techstore.PubSub,
  live_view: [signing_salt: "techstore_salt"]

config :phoenix, :json_library, Jason

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :generators, migration: true, binary_id: false

config :tailwind,
  version: "3.4.0",
  default: [
    args: ~w(
      --config=assets/tailwind.config.js
      --input=assets/css/app.css
      --output=priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :esbuild,
  version: "0.23.0",
  default: [
    args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__)
  ]

import_config "#{Mix.env()}.exs"
