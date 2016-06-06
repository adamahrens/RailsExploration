class Place
  include Mongoid::Document

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
end
