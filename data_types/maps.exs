defmodule Subcontractor do
  @enforce_keys [
    :first_name,
    :middle_name,
    :last_name,
    :gender,
    :dob,
    :phone,
    :email,
    :start_date,
    :tech_stack,
    :is_adult,
    :has_a_gmail_account
    # :phone_number_country
  ]
  defstruct [
    :first_name,
    :middle_name,
    :last_name,
    :gender,
    :dob,
    :phone,
    :email,
    :start_date,
    :tech_stack,
    :is_adult,
    :has_a_gmail_account
    # :phone_number_country
  ]
end

defmodule MapExercise do
  def get_subcontractors_as_a_map(data) do
    data_as_list = String.split(data, "\n")
    final_list = []
    final_list = iterate_data_list(data_as_list, length(data_as_list), final_list)
    Enum.reverse(final_list)
  end

  defp iterate_data_list(list, n, final_list) when n > 0 do
    subcontractor_as_string = Enum.at(list, n - 1)
    subcontractor_struct = map_to_struct(subcontractor_as_string)
    final_list = final_list ++ [subcontractor_struct]
    iterate_data_list(list, n - 1, final_list)
  end

  defp iterate_data_list(_list, 0, final_list) do
    final_list
  end

  defp map_to_struct(subcontractor_string) do
    subcontractor_as_list = String.split(subcontractor_string, ",")
    name_as_list = split_name(Enum.at(subcontractor_as_list, 0))
    tech_stack = String.split(Enum.at(subcontractor_as_list, 6), "|")

    %Subcontractor{
      first_name: Enum.at(name_as_list, 0),
      middle_name: Enum.at(name_as_list, 1),
      last_name: Enum.at(name_as_list, 2),
      gender: Enum.at(subcontractor_as_list, 1),
      dob: convert_date(Enum.at(subcontractor_as_list, 2)),
      phone: Enum.at(subcontractor_as_list, 3),
      email: Enum.at(subcontractor_as_list, 4),
      start_date: convert_date(Enum.at(subcontractor_as_list, 5)),
      tech_stack: tech_stack,
      is_adult: is_adult?(Enum.at(subcontractor_as_list, 2)),
      has_a_gmail_account: has_a_gmail_account?(Enum.at(subcontractor_as_list, 4))
      # phone_number_country: nil
    }
  end

  defp split_name(name) do
    name_as_list = String.split(name, " ")

    if length(name_as_list) < 3 do
      [Enum.at(name_as_list, 0), "", Enum.at(name_as_list, 1)]
    else
      name_as_list
    end
  end

  defp convert_date(string) do
    list = String.split(string, ".")
    year = String.to_integer(Enum.at(list, 0))
    month = String.to_integer(Enum.at(list, 1))
    day = String.to_integer(Enum.at(list, 2))

    Date.new!(year, month, day)
  end

  defp is_adult?(dob) do
    birthday = convert_date(dob)
    today = Date.utc_today()
    eighteen_years_ago = Date.add(today, -18 * 365)

    Date.compare(birthday, eighteen_years_ago) == :lt
  end

  defp has_a_gmail_account?(email) do
    email =~ ~r/gmail/i
  end
end

{:ok, data} = File.read("./data.csv")
subcontractors = MapExercise.get_subcontractors_as_a_map(data)
IO.puts(inspect(subcontractors))
