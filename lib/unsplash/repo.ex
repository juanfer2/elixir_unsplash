defmodule Unsplash.Repo do
  use Ecto.Repo,
    otp_app: :unsplash,
    adapter: Ecto.Adapters.Postgres
end
