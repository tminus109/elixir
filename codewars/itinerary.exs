# https://www.codewars.com/kata/57a72cb872292dc43100000c/train/elixir

defmodule Trip do
  def itinerary(trip) do
    trip
    |> Enum.flat_map(fn flight -> [flight.in, flight.out] end)
    |> Enum.dedup()
    |> Enum.join("-")
  end
end

ExUnit.start()

defmodule TripTest do
  use ExUnit.Case

  describe "Codewars tests" do
    test "happy tests" do
      assert Trip.itinerary([%{in: "TRN", out: "FCO"}]) == "TRN-FCO"

      assert Trip.itinerary([%{in: "TRN", out: "FCO"}, %{in: "CIA", out: "JFK"}]) ==
               "TRN-FCO-CIA-JFK"

      assert Trip.itinerary([%{in: "TRN", out: "FCO"}, %{in: "FCO", out: "JFK"}]) ==
               "TRN-FCO-JFK"
    end
  end
end
