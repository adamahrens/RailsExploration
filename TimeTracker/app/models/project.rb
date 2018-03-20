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
end
