import Config

if config_env() == :prod do
  secret_key_base =
    System.get_env("SECRET_KEY_BASE")

  host =
    System.get_env("HOST", "nexustech.fly.dev")

  config :techstore, Techstore.Repo,
    database: System.get_env("DATABASE_URL") || "techstore_prod.db",
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "5")

  config :techstore, TechstoreWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ],
    secret_key_base: secret_key_base,
    server: true,
    cache_static_manifest: "priv/static/cache_manifest.json",
    check_origin: ["//#{host}", "//ucfzem.github.io"]

  config :techstore, TechstoreWeb.Endpoint, live_view: [
    signing_salt: "flyio_lv_salt"
  ]

  config :techstore, :auto_migrate, true
end
