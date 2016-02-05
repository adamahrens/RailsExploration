class Project < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :users, through: :works

  validates_length_of :name, minimum: 5, message: 'Company name must be greater than 4 characters'
  validates_length_of :slug, minimum: 3, message: 'Must have a Slug field'
  validates_uniqueness_of :slug
  validates_presence_of :company, message: 'Project must belong to a Project'
  validates_numericality_of :default_rate, greater_than_or_equal_to: 50, message: 'Default rate must be >= 50'
end
