# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CompaniesController < ApplicationController
	def index
		@companies = Company.all
		respond_to do |format|
			format.html
			format.json { render json: @companies }
		end
	end

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			flash[:notice] = "#{@company.name} created successfully"
			redirect_to @company
		else
			# Validation errors, show the form again
			render 'new'
		end
	end

	private
	def company_params
		params.require(:company).permit(:name)
	end
end
