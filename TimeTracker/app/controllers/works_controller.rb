class WorksController < ApplicationController
  def index
    recents = Work.recentdays(params[:days]).order(date_performed: :desc)
    all = Work.all.order(date_performed: :desc)
    @works = params[:days] ? recents : all
  end

  def show
    @work = Work.find(params[:id])
  end
end
