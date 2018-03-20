class WorksController < ApplicationController
  def index
    @works = Work.all.order(created_at: :desc)
  end

  def show
    @work = Work.find(params[:id])
  end
end
