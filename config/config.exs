# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :http_connection_pool,
  namespace: HTP

# Configures the endpoint
config :http_connection_pool, HTPWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ljtWyMQWcs3lB2Avq4m+L05Fr+mahIBX6ZS1pOmux9ubzeJ69tcmeDvF+P8zy1T5",
  render_errors: [view: HTPWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: HTP.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
