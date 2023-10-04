# https://www.codewars.com/kata/52f3149496de55aded000410/train/elixir

# defmodule Kata do
#   def sum_digits(number) do
#     number
#     |> abs()
#     |> Integer.digits()
#     |> Enum.reduce(fn x, acc -> x + acc end)
#   end
# end

defmodule Kata do
  def sum_digits(number) do
    number
    |> abs()
    |> Integer.digits()
    |> Enum.sum()
  end
end

IO.puts(inspect(Kata.sum_digits(10)))
IO.puts(inspect(Kata.sum_digits(99)))
IO.puts(inspect(Kata.sum_digits(-32)))
