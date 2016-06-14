class Photo
  include Mongoid::Document

  attr_accessor :id                 # String
  attr_accessor :location           # Point
  attr_writer   :contents           # Raw Data

  def self.mongo_client
    Mongoid::Clients.default
  end

  def self.convert_id(id)
    id.is_a?(String) ? id : id.to_s
  end

  def initialize(hash)
    @id = Photo.convert_id(hash[:_id])
    @location = Point.new(hash[:metadata][:location]) unless hash[:metadata][:location].nil?
  end

  def persisted?
    !@id.nil?
  end

  def save
    unless persisted?
      
    end
  end
end
