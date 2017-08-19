defmodule PriceTrackerWeb.TrackedProductController do
  use PriceTrackerWeb, :controller

  alias PriceTracker.Tracker
  alias PriceTracker.Tracker.TrackedProduct

  def index(conn, _params) do
    tracked_products = Tracker.list_tracked_products()
    render(conn, "index.html", tracked_products: tracked_products)
  end

  def new(conn, _params) do
    changeset = Tracker.change_tracked_product(%TrackedProduct{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tracked_product" => tracked_product_params}) do
    case Tracker.create_tracked_product(tracked_product_params) do
      {:ok, tracked_product} ->
        conn
        |> put_flash(:info, "Tracked product created successfully.")
        |> redirect(to: tracked_product_path(conn, :show, tracked_product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tracked_product = Tracker.get_tracked_product!(id)
    render(conn, "show.html", tracked_product: tracked_product)
  end

  def edit(conn, %{"id" => id}) do
    tracked_product = Tracker.get_tracked_product!(id)
    changeset = Tracker.change_tracked_product(tracked_product)
    render(conn, "edit.html", tracked_product: tracked_product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tracked_product" => tracked_product_params}) do
    tracked_product = Tracker.get_tracked_product!(id)

    case Tracker.update_tracked_product(tracked_product, tracked_product_params) do
      {:ok, tracked_product} ->
        conn
        |> put_flash(:info, "Tracked product updated successfully.")
        |> redirect(to: tracked_product_path(conn, :show, tracked_product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tracked_product: tracked_product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tracked_product = Tracker.get_tracked_product!(id)
    {:ok, _tracked_product} = Tracker.delete_tracked_product(tracked_product)

    conn
    |> put_flash(:info, "Tracked product deleted successfully.")
    |> redirect(to: tracked_product_path(conn, :index))
  end
end
