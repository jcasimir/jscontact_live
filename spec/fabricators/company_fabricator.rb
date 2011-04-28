Fabricator(:company) do
  name {"Sample Company #{Fabricate.sequence :company}"}
  phone_numbers!(:count => 2){|company, i| Fabricate(:phone_number, :contact => company)}
end