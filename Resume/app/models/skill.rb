# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  title       :string
#  proficiency :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Skill < ApplicationRecord
  validates :title, :proficiency, presence: true
  validates :proficiency, numericality: { less_than_or_equal_to: 100, greater_than: 0 }
end
