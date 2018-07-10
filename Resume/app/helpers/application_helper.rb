# Login logic
module ApplicationHelper
  def login_links_helper
    if current_user.is_a?(User) && user_signed_in?
      logout = link_to 'Logout', destroy_user_session_path, method: :delete
      content_tag :div, logout
    else
      login = link_to 'Login', new_user_session_path
      register = link_to 'Register', new_user_registration_path
      content_tag :div do
        [login, register].join(' | ').html_safe
      end
    end
  end

  def source_helper
    return unless session[:source]
    content_tag :div do
      hr = content_tag(:hr)
      p = content_tag(:p, "Thanks for coming from #{session[:source]}")
      hr + p
    end
  end
end
