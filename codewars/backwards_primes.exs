# https://www.codewars.com/kata/5539fecef69c483c5a000015/train/elixir

# https://byjus.com/maths/how-to-find-prime-numbers/

defmodule Back do
  def backwards_prime(start, stop) do
    Stream.filter(start..stop, &(is_prime?(&1) && is_reverse_prime?(&1)))
    |> Enum.to_list()
  end

  def is_reverse_prime?(n) do
    r = n |> Integer.digits() |> Enum.reverse() |> Integer.undigits()
    n != r && is_prime?(r)
  end

  def is_prime?(n) do
    n_sqrt = n |> :math.sqrt() |> trunc()
    !Enum.any?(2..n_sqrt, &(rem(n, &1) == 0))
  end
end

ExUnit.start()

defmodule BackTest do
  use ExUnit.Case

  test "test_1" do
    assert Back.backwards_prime(2, 100) == [13, 17, 31, 37, 71, 73, 79, 97]
  end

  test "test_2" do
    assert Back.backwards_prime(9900, 10000) == [9923, 9931, 9941, 9967]
  end

  test "test_3" do
    assert Back.backwards_prime(501, 599) == []
  end

  test "test_4" do
    assert Back.backwards_prime(1_000_001, 1_000_100) == [1_000_033, 1_000_037, 1_000_039]
  end
end
