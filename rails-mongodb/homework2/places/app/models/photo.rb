class Photo
  include Mongoid::Document

  attr_accessor :id                 # String
  attr_accessor :location           # Point
  attr_writer   :contents           # Raw Data

  def self.mongo_client
    Mongoid::Clients.default
  end

  def self.all(offset=0, limit=nil)
    if limit.nil?
      return Photo.mongo_client.database.fs.find.skip(offset).map { |doc| Photo.new(doc) }
    else
      return Photo.mongo_client.database.fs.find.skip(offset).limit(limit).map { |doc| Photo.new(doc) }
    end
  end

  def self.find(id)
    found_place = Photo.mongo_client.database.fs.find(_id: Photo.convert_id_for_find(id)).first
    found_place.nil? ? nil : Photo.new(found_place)
  end

  def self.convert_id_for_find(id)
    id.is_a?(String) ? BSON::ObjectId.from_string(id) : id
  end

  def self.convert_id(id)
    id.is_a?(String) ? id : id.to_s
  end

  def initialize(hash=nil)
    unless hash.nil?
      @id = Photo.convert_id(hash[:_id]) unless hash[:_id].nil?
      @location = Point.new(hash[:metadata][:location]) unless hash[:metadata].nil? && hash[:metadata][:location].nil?
      @place_id = Photo.convert_id_for_find(hash[:metadata][:place])
    end
  end

  def persisted?
    !@id.nil?
  end

  def contents
  end

  def destroy
    Photo.mongo_client.database.fs.find(_id: Photo.convert_id_for_find(id)).delete_one
  end

  def find_nearest_place_id(max_meters)
    point = Photo.find(@id).location
    place = Place.near(point, max_meters).limit(1).sort({ :location => 1 }).first[:_id]
  end

  def place
    Place.find(@place_id)
  end

  def place=(value)
    @place_id = Photo.convert_id_for_find(value)
  end

  def self.find_photos_for_place(find_by)
    place_id = Photo.convert_id_for_find(find_by)
    Photo.mongo_client.database.fs.find(metadata: { place: place_id})
  end

  def save
    unless persisted?
      gps = EXIFR::JPEG.new(@contents).gps
      @location = Point.new(lng: gps.longitude, lat: gps.latitude)
      description = { content_type: "image/jpeg", metadata: { location: { coordinates: [gps.longitude, gps.latitude] }, place: @place_id}}
      grid_file = Mongo::Grid::File.new(@contents.read, description)
      @contents.rewind
      @id = Photo.mongo_client.database.fs.insert_one(grid_file)
    else
      Photo.mongo_client.database.fs.find(_id: Photo.convert_id_for_find(id)).update_one(metadata: { location: { coordinates: [@location.longitude, @location.latitude] }, place: @place_id})
    end
  end
end
