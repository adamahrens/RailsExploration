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
end
