defmodule Speaker do
  def speak do
    receive do
      {:say, msg} ->
        IO.puts(msg)
        speak()

      _other ->
        speak() # throw away the message
    end
  end
end

pid = spawn(Speaker, :speak, [])

send pid, {:say, "Hello, World!"}
# => prints "Hello, World!" to standard out

send pid, {:say, "Goodbye, World!"}
# => prints "Goodbye, World!" to standard out

send pid, "heya"
