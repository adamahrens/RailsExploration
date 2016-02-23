# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  project_id     :integer
#  user_id        :integer
#  date_performed :date
#  hours          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class WorksController < ApplicationController
	before_action :find_work, only: [:show, :edit, :update]

	def index
		if params[:days]
			@works = Work.recent_days(params[:days]).order('date_performed desc').includes(:user).includes(:project)
		else
			# Include prevents N+1 queries in the View
			# @works.project.name would have caused an N+1 query
			@works = Work.all.includes(:user).includes(:project)
		end

		respond_to do |format|
			format.html
			format.json { render json: @works }
		end
	end

	def show
		# before_action finds the work
	end

	def new
		@work = Work.new
		@projects = Project.all
		@users = User.all.order('last_name', 'first_name')
	end

	def create
		@work = Work.new(work_params)

		# upload document. While this saves to a public folder
		# could use cloud storage, etc
		file_to_upload = params[:document]
		if file_to_upload
			File.open(Rails.root.join('public', 'uploads', file_to_upload.original_filename), 'wb') do |file|
				file.write(file_to_upload.read)
				@work.document = file_to_upload.original_filename
			end
		end

		if @work.save
			flash[:notice] = "Work created successfully"
			redirect_to @work
		else
			# Validation errors, show the form again
			@projects = Project.all
			@users = User.all.order('last_name', 'first_name')
			render 'new'
		end
	end

	def edit
		# before_action handles finding the work
		@projects = Project.all
		@users = User.all.order('last_name', 'first_name')
	end

	def update
		# before_action handles finding the work
		if @work.update(work_params)
			flash[:notice] = "Work updated successfully"
			redirect_to @work
		else
			@projects = Project.all
			@users = User.all.order('last_name', 'first_name')
			render 'edit'
		end
	end

	def find_work
		@work = Work.find(params[:id])
	end

	private
	def work_params
		params.require(:work).permit(:project_id, :user_id, :date_performed, :hours)
	end
end
