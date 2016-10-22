# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :collegeSpec,
  ecto_repos: [CollegeSpec.Repo]

# Configures the endpoint
config :collegeSpec, CollegeSpec.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qzJyBT/dU2NzOFAbbHhntOtRosUgjbnmh9a+1KfAK03SBYp+LX/aKdNG8yFNq7/i",
  render_errors: [view: CollegeSpec.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CollegeSpec.PubSub,
           adapter: Phoenix.PubSub.PG2]
# ex_admin
config :ex_admin,
  repo: CollegeSpec.Repo,
  module: CollegeSpec,
  modules: [
    CollegeSpec.ExAdmin.Dashboard,
    CollegeSpec.ExAdmin.College
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}
