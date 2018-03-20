class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
    @project = params[:slug] ? Project.find_by(slug: params[:slug]) : Project.find(params[:id])
  end
end
