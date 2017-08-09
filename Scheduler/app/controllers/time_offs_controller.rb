class TimeOffsController < ApplicationController
  def index; end

  def new
    @timeoff = TimeOff.new
  end
end
