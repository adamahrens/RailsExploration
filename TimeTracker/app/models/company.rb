# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  extend CsvModule
  
  has_many :projects
  has_many :users

  validates :name, length: { minimum: 5 }

  def to_s
    name
  end
end
