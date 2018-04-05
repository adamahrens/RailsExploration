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

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    flash[:notice] = 'Company successfully created'
    redirect_to @company if @company.save
  end

  private

  def company_params
    params[:company].permit(:name)
  end
end
