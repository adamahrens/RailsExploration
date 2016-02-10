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
end
