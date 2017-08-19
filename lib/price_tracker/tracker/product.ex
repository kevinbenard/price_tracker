defmodule PriceTracker.Tracker.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias PriceTracker.Tracker.Product


  schema "products" do
    field :category, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :category])
    |> validate_required([:name, :category])
  end
end
