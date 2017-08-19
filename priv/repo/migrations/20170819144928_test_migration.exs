defmodule PriceTracker.Repo.Migrations.TestMigration do
  use Ecto.Migration

  def change do
      alter table(:tracked_products) do
          add :price_per_unit, :float
      end
  end
end
