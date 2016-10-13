class PostPolicy < ApplicationPolicy
  # Only want a User to update their own Post or if they are an Admin
  def update?
    record.user_id == user.id || user.admin?
  end
end
