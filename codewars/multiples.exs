# https://www.codewars.com/kata/514b92a657cdc65150000006/train/elixir

defmodule Challenge do
  def solution(number) do
    cond do
      number <= 0 ->
        0

      true ->
        1..(number - 1)
        |> Enum.filter(fn n -> rem(n, 3) == 0 || rem(n, 5) == 0 end)
        |> Enum.sum()
    end
  end
end

ExUnit.start()

defmodule ChallengeTest do
  use ExUnit.Case

  describe "Codewars tests" do
    test "happy tests" do
      assert Challenge.solution(10) == 23
      assert Challenge.solution(0) == 0
      assert Challenge.solution(-10) == 0
    end
  end
end
