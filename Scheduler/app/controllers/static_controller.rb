class StaticController < ApplicationController
  def homepage
    # Only want for Admin Users
    if current_user.admin?
      @pending_approvals = TimeOff.all.where(status: 0).includes(:user)
      @recents = AuditLog.all.order(:created_at).limit(10).includes(:user)
    else
      @pending_audit_confirmations = current_user.audit_logs.where(status: 0).by_start_date
    end
  end
end
