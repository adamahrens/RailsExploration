module ApplicationHelper
  def navigation_active?(path)
    "active" if current_page?(path)
  end

  def is_admin?(user)
    #!user.type.nil?
    user.type == 'AdminUser'
  end
end
