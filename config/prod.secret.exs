use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :task_tracker2, TaskTracker2Web.Endpoint,
  secret_key_base: "w2ALDdF6Sn0HUMISPatU7Bmi9uszg/+dFaTrL3UOfgpMuD7DMG6uGW2DpNAXbkQp"

# Configure your database
config :task_tracker2, TaskTracker2.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "task_tracker2",
  password: "Ahxe2boo8Hoo",
  database: "task_tracker2_prod",
  pool_size: 15
