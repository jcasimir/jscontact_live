require 'spec_helper'
require 'capybara/rspec'

describe "the views for people", :type => :request do
  before(:all) do
    @person = Person.create(:first_name => "John", :last_name => "Doe")
    @person.phone_numbers.create(:number => "1234567")
    @person.phone_numbers.create(:number => "5671234")
  end


  describe "when looking at a person" do
    before(:each) do
      visit person_path(@person)
    end

    it "should display each of the person's phone numbers" do
      @person.phone_numbers.each do |phone_number|
        page.should have_selector("#phone_number_#{phone_number.id}")
      end
    end

    it "should have an edit link for each phone number" do
      @person.phone_numbers.each do |phone_number|
        page.should have_link("edit_phone_number_#{phone_number.id}")
      end
    end

    it "should have a delete link for each phone number" do
      @person.phone_numbers.each do |phone_number|
        page.should have_link("delete_phone_number_#{phone_number.id}")
      end
    end

    it "should show the person after deleting a phone number" do
      target = @person.phone_numbers.first
      click_link("delete_phone_number_#{target.id}")
      current_path.should == person_path(@person)
    end

    it "should show the edit page after clicking the edit link" do
      target = @person.phone_numbers.first
      click_link("edit_phone_number_#{target.id}")
      current_path.should == edit_phone_number_path(target)
    end
  end
end