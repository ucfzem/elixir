import Config

config :techstore, Techstore.Repo,
  database: "techstore_prod",
  username: System.get_env("DB_USERNAME") || "postgres",
  password: System.get_env("DB_PASSWORD") || "postgres",
  hostname: System.get_env("DB_HOST") || "localhost",
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :techstore, TechstoreWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: ["//#{System.get_env("HOST") || "localhost"}"]
