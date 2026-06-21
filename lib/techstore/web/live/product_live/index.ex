defmodule TechstoreWeb.ProductLive.Index do
  use TechstoreWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    categories = Techstore.Catalog.list_categories()

    socket =
      socket
      |> assign(:page_title, "NexusTech — High-Tech Store")
      |> assign(:categories, categories)
      |> assign(:selected_category, "")
      |> assign(:sort, "recent")
      |> assign(:products, list_products(%{}))

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_filters(socket, params)}
  end

  @impl true
  def handle_event("filter-category", %{"categorie" => cat}, socket) do
    opts = %{categorie: cat, sort: socket.assigns.sort}
    socket =
      socket
      |> assign(:selected_category, cat)
      |> assign(:products, list_products(opts))

    {:noreply, socket}
  end

  @impl true
  def handle_event("sort", %{"sort" => sort}, socket) do
    opts = %{categorie: socket.assigns.selected_category, sort: sort}
    socket =
      socket
      |> assign(:sort, sort)
      |> assign(:products, list_products(opts))

    {:noreply, socket}
  end

  defp apply_filters(socket, params) do
    cat = params["categorie"] || socket.assigns.selected_category
    sort = params["sort"] || socket.assigns.sort
    opts = %{categorie: cat, sort: sort}

    socket
    |> assign(:selected_category, cat)
    |> assign(:sort, sort)
    |> assign(:products, list_products(opts))
  end

  defp list_products(opts) do
    Techstore.Catalog.list_products(opts)
  end
end
