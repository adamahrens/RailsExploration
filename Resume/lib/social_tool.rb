module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end

    client.search('#rails -rt', lang: 'en', result_type: 'recent').take(5).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}. Fav #{tweet.favorite_count}"
    end
  end
end
