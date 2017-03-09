defmodule PhxPingu.Web.PenguinController do
  use PhxPingu.Web, :controller

  alias PhxPingu.Colony

  def index(conn, _params) do
    penguins = Colony.list_penguins()
    render(conn, "index.html", penguins: penguins)
  end

  def new(conn, _params) do
    changeset = Colony.change_penguin(%PhxPingu.Colony.Penguin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"penguin" => penguin_params}) do
    case Colony.create_penguin(penguin_params) do
      {:ok, penguin} ->
        conn
        |> put_flash(:info, "Penguin created successfully.")
        |> redirect(to: penguin_path(conn, :show, penguin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    penguin = Colony.get_penguin!(id)
    render(conn, "show.html", penguin: penguin)
  end

  def edit(conn, %{"id" => id}) do
    penguin = Colony.get_penguin!(id)
    changeset = Colony.change_penguin(penguin)
    render(conn, "edit.html", penguin: penguin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "penguin" => penguin_params}) do
    penguin = Colony.get_penguin!(id)

    case Colony.update_penguin(penguin, penguin_params) do
      {:ok, penguin} ->
        conn
        |> put_flash(:info, "Penguin updated successfully.")
        |> redirect(to: penguin_path(conn, :show, penguin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", penguin: penguin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    penguin = Colony.get_penguin!(id)
    {:ok, _penguin} = Colony.delete_penguin(penguin)

    conn
    |> put_flash(:info, "Penguin deleted successfully.")
    |> redirect(to: penguin_path(conn, :index))
  end
end
