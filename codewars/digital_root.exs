# https://www.codewars.com/kata/541c8630095125aba6000c00/train/elixir

defmodule Kata do
  def digital_root(n) when n < 10, do: n

  def digital_root(n) do
    n |> Integer.digits() |> Enum.sum() |> digital_root()
  end
end

ExUnit.start()

defmodule KataTest do
  use ExUnit.Case

  describe "Codewars tests" do
    test "Happy tests" do
      assert Kata.digital_root(16) == 7
      assert Kata.digital_root(942) == 6
      assert Kata.digital_root(132189) == 6
      assert Kata.digital_root(493193) == 2
    end
  end
end
