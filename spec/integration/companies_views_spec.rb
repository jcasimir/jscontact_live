require 'spec_helper'
require 'capybara/rspec'

describe "the views for company", :type => :request do
  describe "when a user is not logged in"

  describe "when a user is logged in" do
    before(:each) do
      @user = Fabricate(:user_with_companies)
      login_as(@user)
    end

    describe "when looking at the list of companies" do
      before(:each) do
        visit companies_path
      end

      it "should show the companies for the current user" do
        @user.companies.each do |company|
          page.should have_content(company.name)
        end
      end

      describe "when there are multiple users in the system" do
        before(:all) do
          @other_user = Fabricate(:user_with_companies)
          visit companies_path
        end

        it "should not show the companies for another user" do
          @other_user.companies.each do |company|
            page.should_not have_content(company.name)
          end
        end

        it "should only show the companies associated with this user" do
          within("#companies") do
            page.all(".company").count.should == @user.companies.count
          end
        end
      end
    end

    describe "when looking at a company" do
      before(:each) do
        @company = @user.companies.first
        visit company_path(@company)
      end

      it "should display each of the company's phone numbers" do
        @company.phone_numbers.each do |phone_number|
          page.should have_selector("#phone_number_#{phone_number.id}")
        end
      end

      it "should return to the company after creating a phone number" do
        click_link("new_phone_number")
        fill_in "phone_number_number", :with => "2223334444"
        click_button("phone_number_submit")
        current_path.should == company_path(@company)

        page.should have_content("2223334444")
      end
    end


  end

end