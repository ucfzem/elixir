defmodule TechstoreWeb do
  @moduledoc false

  def controller do
    quote do
      use Phoenix.Controller,
        namespace: TechstoreWeb,
        formats: [html: :html, json: :json],
        layouts: [html: TechstoreWeb.Layouts]

      import TechstoreWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/techstore/web/templates",
        namespace: TechstoreWeb

      import Phoenix.HTML
      import TechstoreWeb.Components
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {TechstoreWeb.Layouts, :app}

      unquote(view())
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import TechstoreWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
