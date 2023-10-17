# https://www.codewars.com/kata/52742f58faf5485cae000b9a/train/elixir

defmodule DurationFormatter do
  @units [
    year: 31_536_000,
    day: 86400,
    hour: 3600,
    minute: 60,
    second: 1
  ]

  def format_duration(0), do: "now"

  def format_duration(seconds) do
    @units
    |> Enum.map_reduce(seconds, fn {u, v}, s -> {{u, div(s, v)}, rem(s, v)} end)
    |> elem(0)
    |> Enum.filter(fn {_, v} -> v > 0 end)
    |> Enum.map(fn
      {u, 1} -> "1 #{u}"
      {u, v} -> "#{v} #{u}s"
    end)
    |> Enum.intersperse(", ")
    |> List.replace_at(-2, " and ")
    |> Enum.join()
  end
end

ExUnit.start()

defmodule DurationFormatterTest do
  use ExUnit.Case

  describe "Codewars test cases" do
    test "test_1" do
      assert DurationFormatter.format_duration(31_536_000_237) ==
               "1000 years, 3 minutes and 57 seconds"
    end

    test "test_2" do
      assert DurationFormatter.format_duration(31_536_677_940) ==
               "1000 years, 7 days, 20 hours and 19 minutes"
    end

    test "test_3" do
      assert DurationFormatter.format_duration(87675) == "1 day, 21 minutes and 15 seconds"
    end

    test "test_4" do
      assert DurationFormatter.format_duration(62) == "1 minute and 2 seconds"
    end

    test "test_5" do
      assert DurationFormatter.format_duration(3662) == "1 hour, 1 minute and 2 seconds"
    end

    test "test_6" do
      assert DurationFormatter.format_duration(0) == "now"
    end
  end
end
