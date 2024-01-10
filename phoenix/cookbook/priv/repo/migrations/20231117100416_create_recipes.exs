defmodule Cookbook.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add(:name, :string)

      timestamps(type: :utc_datetime)
    end
  end
end
