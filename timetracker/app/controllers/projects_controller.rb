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
	before_action :find_project, only: [:edit, :update]
	before_filter :authenticate_user!

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

	def new
		@project = Project.new
		@companies = Company.all
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "#{@project.name} created successfully"
			redirect_to @project
		else
			# Validation errors, show the form again
			@companies = Company.all
			render 'new'
		end
	end

	def edit
		# before_action handles finding the work
		@companies = Company.all
	end

	def update
		# before_action handles finding the work
		if @project.update(project_params)
			flash[:notice] = "Work updated successfully"
			redirect_to @project
		else
			@companies = Company.all
			render 'edit'
		end
	end

	def find_project
		@project = Project.find(params[:id])
	end

	private
	def project_params
		params.require(:project).permit(:name, :company_id, :default_rate, :slug)
	end
end
