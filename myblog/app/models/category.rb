class Category < ActiveRecord::Base
	# Allows us access to the category name
	attr_accessor :name

	# A Category has many Posts
	has_many :posts
end
