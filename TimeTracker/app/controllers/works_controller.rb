class WorksController < ApplicationController
  before_action :set_work, only: %i[show edit update]
  before_action :authenticate_user!, except: :index
  
  def index
    recents = Work.recentdays(params[:days]).order(date_performed: :desc)
    all = Work.all.order(date_performed: :desc)
    @works = params[:days] ? recents : all

    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @works }
      format.csv { send_data @works.to_csv }
    end
  end

  def show
    respond_to do |format|
      format.html # defaults to show.html.erb
      format.json { render json: @work }
    end
  end

  def edit
  end

  def update
    set_document
    if @work.update(work_params)
      flash[:notice] = 'Work successfully updated'
      redirect_to @work
    else
      render :edit
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    set_document
    if @work.save
      flash[:notice] = 'Work successfully created'
      redirect_to @work
    else
      render :new
    end
  end

  private

  def set_document
    unless params[:document].nil?
      file = params[:document]
      name = "#{@work.project_id}-#{@work.user_id}-#{file.original_filename}"
      @work.document = name
      File.open(Rails.root.join('public', 'documents', name), 'wb') do |f|
        f.write(file.read)
      end
    end
  end

  def work_params
    params[:work].permit(:project_id, :user_id, :hours, :date_performed, :document)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
