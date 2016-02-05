class User < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :projects, through: :works

  validates_length_of :first_name, minimum: 2, message: 'First name must be greater than 1 character'
  validates_length_of :last_name, minimum: 5, message: 'Last name must be greater than 4 characters'
  validates_presence_of :company, message: 'User must belog to a Company'
  
end
