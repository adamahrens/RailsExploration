class PagesController < ApplicationController
  def home
    @portfolios = Portfolio.all.limit(5)
  end

  def about
    @page_title += ' | About'
    @skills = Skill.all
  end

  def contact
    @page_title += ' | Contact'
  end

  def tech_news
    @page_title += ' | News'
    @rails_tweets = SocialTool.twitter_search('#rubyonrails')
    @swifty_tweets = SocialTool.twitter_search('#swiftlang')
  end
end
