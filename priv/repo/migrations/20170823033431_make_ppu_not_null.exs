defmodule PriceTracker.Repo.Migrations.MakePpuNotNull do
  use Ecto.Migration

  def up do
      alter table(:tracked_products) do
          modify :unit, :string, null: false, default: "unit"
          modify :date, :naive_datetime, null: false
          modify :amount, :float, null: false
          modify :price, :float, null: false
          modify :price_per_unit, :float, null: false
      end
  end

  def down do
      alter table(:tracked_products) do
          modify :unit, :string, null: true
          modify :date, :naive_datetime, null: true
          modify :amount, :float, null: true
          modify :price, :float, null: true
          modify :price_per_unit, :float, null: true
      end
  end
end
