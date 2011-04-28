Fabricator(:phone_number) do
  number{ "111222#{Fabricate.sequence :phone_numbers, 3333}"}
end