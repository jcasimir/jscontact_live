require 'spec_helper'

describe User do
  before(:each) do
    @fake_auth = {"provider" => "fake_provider",
                 "uid" => "1",
                 "user_info" => {"name" => "Fake Person"}}
  end

  it "should create a user when there is a new provider/uid pair" do
    User.find_by_provider_and_uid(@fake_auth["provider"], @fake_auth["uid"]).try(:destroy)

    before_count = User.count

    User.find_or_create_by_auth(@fake_auth)
    User.count.should > before_count
  end

  it "should not create a user when there is a known provider/uid pair" do
    user1 = User.find_or_create_by_auth(@fake_auth)
    user2 = User.find_or_create_by_auth(@fake_auth)
    user1.should == user2
  end

  it "should raise an exception if the auth parameters are nil" do
    lambda {User.find_or_create_by_auth(nil)}.should raise_error(ArgumentError)
  end
end
