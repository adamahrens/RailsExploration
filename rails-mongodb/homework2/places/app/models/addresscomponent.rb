class AddressComponent
  attr_accessor :long_name
  attr_accessor :short_name
  attr_accessor :types

  def initialize(hash)
    @long_name = hash[:long_name]
    @short_name = hash[:short_name]
    @types = hash[:types]
  end
end
