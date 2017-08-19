# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :price_tracker,
  ecto_repos: [PriceTracker.Repo]

# Configures the endpoint
config :price_tracker, PriceTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q2WkiaT4f4ZicusX+EVQWpsw6bGCX1fYMQzgEpvQw2MPK7llnpsGa35a1o5iSPLQ",
  render_errors: [view: PriceTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PriceTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
