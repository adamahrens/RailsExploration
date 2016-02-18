# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  company_id   :integer
#  default_rate :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#

class Project < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :users, through: :works

  validates :name, length: { minimum: 5, message: 'Company name must be greater than 4 characters' }
  validates :company presence: { message: 'Project must belong to a Project' }
  validates :slug, uniqueness: { message: 'Slug field must be unique' }, length: { minimum: 3, message: 'Must have a Slug field' }
  validates :default_rate, numericality: { greater_than_or_equal_to: 50, message: 'Default rate must be >= 50' }

  def to_s
  	"#{name} (#{company})"
  end
end
