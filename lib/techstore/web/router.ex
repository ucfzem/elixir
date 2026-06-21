defmodule TechstoreWeb.Router do
  use TechstoreWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", TechstoreWeb do
    pipe_through :browser

    live "/", ProductLive.Index, :index
    live "/products/:id", ProductLive.Show, :show
    live "/customers", CustomerLive.Index, :index
  end
end
