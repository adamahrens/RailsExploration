# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  default_rate :decimal(, )
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Project < ApplicationRecord
  belongs_to :company
  has_many :works
  has_many :users, through: :works

  validates :name, length: { minimum: 5 }
  validates :company, presence: true
  validates :default_rate, numericality: { only_integer: true,
    greater_than: 49,
  less_than: 10000}
end
