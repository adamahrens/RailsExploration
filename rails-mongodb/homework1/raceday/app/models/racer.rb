class Racer
  include Mongoid::Document

  attr_accessor :id, :number, :first_name, :last_name, :gender, :group, :secs

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

  def self.find
  end

  # instance methods
  def initialize(params={})
    @id = params[:_id].nil? ? params[:id] : params[:_id].to_s
    @number = params[:number].to_i
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @gender = params[:gender]
    @group = params[:group]
    @secs = params[:secs].to_i
  end
end
