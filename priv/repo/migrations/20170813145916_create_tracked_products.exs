defmodule PriceTracker.Repo.Migrations.CreateTrackedProducts do
  use Ecto.Migration

  def change do
    create table(:tracked_products) do
      add :product, :string
      add :date, :naive_datetime
      add :amount, :float
      add :unit, :string
      add :price, :float

      timestamps()
    end

  end
end
