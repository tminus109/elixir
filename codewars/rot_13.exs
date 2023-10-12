# https://www.codewars.com/kata/530e15517bc88ac656000716/train/elixir

# uppercase_letters = 65..90
# lowercase_letters = 97..122

defmodule Encryptor do
  def rot13(string) do
    string
    |> String.to_charlist()
    |> Enum.map(fn c ->
      cond do
        c in 65..77 -> c + 13
        c in 78..90 -> c - 13
        c in 97..109 -> c + 13
        c in 110..122 -> c - 13
        c -> c
      end
    end)
    |> List.to_string()
  end
end

ExUnit.start()

defmodule EncryptorTest do
  use ExUnit.Case

  test "codewars tests" do
    assert Encryptor.rot13("test") == "grfg"
    assert Encryptor.rot13("Test") == "Grfg"
  end
end
