defmodule ListExercise do
  def get_subcontractors_as_a_list(data) do
    data_as_list = String.split(data, "\n")
    sublist = []
    sublists = create_sublists(data_as_list, length(data_as_list), sublist)
    final_list = []
    iterate_list(sublists, length(sublists), final_list)
  end

  defp create_sublists(list, n, sublist) when n > 0 do
    element = Enum.at(list, n - 1)
    new_list = String.split(element, ",")
    sublist = sublist ++ [new_list]
    create_sublists(list, n - 1, sublist)
  end

  defp create_sublists(_list, 0, sublist) do
    sublist
  end

  defp convert_gender(gender) do
    case gender do
      "male" -> :male
      "female" -> :female
      _ -> :other
    end
  end

  defp convert_date(string) do
    list = String.split(string, ".")
    year = String.to_integer(Enum.at(list, 0))
    month = String.to_integer(Enum.at(list, 1))
    day = String.to_integer(Enum.at(list, 2))
    Date.new!(year, month, day)
  end

  defp convert_tech(tech) do
    case tech do
      "Ruby" -> :ruby
      "Javascript" -> :javascript
      "PHP" -> :php
      "Elixir" -> :elixir
      "Phoenix" -> :phoenix
      "React" -> :react
      "NodeJS" -> :node_js
      "AngularJS" -> :angular_js
      "Ruby on Rails" -> :ruby_on_rails
      _ -> :other
    end
  end

  defp iterate_list(list, n, final_list) when n > 0 do
    sublist = Enum.at(list, n - 1)
    new_sublist = []
    new_sublist = iterate_sublist(sublist, length(sublist), new_sublist)
    final_list = final_list ++ [new_sublist]
    iterate_list(list, n - 1, final_list)
  end

  defp iterate_list(_list, 0, final_list) do
    final_list
  end

  defp iterate_sublist(sublist, n, new_sublist) when n > 0 do
    index = n - 1
    item = Enum.at(sublist, index)

    new_item =
      case index do
        6 -> String.split(item, "|")
        5 -> convert_date(item)
        2 -> convert_date(item)
        1 -> convert_gender(item)
        _ -> item
      end

    new_sublist = new_sublist ++ [new_item]
    iterate_sublist(sublist, n - 1, new_sublist)
  end

  defp iterate_sublist(_sublist, 0, new_sublist) do
    Enum.reverse(new_sublist)
  end
end

{:ok, data} = File.read("./data.csv")
final_list = ListExercise.get_subcontractors_as_a_list(data)
IO.puts(inspect(final_list))
