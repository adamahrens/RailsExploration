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

  def self.find_by_short_name(short_name)
    Place.collection.find("address_components.short_name" => short_name)
  end

  def self.to_places(mongo_documents)
    places = []
    mongo_documents.each { |document_hash|
      places << Place.new(document_hash)
    }
    places
  end

  # Standard Queries
  def self.find(id)
    found_place = Place.collection.find(_id: Place.convert_id_for_find(id)).first
    found_place.nil? ? nil : Place.new(found_place)
  end

  def self.convert_id_for_find(id)
    id.is_a?(String) ? BSON::ObjectId.from_string(id) : id
  end

  def self.all(offset=0, limit=nil)
    if limit.nil?
      return Place.to_places(Place.collection.find.skip(offset))
    else
      return Place.to_places(Place.collection.find.skip(offset).limit(limit))
    end
  end

  # Aggregation
  def self.get_address_components(sort=nil, offset=nil, limit=nil)
    aggregate = [{:$project => {address_components: 1, formatted_address: 1, :"geometry.geolocation" => 1}}, { :$unwind => '$address_components'}]
    aggregate << {:$sort => sort}   unless sort.nil?
    aggregate << {:$skip => offset} unless offset.nil?
    aggregate << {:$limit => limit} unless limit.nil?
    Place.collection.find.aggregate(aggregate)
  end

  def self.get_country_names
    aggregate = [{:$project => {:"address_components.long_name" => 1, :"address_components.types" => 1}}]
    aggregate << {:$unwind => '$address_components'}
    aggregate << {:$match => {:"address_components.types" => {:$in => ["country"]}}}
    aggregate << {:$group => {:_id => '$address_components.long_name'}}
    Place.collection.find.aggregate(aggregate).to_a.map { |document| document[:_id] }
  end

  def self.find_ids_by_country_code(country_code)
    aggregate = [{:$match => {:"address_components.short_name" => country_code}}]
    Place.collection.find.aggregate(aggregate).to_a.map { |document| document[:_id].to_s }
  end

  def destroy
    Place.collection.find(_id: Place.convert_id_for_find(@id)).delete_one()
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
