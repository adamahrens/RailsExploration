# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  company_id   :integer
#  default_rate :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#

class ProjectsController < ApplicationController
	def index
		@projects = Project.all.includes(:company)
		respond_to do |format| 
			format.html 
			format.json { render json: @projects }
		end
	end

	def show
		if params[:slug]
			@project = Project.find_by_slug(params[:slug])
		else
			@project = Project.find(params[:id])
		end
	end
end
