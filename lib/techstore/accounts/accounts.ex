defmodule Techstore.Accounts do
  @moduledoc """
  The Accounts context manages customers.
  """
  import Ecto.Query, warn: false
  alias Techstore.Repo
  alias Techstore.Accounts.Customer

  @doc """
  Returns the list of customers, most recently registered first.
  """
  def list_customers do
    Repo.all(from c in Customer, order_by: [desc: c.inserted_at])
  end

  @doc """
  Gets a single customer.
  """
  def get_customer!(id), do: Repo.get!(Customer, id)

  @doc """
  Creates a customer.
  """
  def create_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns customer count.
  """
  def count_customers do
    Repo.aggregate(Customer, :count, :id)
  end
end
