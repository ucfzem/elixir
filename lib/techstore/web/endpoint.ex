defmodule TechstoreWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :techstore

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [:user_agent, :peer_data]],
    longpoll: [connect_info: [:user_agent, :peer_data]]

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Static,
    at: "/",
    from: :techstore,
    only: ~w(images css fonts js favicon.ico robots.txt assets)

  plug Plug.Session, store: :cookie, key: "_techstore_key", signing_salt: "techstore_salt"

  plug TechstoreWeb.Router
end
