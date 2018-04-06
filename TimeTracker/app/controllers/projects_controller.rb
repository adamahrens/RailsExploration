class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(created_at: :desc)
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @project = params[:slug] ? Project.find_by(slug: params[:slug]) : Project.find(params[:id])
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project successfully created'
      redirect_to @project
    else
      render :new
    end
  end

  private

  def project_params
    params[:project].permit(:company_id, :name, :default_rate)
  end
end
