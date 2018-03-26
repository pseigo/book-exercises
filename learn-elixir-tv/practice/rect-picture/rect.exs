defmodule Rect do
  @moduledoc """
  Based on questions Q3C and Q3D from the APSC 160 sample midterm as part of the
  fist year engineering curriculum at the University of British Columbia.

  https://www.studocu.com/en-ca/s/296071
  """

  def rect(rows, cols) when is_integer(rows) and is_integer(cols) and rows >= 0 and cols >= 0 do
    do_rect(rows, cols, '')
  end

  defp do_rect(row, _cols, acc) when row == 0 do
    to_string(acc)
  end

  defp do_rect(row, cols, acc) do
    pattern = '* '
              |> Stream.cycle()
              |> Enum.take(cols * 2) # One symbol and one space == 2 symbols.

    do_rect(row - 1, cols, [pattern ++ '\n' | acc])
  end

  def stairs(size) when is_integer(size) and size >= 1 do
   do_stairs(size, 1, "")
  end

  defp do_stairs(size, row, pattern) when row == (size + 1) do
    pattern
    |> to_string
    |> String.trim
  end

  defp do_stairs(size, row, pattern) do
    row_pattern = rect(size, size * row)
    do_stairs(size, row + 1, [row_pattern | pattern])
  end
end

IO.puts Rect.stairs(3)
