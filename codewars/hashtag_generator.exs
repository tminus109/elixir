# https://www.codewars.com/kata/52449b062fb80683ec000024/train/elixir

defmodule Hashtag do
  def generate(input) do
    result =
      input
      |> String.split()
      |> Enum.map(fn word -> String.capitalize(word) end)
      |> Enum.join()

    cond do
      String.length(input) == 0 -> false
      String.length(result) >= 140 -> false
      String.length(result) == 0 -> false
      result -> "#" <> result
    end
  end
end

ExUnit.start()

defmodule HashtagTest do
  use ExUnit.Case

  describe "Codewars test cases" do
    test "test_1" do
      assert Hashtag.generate(" Hello there thanks for trying my Kata") ==
               "#HelloThereThanksForTryingMyKata"
    end

    test "test_2" do
      assert Hashtag.generate("    Hello     World   ") == "#HelloWorld"
    end

    test "test_3" do
      assert Hashtag.generate(" ") == false
    end

    test "test_4" do
      assert Hashtag.generate("") == false
    end

    test "test_5" do
      refute Hashtag.generate(" ") == "#"
    end
  end
end
