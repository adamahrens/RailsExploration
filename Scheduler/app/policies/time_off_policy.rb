class TimeOffPolicy < ApplicationPolicy
  def update?
    # The User who created the TimeOff should only be allowed to edit their own
    # As long as it's not approved
    # Otherwise Admin Users should be allowed to edit
    (record.user_id == user.id && record.approved? == false) || user.admin?
  end
end
