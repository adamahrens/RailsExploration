# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
	has_many :users
	has_many :projects

	validates_length_of :name, minimum: 2, message: 'Company name must be greater than 2 characters'

	def to_s
		name
  end
end
