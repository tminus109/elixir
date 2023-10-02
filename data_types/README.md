Lucas, CEO of Digital Natives found a Google Docs, containing all previous subcontractors and their contact details in a bulk format. The docs contains a csv string, in the following format:

full_name,gender,birth_date,phone_number,email_address,first_project_date,tech_stacks

An example row looks like the following:

Nick Nate Nice,male,2013.11.09.,+36303218129,nick.nice@gmail.com,2000.04.04.,Ruby|Javascript|PHP

Details:

full_name: can contain 2 or 3 words: last_name middle_name first_name. Middle name is optional,
gender: can be either male, female or other,
birth_date: format is yyyy.mm.dd.,
phone_number: starts with a + sign, followed by the country code and the phone number,
email: standard email format,
first_project_date: format is yyyy.mm.dd.,
tech_stacks: languages separated by a |. Languages can be the following: Ruby,Javascript,PHP,Elixir,Phoenix,React,NodeJS,AngularJS,Ruby on Rails.

Assignments:

Convert to a list:

Create a module, which gets the string above containing the csv data in its constructor. Create a function, called get_subcontractors_as_a_list, which gives back the data converted to a list of lists. The function should also do the following before converting the csv to a list:

Converts the gender to an enum.
Converts birth_date and first_project_date to a date.
Tech_stack should be a list of enums.

Convert the list to a map:

Create a function, called get_subcontractors_as_a_map, which gives back the data converted to a list of maps. The function should do the conversions above but some more:

Every map should have a key called is_adult, which should be true if the subcontractor is older than 18 years and false if not.
Every map should have a key called has_a_gmail_account, which should be true if the email_address field ends with gmail.com.
Every map should have a key called phone_number_country, which should store the country based on the country code in a string (in case it’s hard to solve for all country codes, select 10 country codes which gets recognised. In this case if the country code is not within the recognised countries, the phone_number_country should be empty.
Instead of giving back the full_name, the map should contain last_name, first_name, middle_name. middle_name should be empty, if the full name contains only 2 names.
