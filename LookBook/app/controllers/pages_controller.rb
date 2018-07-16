class PagesController < ApplicationController
  def home
    @recent = Post.limit(5).order(created_at: :desc)
  end
end
