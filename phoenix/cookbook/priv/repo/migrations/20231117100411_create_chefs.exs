defmodule Cookbook.Repo.Migrations.CreateChefs do
  use Ecto.Migration

  def change do
    create table(:chefs) do
      add(:name, :string)
      add(:email, :string)

      timestamps(type: :utc_datetime)
    end
  end
end
