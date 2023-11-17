defmodule Cookbook.Schemas.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field(:name, :string)

    has_one(:chef, Cookbook.Schemas.Chef)

    has_many(:rating, {"restaurant_ratings", Cookbook.Schemas.Rating},
      foreign_key: :assoc_id,
      on_delete: :delete_all
    )

    timestamps(type: :utc_datetime)
  end

  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name])
    |> validate_required(:name)
  end
end

# fields: name
# one-to-one: chef
# polymorphic: rating
# migration: add country & city
