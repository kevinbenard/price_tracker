defmodule PriceTracker.Tracker.TrackedProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias PriceTracker.Tracker.TrackedProduct


  schema "tracked_products" do
    field :amount, :float
    field :date, :naive_datetime
    field :price, :float
    field :product, :string
    field :unit, :string

    timestamps()
  end

  @doc false
  def changeset(%TrackedProduct{} = tracked_product, attrs) do
    tracked_product
    |> cast(attrs, [:product, :date, :amount, :unit, :price])
    |> validate_required([:product, :date, :amount, :unit, :price])
  end
end
