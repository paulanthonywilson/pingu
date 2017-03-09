defmodule PhxPingu.Repo.Migrations.CreatePhxPingu.Colony.Penguin do
  use Ecto.Migration

  def change do
    create table(:colony_penguins) do
      add :name, :string
      add :species, :string
      add :noot_noot, :string

      timestamps()
    end

  end
end
