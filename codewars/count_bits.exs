# https://www.codewars.com/kata/526571aae218b8ee490006f4/solutions/elixir

# defmodule CountBits do
#   def bits(n) do
#     n
#     |> to_binary_list()
#     |> Enum.filter(fn x -> x == 1 end)
#     |> length()
#   end

#   def to_binary_list(0), do: [0]

#   def to_binary_list(1), do: [1]

#   def to_binary_list(n) do
#     to_binary_list(div(n, 2)) ++ [rem(n, 2)]
#   end
# end

defmodule CountBits do
  def bits(n) do
    n
    |> Integer.digits(2)
    |> Enum.sum()
  end
end

n = 1234

IO.puts(inspect(CountBits.bits(n)))
