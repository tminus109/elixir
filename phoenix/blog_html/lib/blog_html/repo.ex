defmodule BlogHtml.Repo do
  use Ecto.Repo,
    otp_app: :blog_html,
    adapter: Ecto.Adapters.Postgres
end
