defmodule Mix.Tasks.Encrypt do
  @shortdoc "Encrypts some arbitrary text"

  @moduledoc """
  Encrypts and prints text from the given text option.

      mix encrypt -t "Something fun!"

  ## Command line options

  - `-t, --text` - text to encrypt and print
  """

  use Mix.Task

  @doc """
  Encrypts given text and prints to console.

  ## Examples

      $ MIX_ENV=prod
      $
  """
  @spec run(args :: keyword(String.t)) :: :ok | :error
  def run(nil), do: IO.puts "Run `mix help encrypt` for command line options."
  def run(args) do
    {opts, _, _} = OptionParser.parse(args, aliases: [t: :text])
    IO.puts Crypto.Encryptor.encrypt(opts[:text])
  end
end
