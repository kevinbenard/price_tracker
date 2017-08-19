defmodule PriceTracker.Tracker do
  @moduledoc """
  The Tracker context.
  """

  import Ecto.Query, warn: false
  alias PriceTracker.Repo

  alias PriceTracker.Tracker.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{source: %Product{}}

  """
  def change_product(%Product{} = product) do
    Product.changeset(product, %{})
  end

  alias PriceTracker.Tracker.TrackedProduct

  @doc """
  Returns the list of tracked_products.

  ## Examples

      iex> list_tracked_products()
      [%TrackedProduct{}, ...]

  """
  def list_tracked_products do
    Repo.all(TrackedProduct)
  end

  @doc """
  Gets a single tracked_product.

  Raises `Ecto.NoResultsError` if the Tracked product does not exist.

  ## Examples

      iex> get_tracked_product!(123)
      %TrackedProduct{}

      iex> get_tracked_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tracked_product!(id), do: Repo.get!(TrackedProduct, id)

  @doc """
  Creates a tracked_product.

  ## Examples

      iex> create_tracked_product(%{field: value})
      {:ok, %TrackedProduct{}}

      iex> create_tracked_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tracked_product(attrs \\ %{}) do
    %TrackedProduct{}
    |> TrackedProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tracked_product.

  ## Examples

      iex> update_tracked_product(tracked_product, %{field: new_value})
      {:ok, %TrackedProduct{}}

      iex> update_tracked_product(tracked_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tracked_product(%TrackedProduct{} = tracked_product, attrs) do
    tracked_product
    |> TrackedProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TrackedProduct.

  ## Examples

      iex> delete_tracked_product(tracked_product)
      {:ok, %TrackedProduct{}}

      iex> delete_tracked_product(tracked_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tracked_product(%TrackedProduct{} = tracked_product) do
    Repo.delete(tracked_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tracked_product changes.

  ## Examples

      iex> change_tracked_product(tracked_product)
      %Ecto.Changeset{source: %TrackedProduct{}}

  """
  def change_tracked_product(%TrackedProduct{} = tracked_product) do
    TrackedProduct.changeset(tracked_product, %{})
  end
end
