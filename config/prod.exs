import Config

config :techstore, Techstore.Repo,
  database: System.get_env("DATABASE_URL") || "techstore_prod.db",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "5")

config :techstore, TechstoreWeb.Endpoint,
  http: [
    ip: {0, 0, 0, 0},
    port: String.to_integer(System.get_env("PORT") || "4000")
  ],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  url: [
    host: System.get_env("HOST") || "nexustech.fly.dev",
    port: 443,
    scheme: "https"
  ],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: [
    "//#{System.get_env("HOST") || "nexustech.fly.dev"}",
    "//ucfzem.github.io"
  ]

config :techstore, TechstoreWeb.Endpoint, live_view: [
  signing_salt: System.get_env("SECRET_KEY_BASE") |> String.slice(0, 8)
]
