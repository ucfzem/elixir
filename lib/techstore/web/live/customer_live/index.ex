defmodule TechstoreWeb.CustomerLive.Index do
  use TechstoreWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    customers = Techstore.Accounts.list_customers()
    count = length(customers)

    socket =
      socket
      |> assign(:page_title, "Clients — NexusTech")
      |> assign(:customers, customers)
      |> assign(:customer_count, count)

    {:ok, socket}
  end
end
