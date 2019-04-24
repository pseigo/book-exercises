defmodule DataTypes do
  def puts(t) when is_tuple(t) do
    indices = 0..(tuple_size(t) - 1)
    Enum.each(indices, fn(index) ->
      IO.puts elem(t, index)
    end)
  end
end

DataTypes.puts({1, 2, 3.14159, "banana", :myatom})
