defmodule BlogJson.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add(:content, :string)
      add(:post_id, references(:posts))

      timestamps(type: :utc_datetime)
    end
  end
end
