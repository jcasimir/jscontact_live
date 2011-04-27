require 'spec_helper'
require 'capybara/rspec'

describe "the views for company", :type => :request do
  before(:all) do
    @company = Company.create(:name => "Sample Corp")
    @company.phone_numbers.create(:number => "1234567")
    @company.phone_numbers.create(:number => "5671234")
  end


  describe "when looking at a company" do
    before(:each) do
      visit company_path(@company)
    end

    it "should display each of the company's phone numbers" do
      @company.phone_numbers.each do |phone_number|
        page.should have_selector("#phone_number_#{phone_number.id}")
      end
    end

#
#    it "should have an edit link for each phone number" do
#      @person.phone_numbers.each do |phone_number|
#        page.should have_link("edit_phone_number_#{phone_number.id}")
#      end
#    end
#
#    it "should have a delete link for each phone number" do
#      @person.phone_numbers.each do |phone_number|
#        page.should have_link("delete_phone_number_#{phone_number.id}")
#      end
#    end
#
#    it "should show the person after deleting a phone number" do
#      target = @person.phone_numbers.first
#      click_link("delete_phone_number_#{target.id}")
#      current_path.should == person_path(@person)
#    end
#
#    it "should show the edit page after clicking the edit link" do
#      target = @person.phone_numbers.first
#      click_link("edit_phone_number_#{target.id}")
#      current_path.should == edit_phone_number_path(target)
#    end
#
#    it "should return to the person after editing a phone number" do
#      target = @person.phone_numbers.first
#      click_link("edit_phone_number_#{target.id}")
#      new_value = target.number.reverse
#      fill_in "phone_number_number", :with => new_value
#      click_button("phone_number_submit")
#      current_path.should == person_path(@person)
#      page.should have_selector("#phone_number_#{target.id}",
#                                :text => new_value)
    it "should return to the company after creating a phone number" do
      click_link("new_phone_number")
      fill_in "phone_number_number", :with => "2223334444"
      click_button("phone_number_submit")
      current_path.should == company_path(@company)

      page.should have_content("2223334444")
    end
  end
end