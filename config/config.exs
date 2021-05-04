# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :firebase_pool,
  ecto_repos: [FirebasePool.Repo]

# Configures the endpoint
config :firebase_pool, FirebasePoolWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2Snurk1InFfK8B79NETViPzxkHQuDbXMhshzmv5OFGdxHq3GWAnIOYS8si8rJZhY",
  render_errors: [view: FirebasePoolWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FirebasePool.PubSub,
  live_view: [signing_salt: "jI71BXvE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :fcmex,
  server_key: "AAAAcFP3GWE:APA91bEmZu4zem2_sNog0RCy3joapdYELOm0YWp91dbe0sEifIyPq-cOIRiROu5Ui2g9-mEEKnOLZjXGEt5jtd_a4E1N_TBEYuhw3C7aY4lXMespnyUTB7gaThBkDROVbhWuCoz1Vn1d"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
