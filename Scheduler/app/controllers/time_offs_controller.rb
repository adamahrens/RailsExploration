class TimeOffsController < ApplicationController
  before_action :find_time_off, only: [:show]

  def index
    @timeoff = TimeOff.all
  end

  def new
    @timeoff = TimeOff.new
  end

  def create
    @timeoff = TimeOff.create(time_off_params)
    @timeoff.user = current_user

    if @timeoff.save
      redirect_to time_off_path(@timeoff), notice: 'Time Off Request saved'
    else
      redirect_to new_time_off_path
    end
  end

  def show; end

  private

  def find_time_off
    @timeoff = TimeOff.find(params[:id])
  end

  def time_off_params
    params.require(:time_off).permit(:rationale, :date)
  end
end
