module PortfoliosHelper
  def image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_image(image, type)
    if image.model.image? || image.model.thumbnail?
      image
    elsif type == 'thumbnail'
      image_generator(height: 150, width: 150)
    else
      image_generator(height: 300, width: 300)
    end
  end
end
