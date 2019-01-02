defmodule MySigils do
  def sigil_n(content, _opts) do
    for n <- 0..String.to_integer(content), do: n
  end
end

defmodule Project do
  import MySigils

  def sigil_test do
    ~n[10]
  end
end

IO.inspect Project.sigil_test()
