defmodule Techstore.Repo do
  use Ecto.Repo,
    otp_app: :techstore,
    adapter: Ecto.Adapters.Postgres
end
