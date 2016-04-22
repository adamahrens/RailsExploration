class Racer
  include Mongoid::Document

  # class methods
  def self.mongo_client
    Mongoid::Clients.default
  end

  def self.collection
    self.mongo_client[:racers]
  end

  def self.all(prototype={}, sort={ :number => 1 }, offset=0, limit=nil)
    if prototype.empty?
      return Racer.collection.find
    else
      if limit.nil?
        return Racer.collection.find(prototype).sort(sort).skip(offset)
      else
        return Racer.collection.find(prototype).sort(sort).skip(offset).limit(limit)
      end
    end
  end

  # instance methods
end
