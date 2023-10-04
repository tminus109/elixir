# https://www.codewars.com/kata/515de9ae9dcfc28eb6000001/train/elixir

# defmodule SplitStrings do
#   def solution(str) do
#     chars = String.graphemes(str)
#     is_odd = rem(length(chars), 2) != 0

#     chars =
#       if is_odd do
#         chars ++ ["_"]
#       else
#         chars
#       end

#     char_pairs = Enum.chunk_every(chars, 2)
#     Enum.map(char_pairs, fn n -> Enum.at(n, 0) <> Enum.at(n, 1) end)
#   end
# end

defmodule SplitStrings do
  def solution(str) do
    str
    |> to_charlist
    |> Enum.chunk_every(2, 2, ~c"_")
    |> Enum.map(&to_string/1)
  end
end

split_string = SplitStrings.solution("abc")
split_string2 = SplitStrings.solution("abcdef")
split_string3 = SplitStrings.solution("")

IO.puts(inspect(split_string))
IO.puts(inspect(split_string2))
IO.puts(inspect(split_string3))
