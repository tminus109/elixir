# https://www.codewars.com/kata/5264d2b162488dc400000001/train/elixir

# defmodule Spin do
#   def spin_words(message) do
#     message
#     |> String.split(" ")
#     |> Enum.map(&reverse_word(&1))
#     |> Enum.join(" ")
#   end

#   defp reverse_word(word) do
#     if String.length(word) >= 5 do
#       String.reverse(word)
#     else
#       word
#     end
#   end
# end

defmodule Spin do
  def spin_words(message) do
    message
    |> String.split(" ")
    |> Enum.map_join(" ", &((String.length(&1) >= 5 && String.reverse(&1)) || &1))
  end
end

message = "Hey fellow warriors"
message2 = "This is a test"
message3 = "This is another test"

IO.puts(Spin.spin_words(message))
IO.puts(Spin.spin_words(message2))
IO.puts(Spin.spin_words(message3))
