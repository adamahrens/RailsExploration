class StaticController < ApplicationController
  def homepage
    @pending_approvals = TimeOff.all.where(status: 0).includes(:user)
  end
end
