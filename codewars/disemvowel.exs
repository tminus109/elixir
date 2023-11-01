# https://www.codewars.com/kata/52fba66badcd10859f00097e/train/elixir

# defmodule Kata do
#   @vowels ~c"aAeEiIoOuU"

#   def disemvowel(s) do
#     s
#     |> String.to_charlist()
#     |> Enum.filter(fn c -> c not in @vowels end)
#     |> List.to_string()
#   end
# end

defmodule Kata do
  def disemvowel(s) do
    String.replace(s, ~r/[aeiou]/i, "")
  end
end

# "Ths wbst s fr lsrs LL!"
IO.puts(Kata.disemvowel("This website is for losers LOL!"))
