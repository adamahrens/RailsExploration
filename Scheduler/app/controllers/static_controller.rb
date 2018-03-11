class StaticController < ApplicationController
  def homepage
    @pending_approvals = TimeOff.all.where(status: 0).includes(:user)
    @recents = AuditLog.all.order(:created_at).limit(10).includes(:user)
  end
end
