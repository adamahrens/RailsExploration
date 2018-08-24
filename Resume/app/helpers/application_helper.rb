# Login logic
module ApplicationHelper
  def navigation_helper(style, tag)
    navigation_links.map { |name, path|
      content_tag tag do
        content_tag :a, href: path, class: "#{style} active" do
          name.to_s.capitalize
        end
      end
    }.join("\n").html_safe
  end

  def navigation_links
    { home: home_path,
      about: about_path,
      contact: contact_path,
      blogs: blogs_path,
      portfolios: portfolios_path }
  end

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
      login = link_to 'Login', new_user_session_path, class: "nav-link"
      register = link_to 'Register', new_user_registration_path, class: "nav-link"
      [content_tag(:span, login), content_tag(:span, register)].join(' ').html_safe
    else
      logout = link_to 'Logout', destroy_user_session_path, method: :delete, class: "nav-link"
      content_tag(:span, logout)
    end
  end

  def login_helper_blogs
    if current_user.is_a?(GuestUser)
      login = link_to 'Login', new_user_session_path, class: 'p-2 text-muted'
      register = link_to 'Register', new_user_registration_path, class: 'p-2 text-muted'
      [content_tag(:span, login), content_tag(:span, register)].join(' ').html_safe
    else
      logout = link_to 'Logout', destroy_user_session_path, method: :delete, class: 'p-2 text-muted'
      content_tag(:span, logout)
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
