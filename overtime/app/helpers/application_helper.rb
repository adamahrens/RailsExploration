module ApplicationHelper
  def active?(path)
    # Returns the active string if the current page is the same as the path
    # Used for applying css to _navbar
    "active" if current_page?(path)
  end
end
