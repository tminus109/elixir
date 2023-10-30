# https://www.codewars.com/kata/56d6c333c9ae3fc32800070f/train/elixir

defmodule DateUtils do
  # def year_days(year) do
  #   cond do
  #     rem(year, 400) == 0 || (rem(year, 4) == 0 && rem(year, 100) != 0) ->
  #       "#{year} has #{366} days"

  #     true ->
  #       "#{year} has #{365} days"
  #   end
  # end

  def year_days(year) do
    "#{year} has #{if Calendar.ISO.leap_year?(year), do: 366, else: 365} days"
  end
end

ExUnit.start()

defmodule DateUtilsTest do
  use ExUnit.Case

  describe "Codewars tests" do
    test "happy tests" do
      assert DateUtils.year_days(0) == "0 has 366 days"
      assert DateUtils.year_days(-64) == "-64 has 366 days"
      assert DateUtils.year_days(2016) == "2016 has 366 days"
      assert DateUtils.year_days(1974) == "1974 has 365 days"
      assert DateUtils.year_days(-10) == "-10 has 365 days"
      assert DateUtils.year_days(666) == "666 has 365 days"
      assert DateUtils.year_days(1857) == "1857 has 365 days"
    end
  end
end
