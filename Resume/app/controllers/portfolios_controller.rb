class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[edit update show destroy]
  layout 'portfolio'

  def index
    @portfolios = Portfolio.all
    @page_title += ' | My Portfolio'
    # Custom scope usage
    # @portfolios = Portfolio.designers
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        #format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was removed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        #format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    tech_attr = %i[id name _destroy]
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :image,
                                      :thumbnail,
                                      technologies_attributes: tech_attr)
  end
end
