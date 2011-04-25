require File.dirname(__FILE__) + '/../spec_helper'

describe PhoneNumber do
  before(:each) do
    @person = Person.create(:last_name => "Doe", :first_name => "John")
    @phone_number = @person.phone_numbers.create(:number => "2223334444")
  end

  it "should be valid" do
    @phone_number.should be_valid
  end

  it "should be associated with a person" do
    @phone_number.person.should be_instance_of(Person)
  end

  it "should not be valid without a number" do
    @phone_number.number = nil
    @phone_number.should_not be_valid
  end

  it "should not allow a variety of malformed numbers" do
    ["2025551111x432", "202.555.1111"].each do |number|
      @phone_number.number = number
      @phone_number.should_not be_valid
    end
  end

  it "should allow a variety of properly formed numbers" do
    ["2025551111432", "2025551111"].each do |number|
      @phone_number.number = number
      @phone_number.should be_valid
    end
  end
end
