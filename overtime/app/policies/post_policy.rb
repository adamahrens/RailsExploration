class PostPolicy < ApplicationPolicy
  # Only want a User to update their own Post or if they are an Admin
  def update?
    return true if record.approved? && user.admin?
    return true if (record.user_id == user.id || user.admin?) && !record.approved?
  end
end
