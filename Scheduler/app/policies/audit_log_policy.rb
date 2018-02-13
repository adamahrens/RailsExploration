class AuditLogPolicy < ApplicationPolicy
  def index?
    # Admin Users should be allowed to view index
    user.admin?
  end
end
