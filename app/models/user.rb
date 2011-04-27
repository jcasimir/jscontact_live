class User < ActiveRecord::Base
  has_many :companies

  def self.find_or_create_by_auth(auth)
    raise ArgumentError.new("You mush supply parameters") unless auth

    user = User.find_or_initialize_by_provider_and_uid(auth["provider"], auth["uid"])

    if user.new_record?
      user.name = auth["user_info"]["name"]
      user.save
    end

    return user
  end
end
