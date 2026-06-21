defmodule Techstore.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :nom, :string, null: false
      add :description, :text
      add :prix, :decimal, precision: 10, scale: 2, null: false
      add :image_url, :string
      add :stock, :integer, default: 0
      add :categorie, :string, null: false

      timestamps()
    end

    create index(:products, [:categorie])
    create index(:products, [:inserted_at])
  end
end
