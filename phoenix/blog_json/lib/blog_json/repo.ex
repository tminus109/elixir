defmodule BlogJson.Repo do
  use Ecto.Repo,
    otp_app: :blog_json,
    adapter: Ecto.Adapters.Postgres
end
