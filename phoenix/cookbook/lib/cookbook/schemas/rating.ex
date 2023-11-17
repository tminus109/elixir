defmodule Cookbook.Schemas.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rating" do
    field(:rating, :integer)
    field(:assoc_id, :integer)

    timestamps(type: :utc_datetime)
  end

  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:assoc_id, :rating])
    |> validate_required([:rating])
    |> validate_inclusion(:rating, 1..5)
  end
end

# fields: rating
# polymorphic: restaurant/recipe
