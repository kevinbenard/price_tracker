defmodule PriceTracker.Tracker.TrackedProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias PriceTracker.Tracker.TrackedProduct


  # TODO: Add location purchased
  schema "tracked_products" do
    field :amount, :float
    field :date, :naive_datetime
    field :price, :float
    field :product, :string
    field :unit, :string
    field :price_per_unit, :float

    timestamps()
  end

  @doc false
  def changeset(%TrackedProduct{} = tracked_product, attrs) do
    tracked_product
    |> cast(attrs, [:product, :date, :amount, :unit, :price])
    |> validate_required([:product, :date, :amount, :unit, :price])
    |> validate_number(:amount, greater_than: 0.0, message: "You can't purchase zero things.")
    |> validate_length(:unit, min: 1)
    |> validate_length(:product, min: 1)
    |> calculate_price_per_unit
  end

  defp calculate_price_per_unit(changeset) do
      amount = get_field(changeset, :amount)
      price = get_field(changeset, :price)

      if (amount || price) && amount > 0.0 do
          price_per_unit = price / amount

          changeset
          |> put_change(:price_per_unit, price_per_unit)
      else
          changeset
      end
  end
end
