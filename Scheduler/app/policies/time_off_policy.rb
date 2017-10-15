class TimeOffPolicy < ApplicationPolicy
  def update?
    # The User who created the TimeOff should only be allowed to edit their own
    # Otherwise Admin Users should be allowed to edit
    record.user_id == user.id || user.admin?
  end
end
