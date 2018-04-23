class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update]
  before_action :authenticate_user!, except: :index

  def index
    @projects = Project.all.order(created_at: :desc)
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @project }
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project successfully updated'
      redirect_to @project
    else
      render :edit
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

  def set_project
    slug = params[:slug]
    if slug
      @project = Project.find_by(slug: slug)
    else
      @project = Project.find(params[:id])
    end
  end
end
