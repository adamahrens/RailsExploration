# Login logic
module ApplicationHelper
  def login_links_helper(style)
    if style == 'application'
      login_helper_application
    elsif style == 'blogs'
      login_helper_blogs
    else
      login_helper_portfolio
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

  def active_class?(path)
    return 'active' if request.path == path
    ''
  end

  def dynamic_copyright(name, message)
    "<div>&copy; #{Time.now.year} | <b>#{name}</b> #{message}</div>".html_safe
  end

  private

  def login_helper_application
    if current_user.is_a?(GuestUser)
      login = link_to 'Login', new_user_session_path, class: "nav-link #{ active_class?(new_user_session_path) }"
      register = link_to 'Register', new_user_registration_path, class: "nav-link #{ active_class?(new_user_registration_path) }"
      [login, register].join(' ').html_safe
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: "nav-link #{ active_class?(destroy_user_session_path) }"
    end
  end

  def login_helper_blogs
    if current_user.is_a?(GuestUser)
      login = link_to 'Login', new_user_session_path, class: 'p-2 text-muted'
      register = link_to 'Register', new_user_registration_path, class: 'p-2 text-muted'
      [login, register].join(' ').html_safe
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: 'p-2 text-muted'
    end
  end

  def login_helper_portfolio
    if current_user.is_a?(GuestUser)
      login = link_to 'Login', new_user_session_path
      register = link_to 'Register', new_user_registration_path
      [content_tag(:li, login), content_tag(:li, register)].join('').html_safe
    else
      link_to 'Logout', destroy_user_session_path, method: :delete
    end
  end
end
