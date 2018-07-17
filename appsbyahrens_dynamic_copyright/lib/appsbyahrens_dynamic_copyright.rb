require "appsbyahrens_dynamic_copyright/version"

module AppsbyahrensDynamicCopyright
  # Dynamic Copyright
  class Renderer
    def self.copyright(name, message)
      "<div>&copy; #{Time.now.year} | <b>#{name}</b> #{message}</div>".html_safe
    end
  end
end
