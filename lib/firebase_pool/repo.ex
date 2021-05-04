defmodule FirebasePool.Repo do
  use Ecto.Repo,
    otp_app: :firebase_pool,
    adapter: Ecto.Adapters.Postgres
end
