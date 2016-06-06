class Point
  attr_accessor :longitude
  attr_accessor :latitude

  def initialize(hash)
    if hash.has_key?(:coordinates)
      @latitude = hash[:coordinates].last
      @longitude = hash[:coordinates].first
    elsif hash.has_key?(:lat) && hash.has_key?(:lng)
      @latitude = hash[:lat]
      @longitude = hash[:lng]
    end
  end

  def to_hash
    { type: "Point", coordinates: [@longitude, @latitude] }
  end
end
