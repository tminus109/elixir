defmodule Cookbook.Schemas.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ingredients" do
    field(:name, :string)

    many_to_many(:recipe, Cookbook.Schemas.Recipe, join_through: "recipes_ingredients")

    timestamps(type: :utc_datetime)
  end

  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name])
    |> validate_required(:name)
  end
end

# fields: name
# many-to-many: recipe
