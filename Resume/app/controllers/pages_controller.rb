class PagesController < ApplicationController
  def home
    @skills = Skill.all
    @portfolios = Portfolio.all.limit(5)
  end

  def about
    @page_title += ' | About'
  end

  def contact
    @page_title += ' | Contact'
  end
end
