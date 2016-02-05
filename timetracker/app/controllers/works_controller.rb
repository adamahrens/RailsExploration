class WorksController < ApplicationController
	def index
		# Include prevents N+1 queries in the View
		# @works.project.name would have caused an N+1 query
		@works = Work.all.includes(:user).includes(:project)
	end

	def show
		@work = Work.find(params[:id])
	end
end
