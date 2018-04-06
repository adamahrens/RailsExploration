class WorksController < ApplicationController
  before_action :set_work, only: %i[show edit update]
  def index
    recents = Work.recentdays(params[:days]).order(date_performed: :desc)
    all = Work.all.order(date_performed: :desc)
    @works = params[:days] ? recents : all

    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @works }
    end
  end

  def show
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @work }
    end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      flash[:notice] = 'Work successfully updated'
      redirect_to @work
    else
      render :edit
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = 'Work successfully created'
      redirect_to @work
    else
      render :new
    end
  end

  private

  def work_params
    params[:work].permit(:project_id, :user_id, :hours, :date_performed)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
