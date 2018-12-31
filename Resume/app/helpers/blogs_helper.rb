# frozen_string_literal: true

module BlogsHelper
  def gravatar_helper(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    default_url = "https://via.placeholder.com/#{size}"
    base_url = 'http://gravatar.com'
    url = "#{base_url}/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    image_tag url, alt: user.name
  end

  # Adding Helper to return div
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    options = { fenced_code_blocks: true, no_intra_emphasis: true, autolink: true, lax_html_blocks: true }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
