# https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/elixir

# defmodule Kata do
#   def find_outlier(integers) do
#     odd_numbers = Stream.filter(integers, fn n -> rem(n, 2) != 0 end) |> Enum.to_list()

#     if length(odd_numbers) == 1 do
#       List.first(odd_numbers)
#     else
#       Stream.filter(integers, fn n -> rem(n, 2) == 0 end)
#       |> Enum.to_list()
#       |> List.first()
#     end
#   end
# end

defmodule Kata do
  def find_outlier(integers) do
    {even, odd} = Enum.split_with(integers, &(rem(&1, 2) == 0))

    if length(even) > length(odd), do: hd(odd), else: hd(even)
  end
end

integers = [2, 4, 0, 100, 4, 11, 2602, 36]
integers2 = [160, 3, 1719, 19, 11, 13, -21]

IO.puts(inspect(Kata.find_outlier(integers)))
IO.puts(inspect(Kata.find_outlier(integers2)))
