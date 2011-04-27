Fabricator(:user) do
  name { "User Number #{Fabricate.sequence :user_name}"}
  provider "twitter"
  uid { Fabricate.sequence :uid }
end