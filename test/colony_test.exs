defmodule PhxPingu.ColonyTest do
  use PhxPingu.DataCase

  alias PhxPingu.Colony
  alias PhxPingu.Colony.Penguin

  @create_attrs %{name: "some name", noot_noot: "some noot_noot", species: "some species"}
  @update_attrs %{name: "some updated name", noot_noot: "some updated noot_noot", species: "some updated species"}
  @invalid_attrs %{name: nil, noot_noot: nil, species: nil}

  def fixture(:penguin, attrs \\ @create_attrs) do
    {:ok, penguin} = Colony.create_penguin(attrs)
    penguin
  end

  test "list_penguins/1 returns all penguins" do
    penguin = fixture(:penguin)
    assert Colony.list_penguins() == [penguin]
  end

  test "get_penguin! returns the penguin with given id" do
    penguin = fixture(:penguin)
    assert Colony.get_penguin!(penguin.id) == penguin
  end

  test "create_penguin/1 with valid data creates a penguin" do
    assert {:ok, %Penguin{} = penguin} = Colony.create_penguin(@create_attrs)
    
    assert penguin.name == "some name"
    assert penguin.noot_noot == "some noot_noot"
    assert penguin.species == "some species"
  end

  test "create_penguin/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Colony.create_penguin(@invalid_attrs)
  end

  test "update_penguin/2 with valid data updates the penguin" do
    penguin = fixture(:penguin)
    assert {:ok, penguin} = Colony.update_penguin(penguin, @update_attrs)
    assert %Penguin{} = penguin
    
    assert penguin.name == "some updated name"
    assert penguin.noot_noot == "some updated noot_noot"
    assert penguin.species == "some updated species"
  end

  test "update_penguin/2 with invalid data returns error changeset" do
    penguin = fixture(:penguin)
    assert {:error, %Ecto.Changeset{}} = Colony.update_penguin(penguin, @invalid_attrs)
    assert penguin == Colony.get_penguin!(penguin.id)
  end

  test "delete_penguin/1 deletes the penguin" do
    penguin = fixture(:penguin)
    assert {:ok, %Penguin{}} = Colony.delete_penguin(penguin)
    assert_raise Ecto.NoResultsError, fn -> Colony.get_penguin!(penguin.id) end
  end

  test "change_penguin/1 returns a penguin changeset" do
    penguin = fixture(:penguin)
    assert %Ecto.Changeset{} = Colony.change_penguin(penguin)
  end
end
