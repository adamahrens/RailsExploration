class Post < ActiveRecord::Base

	# Creates the getters and setters that can be set on Post model
	attr_accessor :title, :body, :category_id, :author_id

	# Post belongs to a single Category
	belongs_to :category
end
