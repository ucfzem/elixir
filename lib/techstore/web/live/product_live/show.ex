defmodule TechstoreWeb.ProductLive.Show do
  use TechstoreWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket, temporary_assigns: []}
  end

  @impl true
  def handle_params(%{"id" => id}, _url, socket) do
    product = Techstore.Catalog.get_product!(id)

    socket =
      socket
      |> assign(:page_title, product.nom <> " — NexusTech")
      |> assign(:product, product)
      |> assign(:added_to_cart, false)

    {:noreply, socket}
  end

  @impl true
  def handle_event("add-to-cart", _, socket) do
    {:noreply, assign(socket, :added_to_cart, true)}
  end
end
