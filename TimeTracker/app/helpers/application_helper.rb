module ApplicationHelper

  # List of nav items
  def nav_items
    [
      { display_text: 'Companies',
        controller_name: 'companies',
      path: companies_path },
      { display_text: 'Projects',
        controller_name: 'projects',
      path: projects_path },
      { display_text: 'Works',
        controller_name: 'works',
      path: works_path }
    ]
  end

  # Displays nav item
  def display_nav_item(display_text, controller, link_url)
    css_class = controller_name == controller ? 'class="active"' : ''
    link = link_to display_text, link_url
    raw("<li #{css_class}>#{link}</li>")
  end
end
