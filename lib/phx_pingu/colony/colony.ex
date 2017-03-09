defmodule PhxPingu.Colony do
  @moduledoc """
  The boundary for the Colony system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias PhxPingu.Repo

  alias PhxPingu.Colony.Penguin

  @doc """
  Returns the list of penguins.

  ## Examples

      iex> list_penguins()
      [%Penguin{}, ...]

  """
  def list_penguins do
    Repo.all(Penguin)
  end

  @doc """
  Gets a single penguin.

  Raises `Ecto.NoResultsError` if the Penguin does not exist.

  ## Examples

      iex> get_penguin!(123)
      %Penguin{}

      iex> get_penguin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_penguin!(id), do: Repo.get!(Penguin, id)

  @doc """
  Creates a penguin.

  ## Examples

      iex> create_penguin(penguin, %{field: value})
      {:ok, %Penguin{}}

      iex> create_penguin(penguin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_penguin(attrs \\ %{}) do
    %Penguin{}
    |> penguin_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a penguin.

  ## Examples

      iex> update_penguin(penguin, %{field: new_value})
      {:ok, %Penguin{}}

      iex> update_penguin(penguin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_penguin(%Penguin{} = penguin, attrs) do
    penguin
    |> penguin_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Penguin.

  ## Examples

      iex> delete_penguin(penguin)
      {:ok, %Penguin{}}

      iex> delete_penguin(penguin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_penguin(%Penguin{} = penguin) do
    Repo.delete(penguin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking penguin changes.

  ## Examples

      iex> change_penguin(penguin)
      %Ecto.Changeset{source: %Penguin{}}

  """
  def change_penguin(%Penguin{} = penguin) do
    penguin_changeset(penguin, %{})
  end

  defp penguin_changeset(%Penguin{} = penguin, attrs) do
    penguin
    |> cast(attrs, [:name, :species, :noot_noot])
    |> validate_required([:name, :species, :noot_noot])
  end
end
