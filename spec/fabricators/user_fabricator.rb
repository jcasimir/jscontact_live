Fabricator(:user) do
  name { "User Number #{Fabricate.sequence :user_name}"}
  provider "twitter"
  uid { Fabricate.sequence :uid }
end

Fabricator(:user_with_companies, :from => :user) do
  companies!(:count => 3){|user, i| Fabricate(:company, :user => user)}
end