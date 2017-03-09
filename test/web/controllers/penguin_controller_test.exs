defmodule PhxPingu.Web.PenguinControllerTest do
  use PhxPingu.Web.ConnCase

  alias PhxPingu.Colony

  @create_attrs %{name: "some name", noot_noot: "some noot_noot", species: "some species"}
  @update_attrs %{name: "some updated name", noot_noot: "some updated noot_noot", species: "some updated species"}
  @invalid_attrs %{name: nil, noot_noot: nil, species: nil}

  def fixture(:penguin) do
    {:ok, penguin} = Colony.create_penguin(@create_attrs)
    penguin
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, penguin_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Penguins"
  end

  test "renders form for new penguins", %{conn: conn} do
    conn = get conn, penguin_path(conn, :new)
    assert html_response(conn, 200) =~ "New Penguin"
  end

  test "creates penguin and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, penguin_path(conn, :create), penguin: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == penguin_path(conn, :show, id)

    conn = get conn, penguin_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Penguin"
  end

  test "does not create penguin and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, penguin_path(conn, :create), penguin: @invalid_attrs
    assert html_response(conn, 200) =~ "New Penguin"
  end

  test "renders form for editing chosen penguin", %{conn: conn} do
    penguin = fixture(:penguin)
    conn = get conn, penguin_path(conn, :edit, penguin)
    assert html_response(conn, 200) =~ "Edit Penguin"
  end

  test "updates chosen penguin and redirects when data is valid", %{conn: conn} do
    penguin = fixture(:penguin)
    conn = put conn, penguin_path(conn, :update, penguin), penguin: @update_attrs
    assert redirected_to(conn) == penguin_path(conn, :show, penguin)

    conn = get conn, penguin_path(conn, :show, penguin)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen penguin and renders errors when data is invalid", %{conn: conn} do
    penguin = fixture(:penguin)
    conn = put conn, penguin_path(conn, :update, penguin), penguin: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Penguin"
  end

  test "deletes chosen penguin", %{conn: conn} do
    penguin = fixture(:penguin)
    conn = delete conn, penguin_path(conn, :delete, penguin)
    assert redirected_to(conn) == penguin_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, penguin_path(conn, :show, penguin)
    end
  end
end
