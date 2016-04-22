class Racer
  include Mongoid::Document
  include ActiveModel::Model

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

  def self.paginate(params)
    page  = (params[:page] || 1).to_i
    limit = (params[:per_page] || 30).to_i
    offset  = (page - 1) * limit

    racers = []
    documents = Racer.collection.find.sort(number: 1).skip(offset).limit(limit)
    #documents = Racer.collection.find.sort(number: 1)
    documents.each { |document|
      racers << Racer.new(document)
    }

    total = Racer.all.count

    WillPaginate::Collection.create(page, limit, total) do |pager|
      pager.replace(racers)
    end
  end

  # ActiveModel
  def persisted?
    !@id.nil?
  end

  def created_at
    nil
  end

  def updated_at
    nil
  end

  # Could be a string or BSON::ObjectId
  def self.find(id)
    # Find the Racer document if it exists
    racer = Racer.collection.find(_id: Racer.convert_id_for_find(id)).first
    return racer.nil? ? nil : Racer.new(racer)
  end

  def self.convert_id_for_find(id)
    id.is_a?(String) ? BSON::ObjectId.from_string(id) : id
  end

  # instance methods
  def initialize(params={})
    @id = params[:_id].nil? ? params[:id] : params[:_id].to_s
    set_racer(params)
  end

  def save
    document = Racer.collection.insert_one(racer_hash)
    @id = document.inserted_id.to_s
  end

  def update(params)
    set_racer(params)
    Racer.collection.find(_id: Racer.convert_id_for_find(@id)).update_one(params)
  end

  def destroy
    Racer.collection.find(_id: Racer.convert_id_for_find(@id)).delete_one()
  end

  private
  def racer_hash
    return { number: @number, first_name: @first_name, last_name: @last_name, gender: @gender, group: @group, secs: @secs }
  end

  def set_racer(params)
    @number = params[:number].to_i
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @gender = params[:gender]
    @group = params[:group]
    @secs = params[:secs].to_i
  end
end
