class AuditLogPolicy < ApplicationPolicy
  def index?
    # Admin Users should be allowed to view index
    user.admin?
  end

  def confirm?
    (record.user_id == user.id && record.confirmed? == false) || index?
  end
end
