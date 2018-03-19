defmodule Crypto.Encryptor do
  @prefix Application.get_env(:crypto, :prefix)

  def encrypt(text) do
    @prefix <> String.reverse(text)
  end
end
