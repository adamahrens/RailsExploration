class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update]
  before_action :authenticate_user!, except: :index
  before_action :check_user_admin, except: %i[index show]

  def index
    @companies = Company.all.order(created_at: :desc)
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @companies }
      format.csv { send_data @companies.to_csv }
    end
  end

  def show
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @company }
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      flash[:notice] = 'Company successfully updated'
      redirect_to @company
    else
      render :edit
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = 'Company successfully created'
      redirect_to @company
    else
      render :new
    end
  end

  private

  def check_user_admin
    redirect_to companies_path, notice: 'Only Admins can Add/Update Compaines' unless current_user.admin
  end

  def company_params
    params[:company].permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
