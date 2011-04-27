namespace :data do


  desc "Add the person class to the phone_numbers table"
  task :add_person_to_phone_numbers => :environment do
    PhoneNumber.all.each do |phone_number|
      phone_number.contact_type = "Person"
      phone_number.save
    end
  end

end