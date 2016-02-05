class Company < ActiveRecord::Base
	has_many :users
	has_many :projects

	validates_length_of :name, minimum: 2, message: 'Company name must be greater than 2 characters'
end
