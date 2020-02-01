import Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "learn_phoenix",
  password: "learnphoenixpassword",
  hostname: "localhost"

config :friends, ecto_repos: [Friends.Repo]
