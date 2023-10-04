# https://www.codewars.com/kata/546e2562b03326a88e000020/train/elixir

# defmodule Kata do
#   def square_digits(n) do
#     n
#     |> Integer.digits()
#     |> Enum.map(fn x -> x * x end)
#     |> Enum.map(&to_charlist/1)
#     |> Enum.concat()
#     |> to_string()
#     |> String.to_integer()
#   end
# end

defmodule Kata do
  def square_digits(n) do
    n
    |> Integer.digits()
    |> Enum.map_join(&(&1 * &1))
    |> String.to_integer()
  end
end

n = 9119
n2 = 765

IO.puts(inspect(Kata.square_digits(n)))
IO.puts(inspect(Kata.square_digits(n2)))
