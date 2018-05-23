class PagesController < ApplicationController
  def home
    @skills = Skill.all
    @portfolios = Portfolio.all.limit(5)
  end

  def about
  end

  def contact
  end
end
