import Config

config :techstore, Techstore.Repo,
  database: "techstore_dev.db",
  pool_size: 5,
  show_sensitive_data_on_connection_error: true

config :techstore, TechstoreWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4001],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "TGVfcm9jaGVyIGVzdCB1bmUgY2hhaW5lIGRlIDY0IG9jdGV0cyBwb3VyIGxlIGNvb2tpZSBzdG9yZSBlbiBQaG9lbml4Lw==",
  watchers: [
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]},
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

config :phoenix, :plug_init_mode, :runtime
