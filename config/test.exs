import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ambush_chat, AmbushChatWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "lzHTX59205f3TIZOQ4kjGokEz3C/j8bW2ipDcvJJiO9iHHt2gFCP+0g9uEpZWbp6",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
