defmodule Techstore.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :nom, :string
    field :description, :string
    field :prix, :decimal
    field :image_url, :string
    field :stock, :integer
    field :categorie, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:nom, :description, :prix, :image_url, :stock, :categorie])
    |> validate_required([:nom, :prix, :categorie])
    |> validate_number(:prix, greater_than: 0)
    |> validate_number(:stock, greater_than_or_equal_to: 0)
  end
end
