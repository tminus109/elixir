# https://www.codewars.com/kata/513e08acc600c94f01000001/train/elixir

defmodule Kata do
  def rgb(r, g, b) do
    [r, g, b]
    |> Enum.map(fn n ->
      s =
        cond do
          n < 0 -> Integer.to_string(0, 16)
          n > 255 -> Integer.to_string(255, 16)
          n -> Integer.to_string(n, 16)
        end

      if String.length(s) == 1, do: "0" <> s, else: s
    end)
    |> Enum.join()
  end
end

ExUnit.start()

defmodule KataTest do
  use ExUnit.Case

  describe "Codewars test cases" do
    test "test_1" do
      assert Kata.rgb(255, 255, 255) == "FFFFFF"
    end

    test "test_2" do
      assert Kata.rgb(255, 255, 300) == "FFFFFF"
    end

    test "test_3" do
      assert Kata.rgb(0, 0, 0) == "000000"
    end

    test "test_4" do
      assert Kata.rgb(148, 0, 211) == "9400D3"
    end

    test "test_5" do
      assert Kata.rgb(-148, 0, 211) == "0000D3"
    end

    test "test_6" do
      assert Kata.rgb(212, 53, 12) == "D4350C"
    end
  end
end
