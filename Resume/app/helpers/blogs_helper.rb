module BlogsHelper
  def gravatar_helper(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    default_url = "https://via.placeholder.com/#{size}"
    url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
    image_tag url, alt: user.name
  end
end
