# https://www.codewars.com/kata/54da5a58ea159efa38000836/train/elixir

defmodule FindOdd do
  def find(list) do
    list
    |> Enum.frequencies()
    |> Enum.find(fn {_key, value} -> rem(value, 2) != 0 end)
    |> elem(0)
  end
end

# 4
IO.puts(FindOdd.find([1, 2, 2, 3, 3, 3, 4, 3, 3, 3, 2, 2, 1]))
