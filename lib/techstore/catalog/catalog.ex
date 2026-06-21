defmodule Techstore.Catalog do
  @moduledoc """
  The Catalog context manages products.
  """
  import Ecto.Query, warn: false
  alias Techstore.Repo
  alias Techstore.Catalog.Product

  @doc """
  Returns the list of products, optionally filtered by category and sorted.
  """
  def list_products(opts \\ []) do
    query = from p in Product, order_by: [desc: p.inserted_at]

    query
    |> maybe_filter_category(opts[:categorie])
    |> maybe_sort(opts[:sort])
    |> Repo.all()
  end

  defp maybe_filter_category(query, nil), do: query
  defp maybe_filter_category(query, ""), do: query
  defp maybe_filter_category(query, cat) do
    from(p in query, where: p.categorie == ^cat)
  end

  defp maybe_sort(query, nil), do: query
  defp maybe_sort(query, "prix_asc"), do: from(p in query, order_by: [asc: p.prix])
  defp maybe_sort(query, "prix_desc"), do: from(p in query, order_by: [desc: p.prix])
  defp maybe_sort(query, "recent"), do: from(p in query, order_by: [desc: p.inserted_at])
  defp maybe_sort(query, _), do: query

  @doc """
  Gets a single product.
  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.
  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns distinct categories.
  """
  def list_categories do
    Repo.all(from p in Product, select: p.categorie, distinct: true, order_by: p.categorie)
  end

  @doc """
  Returns products count.
  """
  def count_products do
    Repo.aggregate(Product, :count, :id)
  end
end
