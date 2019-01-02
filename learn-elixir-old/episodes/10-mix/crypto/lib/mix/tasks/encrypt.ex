defmodule Mix.Tasks.Encrypt do
  @shortdoc "Encrypts some arbitrary text"

  @moduledoc """
  Takes a -t option which specifies which text to encrypt.

    mix encrypt -t hello
  """

  use Mix.Task

  def run(args) do
    {opts, _, _} = OptionParser.parse(args, aliases: [t: :text])
    IO.puts Crypto.Encryptor.encrypt(opts[:text])
  end
end

# app -t "some text"
# {[text: "hello"], [], []}

# app --text "some text"
# {[text: "some text"], [], []}
