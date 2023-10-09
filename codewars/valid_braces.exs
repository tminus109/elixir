# https://www.codewars.com/kata/5277c8a221e209d3f6000b56/train/elixir

defmodule Challenge do
  @open_braces ~w"( [ {"

  def valid_braces(braces) do
    braces = String.graphemes(braces)

    if rem(length(braces), 2) != 0 do
      false
    else
      length(
        Enum.reduce(braces, [], fn char, acc ->
          if char in @open_braces do
            [char | acc]
          else
            if (char == ")" && !Enum.empty?(acc) && hd(acc) == "(") ||
                 (char == "}" && !Enum.empty?(acc) && hd(acc) == "{") ||
                 (char == "]" && !Enum.empty?(acc) && hd(acc) == "[") do
              tl(acc)
            else
              [char | acc]
            end
          end
        end)
      ) == 0
    end
  end
end

braces = "(){}[]"
braces2 = "([{}])"
braces3 = "(}"
braces4 = "[(])"
braces5 = "[({})](]"
braces6 = "]({})](]"
braces7 = "(})"

IO.puts(inspect(Challenge.valid_braces(braces)))
IO.puts(inspect(Challenge.valid_braces(braces2)))
IO.puts(inspect(Challenge.valid_braces(braces3)))
IO.puts(inspect(Challenge.valid_braces(braces4)))
IO.puts(inspect(Challenge.valid_braces(braces5)))
IO.puts(inspect(Challenge.valid_braces(braces6)))
IO.puts(inspect(Challenge.valid_braces(braces7)))
