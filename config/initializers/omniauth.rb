Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "EZYxQSqP0j35QWqoV0kUg", "IToKT8jdWZEhEH60wFL94HGf4uoGE1SqFUrZUR34M4"
  #provider :twitter, ENV["twitter_key"], ENV["twitter_secret"]
end
