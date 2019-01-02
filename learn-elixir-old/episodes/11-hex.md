# Hex

- Package manager for the Erlang ecosystem
- Integrates with `mix`

## Install Hex

Must install HEx before using it.

`$ mix local.hex`

## Resources for finding packages

- [h4cc/awesome-elixir](https://github.com/h4cc/awesome-elixir)
  - "A curated list of amazingly awesome Elixir libraries, resources, and shiny things inspired by awesome-php."
- [Hex Web Search](https://hex.pm/)
- `mix hex.search PACKAGE_NAME`

## Installing packages

Add `{:package_name, opts}` to the `deps` in your `mix.exs` file.

```elixir
defmodule do
  # ...

  def deps do
    [
      {:package_name, "1.0.0"}
    ]
  end
end
```

### Semantic versioning

[Semantic versioning](https://semver.org/). Version is only required for packages from Hex.

- Only version 1.0.0
  - `{:package_name, "1.0.0"}`
- Any version greater than 1.0.0
  - `{:package_name, "> 1.0.0"}`
- Any version less than 2.0.0
  - `{:package_name, "< 2.0.0"}`
- Any version between 1.0.0 and 1.1.0
  - `{:package_name, "~> 1.0.0"}`
- Any version between 1.0.0 and 2.0.0
  - `{:package_name, "~> 1.0"}`

### Dependencies from Git or GitHub

Version is not required! But it's a good idea to rely on a tag, branch, or commit.

```elixir
# From Github:
{:package_name, github: "username/repo"}

# From Git:
{:package_name, git: "git@domain.tld:username/repo"}

# Using Tag:
{:package_name, github: "username/repo",
                tag: "v1.0.0"}

# Using Branch:
{:package_name, github: "username/repo",
                branch: "release"}

# Using Commit SHA
{:package_name, github: "username/repo",
                ref: "17bbd278f9c"}
```

### Other details

```elixir
# Only download/use this package in a given environment
{:package_name, only: :test}

# Override another package's dependency (careful!)
{:package_name, "2.0.0", override: true}
```

## Mix tasks

`mix deps.get`

- Downloads packages from Hex/Git
- Caches Hex packages on your file system
- Places dependencies in the project's `deps/` folder

`mix compile`

- Compiles dependencies in the `deps/` folder

`mix deps.clean PACKAGE_NAME`

- Remove package from `deps/` folder

`mix deps.update PACKAGE_NAME`

- Update a dependency version when changed in `mix.exs`

`mix hex.outdated`

- Shows outdated Hex deps for the current project
- Useful when trying to keep a project up-to-date

`mix hex.publish`

- Uploads a package to Hex.

## Configuration

Add settings for dependencies using `config/2` in `config/config.exs`. Check the package's README file for information on configuration.

```elixir
config :package_name, setting_a: "value",
                      setting_b: "value"
```

## Checklist for Publishing to Hex

1. Ensure your project has a unique name.
2. Add a package/0 function to your Mixfile.
3. Include all dependency app names in the application/0 list.
4. Update project/0 with :source_url, :description and :package.

Sample package/0 function:

```elixir
defp package do
  [
    files: ["lib", "mix.exs", "README.md"],
    maintainers: ["Your Name"],
    licenses: ["MIT"], # or whatever license you want
    links: %{
      "Github" => "https://github.com/username/repo"
    }
]
end
```

Sample application/0 function:

```elixir
def application do
  [applications: [:dependency_a, :dependency_b]]
end
```

Sample project/0 function: (with lines you need to add highlighted)

```elixir
def project do
   [app: :my_project_name,
    version: "0.0.1",
    elixir: "~> 1.0",
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
+   source_url: "https://github.com/username/repo",
+   description: "Short description of project here",
+   package: package,
    deps: deps]
 end
```
