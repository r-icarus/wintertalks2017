# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :ui, Ui.Endpoint,
  http: [port: 8000],
  url: [host: "localhost", port: 8000],
  secret_key_base: "3KkAqjKH0Db2+1LhN/KaXfeBml1hflI2C/h83C0m5Z0TMSrxm8eQeP9jOCD/VkY5",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Nerves.PubSub]

# Configures Elixir's Logger
config :logger, level: :debug
