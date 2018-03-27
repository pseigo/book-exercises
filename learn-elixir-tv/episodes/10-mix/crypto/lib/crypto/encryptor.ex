defmodule Crypto.Encryptor do
  # @prefix Application.get_env(:crypto, :prefix)
  @prefix Application.get_env(:crypto, __MODULE__)[:prefix] # __MODULE__ stands for the name of the current module

  def encrypt(text) do
    @prefix <> String.reverse(text)
  end
end
