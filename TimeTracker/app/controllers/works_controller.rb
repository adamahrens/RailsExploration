class WorksController < ApplicationController
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
    @work = Work.find(params[:id])
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @work }
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    flash[:notice] = 'Work successfully created'
    redirect_to @work if @work.save
  end

  private

  def work_params
    params[:work].permit(:project_id, :user_id, :hours, :date_performed)
  end
end
