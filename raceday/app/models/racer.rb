class Racer
	attr_accessor :id, :number, :first_name, :last_name, :gender, :group, :secs

	def initialize(params={})
		@id         = params[:_id].nil? ? params[:id] : params[:_id].to_s
		@number     = params[:number].to_i
		@first_name = params[:first_name]
		@last_name  = params[:last_name]
		@gender     = params[:gender]
		@group      = params[:group]
		@secs       = params[:secs].to_i
	end

	def self.mongo_client
		Mongoid::Clients.default
	end

	def self.collection
		Racer.mongo_client[:racers]
	end

	def self.all(prototype={}, sort = {}, skip=0, limit=nil)
		sort.empty? ? self.collection.find(prototype).sort(:number => 1).skip(skip).limit(limit) : self.collection.find(prototype).sort(sort).skip(skip).limit(limit)
	end

	def self.find(id)
		racer = self.collection.find(:_id => id)
		racer.nil? ? nil : Racer.new(racer)
	end
end