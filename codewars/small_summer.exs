# https://www.codewars.com/kata/558fc85d8fd1938afb000014/train/elixir

defmodule SmallSummer do
  def sum_two_smallest_numbers(numbers) do
    numbers
    |> Enum.sort()
    |> Enum.take(2)
    |> Enum.sum()
  end
end

numbers = [19, 5, 42, 2, 77]
numbers2 = [10, 343_445_353, 3_453_445, 3_453_545_353_453]
numbers3 = [19]
numbers4 = [42, 77]

IO.puts(inspect(SmallSummer.sum_two_smallest_numbers(numbers)))
IO.puts(inspect(SmallSummer.sum_two_smallest_numbers(numbers2)))
IO.puts(inspect(SmallSummer.sum_two_smallest_numbers(numbers3)))
IO.puts(inspect(SmallSummer.sum_two_smallest_numbers(numbers4)))
