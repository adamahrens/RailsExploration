class CompaniesController < ApplicationController
	def index
		@companies = Company.all
		respond_to do |format| 
			format.html 
			format.json {render json: @companies }
		end
	end

	def show
		@company = Company.find(params[:id])
	end
end
