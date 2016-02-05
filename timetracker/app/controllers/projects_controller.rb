class ProjectsController < ApplicationController
	def index
		@projects = Project.all.includes(:company)
	end

	def show
		@project = Project.find(params[:id])
	end
end
