class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.includes(:user).page params[:page]

    # Uses Pundit to validate against audit_log_policy
    authorize @audit_logs
  end

  def show
  end

  def create
  end

  def update
  end
end
