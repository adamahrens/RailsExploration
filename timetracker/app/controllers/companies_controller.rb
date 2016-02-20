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
	before_action :find_company, only: [:show, :edit, :update]
	
	def index
		@companies = Company.all
		respond_to do |format|
			format.html
			format.json { render json: @companies }
		end
	end

	def show
		# before_action handles finding the company
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

	def edit
		# before_action handles finding the company
	end

	def update
		# before_action handles finding the company
		if @company.update(company_params)
			flash[:notice] = "#{@company.name} updated successfully"
			redirect_to @company
		else
			render 'edit'
		end
	end

	def find_company
		@company = Company.find(params[:id])
	end

	private
	def company_params
		params.require(:company).permit(:name)
	end
end
