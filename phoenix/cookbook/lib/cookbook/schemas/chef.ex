defmodule Cookbook.Schemas.Chef do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chefs" do
    field(:full_name, :string)
    field(:email, :string)

    belongs_to(:restaurant, Cookbook.Schemas.Restaurant)
    has_many(:recipe, Cookbook.Schemas.Recipe)

    timestamps(type: :utc_datetime)
  end

  def changeset(chef, attrs) do
    chef
    |> cast(attrs, [:full_name, :email])
    |> validate_required(:full_name, :email)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end

# fields: full name, email
# one-to-one: restaurant
# one-to-many: recipe
# migration: add first name & last name, delete full name
