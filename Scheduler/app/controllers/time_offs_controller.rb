class TimeOffsController < ApplicationController
  before_action :find_time_off, only: [:show, :edit, :update, :destroy]

  def index
    # hash = { user_id: current_user.id } unless current_user.admin?
    # @timeoff = TimeOff.all.where(hash).order(created_at: :desc)
    @timeoff = TimeOff.time_off_by(current_user).order(created_at: :desc).includes([:user])
  end

  def new
    @timeoff = TimeOff.new
  end

  def show
  end

  def edit
    # Pundit
    authorize @timeoff
  end

  def destroy
    @timeoff.delete
    redirect_to time_offs_path, notice: 'Time off has been deleted'
  end

  def update
    # Pundit
    authorize @timeoff
    if @timeoff.update(time_off_params)
      redirect_to @timeoff, notice: 'Time Off has been updated'
    else
      render :edit
    end
  end

  def create
    @timeoff = TimeOff.create(time_off_params)
    @timeoff.user = current_user

    if @timeoff.save
      redirect_to time_off_path(@timeoff), notice: 'Time Off Request saved'
    else
      render :new
    end
  end

  private

  def find_time_off
    @timeoff = TimeOff.find(params[:id])
  end

  def time_off_params
    params.require(:time_off).permit(:rationale, :date, :status)
  end
end
