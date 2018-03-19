# Common commands

Launching iex in the context of a mix project:

`$ iex -S mix`

# Notes

- .exs files are script files and are ignored by the mix compiler unless you explicitly run them.
- you can use `recompile()` while in iex to recompile your code

# Show notes

How to create a new mix project:

`$ mix new project_name`

How to create an umbrella project:

`$ mix new project_name --umbrella`

Then, create component projects within the umbrella project:

`$ cd project_name/apps`

`$ mix new component_name`
