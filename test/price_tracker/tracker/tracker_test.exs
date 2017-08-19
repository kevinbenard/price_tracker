defmodule PriceTracker.TrackerTest do
  use PriceTracker.DataCase

  alias PriceTracker.Tracker

  describe "products" do
    alias PriceTracker.Tracker.Product

    @valid_attrs %{category: "some category", name: "some name"}
    @update_attrs %{category: "some updated category", name: "some updated name"}
    @invalid_attrs %{category: nil, name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Tracker.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Tracker.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Tracker.create_product(@valid_attrs)
      assert product.category == "some category"
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Tracker.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.category == "some updated category"
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_product(product, @invalid_attrs)
      assert product == Tracker.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Tracker.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Tracker.change_product(product)
    end
  end

  describe "tracked_products" do
    alias PriceTracker.Tracker.TrackedProduct

    @valid_attrs %{amount: 120.5, date: ~T[14:00:00.000000], price: 120.5, product: "some product", unit: "some unit"}
    @update_attrs %{amount: 456.7, date: ~T[15:01:01.000000], price: 456.7, product: "some updated product", unit: "some updated unit"}
    @invalid_attrs %{amount: nil, date: nil, price: nil, product: nil, unit: nil}

    def tracked_product_fixture(attrs \\ %{}) do
      {:ok, tracked_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_tracked_product()

      tracked_product
    end

    test "list_tracked_products/0 returns all tracked_products" do
      tracked_product = tracked_product_fixture()
      assert Tracker.list_tracked_products() == [tracked_product]
    end

    test "get_tracked_product!/1 returns the tracked_product with given id" do
      tracked_product = tracked_product_fixture()
      assert Tracker.get_tracked_product!(tracked_product.id) == tracked_product
    end

    test "create_tracked_product/1 with valid data creates a tracked_product" do
      assert {:ok, %TrackedProduct{} = tracked_product} = Tracker.create_tracked_product(@valid_attrs)
      assert tracked_product.amount == 120.5
      assert tracked_product.date == ~T[14:00:00.000000]
      assert tracked_product.price == 120.5
      assert tracked_product.product == "some product"
      assert tracked_product.unit == "some unit"
    end

    test "create_tracked_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_tracked_product(@invalid_attrs)
    end

    test "update_tracked_product/2 with valid data updates the tracked_product" do
      tracked_product = tracked_product_fixture()
      assert {:ok, tracked_product} = Tracker.update_tracked_product(tracked_product, @update_attrs)
      assert %TrackedProduct{} = tracked_product
      assert tracked_product.amount == 456.7
      assert tracked_product.date == ~T[15:01:01.000000]
      assert tracked_product.price == 456.7
      assert tracked_product.product == "some updated product"
      assert tracked_product.unit == "some updated unit"
    end

    test "update_tracked_product/2 with invalid data returns error changeset" do
      tracked_product = tracked_product_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_tracked_product(tracked_product, @invalid_attrs)
      assert tracked_product == Tracker.get_tracked_product!(tracked_product.id)
    end

    test "delete_tracked_product/1 deletes the tracked_product" do
      tracked_product = tracked_product_fixture()
      assert {:ok, %TrackedProduct{}} = Tracker.delete_tracked_product(tracked_product)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_tracked_product!(tracked_product.id) end
    end

    test "change_tracked_product/1 returns a tracked_product changeset" do
      tracked_product = tracked_product_fixture()
      assert %Ecto.Changeset{} = Tracker.change_tracked_product(tracked_product)
    end
  end

  describe "tracked_products" do
    alias PriceTracker.Tracker.TrackedProduct

    @valid_attrs %{amount: 120.5, date: ~N[2010-04-17 14:00:00.000000], price: 120.5, product: "some product", unit: "some unit"}
    @update_attrs %{amount: 456.7, date: ~N[2011-05-18 15:01:01.000000], price: 456.7, product: "some updated product", unit: "some updated unit"}
    @invalid_attrs %{amount: nil, date: nil, price: nil, product: nil, unit: nil}

    def tracked_product_fixture(attrs \\ %{}) do
      {:ok, tracked_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_tracked_product()

      tracked_product
    end

    test "list_tracked_products/0 returns all tracked_products" do
      tracked_product = tracked_product_fixture()
      assert Tracker.list_tracked_products() == [tracked_product]
    end

    test "get_tracked_product!/1 returns the tracked_product with given id" do
      tracked_product = tracked_product_fixture()
      assert Tracker.get_tracked_product!(tracked_product.id) == tracked_product
    end

    test "create_tracked_product/1 with valid data creates a tracked_product" do
      assert {:ok, %TrackedProduct{} = tracked_product} = Tracker.create_tracked_product(@valid_attrs)
      assert tracked_product.amount == 120.5
      assert tracked_product.date == ~N[2010-04-17 14:00:00.000000]
      assert tracked_product.price == 120.5
      assert tracked_product.product == "some product"
      assert tracked_product.unit == "some unit"
    end

    test "create_tracked_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_tracked_product(@invalid_attrs)
    end

    test "update_tracked_product/2 with valid data updates the tracked_product" do
      tracked_product = tracked_product_fixture()
      assert {:ok, tracked_product} = Tracker.update_tracked_product(tracked_product, @update_attrs)
      assert %TrackedProduct{} = tracked_product
      assert tracked_product.amount == 456.7
      assert tracked_product.date == ~N[2011-05-18 15:01:01.000000]
      assert tracked_product.price == 456.7
      assert tracked_product.product == "some updated product"
      assert tracked_product.unit == "some updated unit"
    end

    test "update_tracked_product/2 with invalid data returns error changeset" do
      tracked_product = tracked_product_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_tracked_product(tracked_product, @invalid_attrs)
      assert tracked_product == Tracker.get_tracked_product!(tracked_product.id)
    end

    test "delete_tracked_product/1 deletes the tracked_product" do
      tracked_product = tracked_product_fixture()
      assert {:ok, %TrackedProduct{}} = Tracker.delete_tracked_product(tracked_product)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_tracked_product!(tracked_product.id) end
    end

    test "change_tracked_product/1 returns a tracked_product changeset" do
      tracked_product = tracked_product_fixture()
      assert %Ecto.Changeset{} = Tracker.change_tracked_product(tracked_product)
    end
  end
end
