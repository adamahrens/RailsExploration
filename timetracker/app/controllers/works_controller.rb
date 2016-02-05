class WorksController < ApplicationController
	def index
		if params[:days]
			@works = Work.recent_days(params[:days]).order('date_performed desc').includes(:user).includes(:project)
		else
			# Include prevents N+1 queries in the View
			# @works.project.name would have caused an N+1 query
			@works = Work.all.includes(:user).includes(:project)
		end
	end

	def show
		@work = Work.find(params[:id])
	end
end
