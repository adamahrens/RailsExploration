class Company < ActiveRecord::Base
	has_many :users
	has_many :projects

	validates_length_of :name, minimum: 5, 'Company name must be greater than 4 characters'
end
