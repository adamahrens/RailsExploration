class AuditLogsController < ApplicationController
  before_action :find_audit_log, only: [:confirm]

  def index
    @audit_logs = AuditLog.all
    .includes(:user)
    .page(params[:page])

    # Uses Pundit to validate against audit_log_policy
    authorize @audit_logs
  end

  def confirm
    authorize @audit_log
    @audit_log.confirmed!
    flash[:notice] = 'Audit has been confirmed'
    redirect_to root_path
  end

  def show
  end

  def create
  end

  def update
  end

  private

  def find_audit_log
    @audit_log = AuditLog.find(params[:id])
  end
end
