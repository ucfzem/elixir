defmodule Techstore.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :nom, :string, null: false
      add :email, :string, null: false
      add :adresse, :text

      timestamps()
    end

    create unique_index(:customers, [:email])
  end
end
