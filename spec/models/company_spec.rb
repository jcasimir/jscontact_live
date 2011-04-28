require File.dirname(__FILE__) + '/../spec_helper'

describe Company do
  before(:each) do
    @company = Fabricate(:user_with_companies).companies.first
  end

  it "should be valid with valid attributes" do
    @company.should be_valid
  end

  it "should not be valid without a name" do
    @company.name = nil
    @company.should_not be_valid
  end

  it "should have associated phone numbers " do
    @company.phone_numbers.should be_kind_of(Enumerable)
  end

  it "should have a phone number after creating one" do
    number_count = @company.phone_numbers.count
    @company.phone_numbers.create(:number =>"5556667777")
    @company.phone_numbers.count.should > number_count
  end

  it "should be attached to a user" do
    @company.user.should be_instance_of(User)
  end

  it "should be able to have a bazillion phone numbers" do
    1000.times {Fabricate(:phone_number, :contact => @company)}
    @company.phone_numbers.count >= 1000
  end
end
