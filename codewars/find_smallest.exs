# https://www.codewars.com/kata/573992c724fc289553000e95/train/elixir

defmodule Tosmallest do
  def smallest(n) do
    digits = Integer.digits(n)
    with_index = Enum.with_index(digits)
    sorted_digits = Enum.sort(digits)

    second = Enum.at(digits, 1)
    smallest = List.first(sorted_digits)
    second_smallest = Enum.at(sorted_digits, 1)
    largest = List.last(sorted_digits)

    all_smallests = Enum.filter(with_index, fn {i, _v} -> i == smallest end)
    {_, index_of_smallest} = List.last(all_smallests)

    IO.puts(inspect(all_smallests))
    IO.puts(index_of_smallest)

    all_second_smallests = Enum.filter(with_index, fn {i, _v} -> i == second_smallest end)
    {_, index_of_second_smallest} = List.last(all_second_smallests)

    all_largest = Enum.filter(with_index, fn {i, _v} -> i == largest end)
    {_, index_of_largest} = List.first(all_largest)

    last_index = length(digits) - 1

    i =
      cond do
        index_of_largest == 0 -> 0
        index_of_smallest == 0 -> index_of_second_smallest
        index_of_smallest == 1 && second == 0 -> 0
        index_of_smallest == 1 -> 1
        true -> index_of_smallest
      end

    j =
      cond do
        index_of_largest == 0 -> last_index
        index_of_smallest == 0 -> 1
        index_of_smallest == 1 && second == 0 -> index_of_largest - 1
        index_of_smallest == 1 -> 0
        true -> 0
      end

    num_to_move = Enum.at(digits, i)

    result =
      List.delete_at(digits, i)
      |> List.insert_at(j, num_to_move)
      |> Enum.join()
      |> String.to_integer()

    [result, i, j]
  end
end

# [8255271686990665833]
# [8255271686990665833, 12, 0]
IO.puts(inspect(Tosmallest.smallest(82_552_716_869_900_665_833)))

# # [16646221158838191885, 17, 0]
# IO.puts(inspect(Tosmallest.smallest(66_462_211_588_381_918_185)))

# # [126235, 2, 0]
# IO.puts(inspect(Tosmallest.smallest(261_235)))

# # [29917, 0, 1]
# IO.puts(inspect(Tosmallest.smallest(209_917)))

# # [238565, 3, 1]
# IO.puts(inspect(Tosmallest.smallest(285_365)))

# # [26945, 3, 0]
# IO.puts(inspect(Tosmallest.smallest(269_045)))

# # [239687, 4, 1]
# IO.puts(inspect(Tosmallest.smallest(296_837)))

# # [5581857190569491225, 15, 0]
# IO.puts(inspect(Tosmallest.smallest(55_818_571_905_694_901_225)))

# # [4427774247532896361, 0, 14]
# IO.puts(inspect(Tosmallest.smallest(80_442_777_424_753_296_361)))

# # [1, 0, 6]
# IO.puts(inspect(Tosmallest.smallest(1_000_000)))
