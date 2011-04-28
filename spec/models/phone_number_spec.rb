require File.dirname(__FILE__) + '/../spec_helper'

describe PhoneNumber do
  before(:each) do
    @phone_number = Fabricate(:company).phone_numbers.first
  end

  it "should be valid" do
    @phone_number.should be_valid
  end

  it "should be associated with a contact" do
    @phone_number.contact.should_not be_nil
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
