# Show notes

How to create a new mix project:

`$ mix new project_name`

How to create an umbrella project:

`$ mix new project_name --umbrella`

Then, create component projects within the umbrella project:

`$ cd project_name/apps`

`$ mix new component_name`
# Common commands

Launching iex in the context of a mix project:

`$ iex -S mix`

# Notes

- .exs files are script files and are ignored by the mix compiler unless you explicitly run them.
- you can use `recompile()` while in iex to recompile your code
- it's better to split code into multiple modules and files rather than put everything in the top of the `lib/` directory
  - put code in a folder with the same name as the project in `lib/`
