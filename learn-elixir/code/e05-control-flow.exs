defmodule Patterns do
  def blank?(nil),    do: true
  def blank?(false),  do: true
  def blank?(""),     do: true
  def blank?(_other), do: false

  # Alternatively,
  def blank_v2?(value) when value in [nil, false, ""], do: true
  def blank_v2?(_), do: false

  # Even better,
  def blank_v3?(value), do: value in [nil, false, ""]
end
