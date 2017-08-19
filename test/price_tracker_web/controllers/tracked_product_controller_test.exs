defmodule PriceTrackerWeb.TrackedProductControllerTest do
  use PriceTrackerWeb.ConnCase

  alias PriceTracker.Tracker

  @create_attrs %{amount: 120.5, date: ~N[2010-04-17 14:00:00.000000], price: 120.5, product: "some product", unit: "some unit"}
  @update_attrs %{amount: 456.7, date: ~N[2011-05-18 15:01:01.000000], price: 456.7, product: "some updated product", unit: "some updated unit"}
  @invalid_attrs %{amount: nil, date: nil, price: nil, product: nil, unit: nil}

  def fixture(:tracked_product) do
    {:ok, tracked_product} = Tracker.create_tracked_product(@create_attrs)
    tracked_product
  end

  describe "index" do
    test "lists all tracked_products", %{conn: conn} do
      conn = get conn, tracked_product_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tracked products"
    end
  end

  describe "new tracked_product" do
    test "renders form", %{conn: conn} do
      conn = get conn, tracked_product_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tracked product"
    end
  end

  describe "create tracked_product" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tracked_product_path(conn, :create), tracked_product: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tracked_product_path(conn, :show, id)

      conn = get conn, tracked_product_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tracked product"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tracked_product_path(conn, :create), tracked_product: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tracked product"
    end
  end

  describe "edit tracked_product" do
    setup [:create_tracked_product]

    test "renders form for editing chosen tracked_product", %{conn: conn, tracked_product: tracked_product} do
      conn = get conn, tracked_product_path(conn, :edit, tracked_product)
      assert html_response(conn, 200) =~ "Edit Tracked product"
    end
  end

  describe "update tracked_product" do
    setup [:create_tracked_product]

    test "redirects when data is valid", %{conn: conn, tracked_product: tracked_product} do
      conn = put conn, tracked_product_path(conn, :update, tracked_product), tracked_product: @update_attrs
      assert redirected_to(conn) == tracked_product_path(conn, :show, tracked_product)

      conn = get conn, tracked_product_path(conn, :show, tracked_product)
      assert html_response(conn, 200) =~ "some updated product"
    end

    test "renders errors when data is invalid", %{conn: conn, tracked_product: tracked_product} do
      conn = put conn, tracked_product_path(conn, :update, tracked_product), tracked_product: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tracked product"
    end
  end

  describe "delete tracked_product" do
    setup [:create_tracked_product]

    test "deletes chosen tracked_product", %{conn: conn, tracked_product: tracked_product} do
      conn = delete conn, tracked_product_path(conn, :delete, tracked_product)
      assert redirected_to(conn) == tracked_product_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tracked_product_path(conn, :show, tracked_product)
      end
    end
  end

  defp create_tracked_product(_) do
    tracked_product = fixture(:tracked_product)
    {:ok, tracked_product: tracked_product}
  end
end
