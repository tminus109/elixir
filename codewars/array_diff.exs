# https://www.codewars.com/kata/523f5d21c841566fde000009/train/elixir

# defmodule ArrayDiff do
#   def array_diff(a, b) do
#     Enum.reject(a, fn x -> Enum.member?(b, x) end)
#   end
# end

defmodule ArrayDiff do
  def array_diff(a, b) do
    Enum.filter(a, fn x -> x not in b end)
  end
end

a = [1, 2, 2, 2, 3, 4]
b = [2, 4]

IO.puts(inspect(ArrayDiff.array_diff(a, b)))
