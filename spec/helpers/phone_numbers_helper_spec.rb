require 'spec_helper'

describe PhoneNumbersHelper do
  describe "print_numbers" do
    it "should return a comma-separated list of the phone numbers" do
      numbers = [
        PhoneNumber.new(:number => "2223334444"),
        PhoneNumber.new(:number => "4445556666"),
      ]
      output = print_numbers(numbers)
      output.should == "2223334444, 4445556666"
    end

    it "should not have a comma when there is only one phone number" do
      numbers = [PhoneNumber.new(:number => "2223334444")]
      output = print_numbers(numbers)
      output.should_not include(",")
    end
  end
end