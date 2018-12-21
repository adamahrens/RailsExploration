class TopicsController < ApplicationController
  layout 'blog'

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.includes(:blogs).find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent
    else
      @blogs = @topic.blogs.published.recent
    end
  end
end
