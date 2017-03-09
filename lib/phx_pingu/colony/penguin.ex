defmodule PhxPingu.Colony.Penguin do
  use Ecto.Schema
  
  schema "colony_penguins" do
    field :name, :string
    field :species, :string
    field :noot_noot, :string

    timestamps()
  end
end
