defmodule Cookbook.Schemas.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "recipes" do
    field(:name, :string)

    belongs_to(:chef, Cookbook.Schemas.Chef)
    many_to_many(:ingredient, Cookbook.Schemas.Ingredient, join_through: "recipes_ingredients")

    has_many(:rating, {"recipe_ratings", Cookbook.Schemas.Rating},
      foreign_key: :assoc_id,
      on_delete: :delete_all
    )

    timestamps(type: :utc_datetime)
  end

  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name])
    |> validate_required(:name)
  end
end

# fields: name
# one-to-many: chef
# many-to-many: ingredient
# polymorphic: rating
# migration: add cooking_time_min, add constraint name not null
