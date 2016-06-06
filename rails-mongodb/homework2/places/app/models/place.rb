class Place
  include Mongoid::Document

  attr_accessor :id                 # String
  attr_accessor :formatted_address  # String
  attr_accessor :location           # Point
  attr_accessor :address_components # AddressComponent Array

  def self.mongo_client
    Mongoid::Clients.default
  end

  def self.collection
    self.mongo_client[:places]
  end

  def self.load_all(io_file)
    file = File.read(io_file)
    json_string = JSON.parse(file)
    self.collection.insert_many(json_string)
  end

  def self.convert_id(id)
    id.is_a?(String) ? id : id.to_s 
  end

  def initialize(hash)
    @id = Place.convert_id(hash[:_id])
    @formatted_address = hash[:formatted_address]
    @address_components = []
    hash[:address_components].each { |address_hash|
      @address_components << AddressComponent.new(address_hash)
    }

    @location = Point.new(hash[:geometry][:location])
  end
end
