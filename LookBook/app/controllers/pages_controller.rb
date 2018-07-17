class PagesController < ApplicationController
  def home
    if current_user
      # Get recent Tweets
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.secrets.twitter_key
        config.consumer_secret     = Rails.application.secrets.twitter_secret
        config.access_token        = current_user.oauth_token
        config.access_token_secret = current_user.oauth_secret
      end

      @tweets = client.user_timeline
      Rails.logger.info(@tweets)
    end

    @recent = Post.limit(5).order(created_at: :desc)
  end
end
