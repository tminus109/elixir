# https://www.codewars.com/kata/55aa075506463dac6600010d/train/elixir

defmodule RecreationOne do
  def list_squared(m, n) do
    Enum.reduce(m..n, [], fn x, acc ->
      divisors = find_divisors(x)
      sum = Stream.filter(divisors, &(rem(x, &1) == 0)) |> Stream.map(&(&1 * &1)) |> Enum.sum()

      if is_square?(sum) do
        acc ++ [{x, sum}]
      else
        acc
      end
    end)
  end

  defp is_square?(sum) do
    sqrt_sum = sum |> :math.sqrt()
    floor = sqrt_sum |> floor()
    sqrt_sum == floor
  end

  defp find_divisors(num) do
    sqrt_num = num |> :math.sqrt() |> round

    1..sqrt_num
    |> Stream.filter(fn n -> rem(num, n) == 0 end)
    |> Enum.flat_map(fn i ->
      j = div(num, i)

      # to not to add the same divisor 2x
      if i != j do
        [i, j]
      else
        [i]
      end
    end)
  end
end

ExUnit.start()

defmodule RecreationOneTest do
  use ExUnit.Case

  test "codewars tests" do
    assert RecreationOne.list_squared(1, 250) == [{1, 1}, {42, 2500}, {246, 84100}]
    assert RecreationOne.list_squared(42, 250) == [{42, 2500}, {246, 84100}]

    assert RecreationOne.list_squared(393, 5288) == [
             {728, 722_500},
             {1434, 2_856_100},
             {1673, 2_856_100},
             {1880, 4_884_100},
             {4264, 24_304_900}
           ]
  end
end
