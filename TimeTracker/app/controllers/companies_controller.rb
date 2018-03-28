class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(created_at: :desc)
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @companies }
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @company }
    end
  end
end
