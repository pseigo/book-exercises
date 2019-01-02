# Read/write permission map
defmodule Operators do
  def chmod(permission, path) when is_number(permission) and is_binary(path) do
    perm_to_code = %{"0": "---",
                     "1": "--x",
                     "2": "-w-",
                     "3": "-wx",
                     "4": "r--",
                     "5": "r-x",
                     "6": "rw-",
                     "7": "rwx"}

    # some magic voodoo

    perm_string = to_string(permission)
    "File '" <> path <> "' set to " <> perm_to_code[perm_string] <> "."
  end
end

Operators.chmod(7, "file.txt")
