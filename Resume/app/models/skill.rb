# == Schema Information
#
# Table name: skills
#
#  badge       :text
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  proficiency :integer
#  title       :string
#  updated_at  :datetime         not null
#

class Skill < ApplicationRecord
  include Placeholder
  validates :title, :proficiency, presence: true
  validates :proficiency, numericality: { less_than_or_equal_to: 100, greater_than: 0 }

  # Run after Skill.new
  after_initialize :set_defaults

  def set_defaults
    # set a badge if it is null
    # useful if defaults arent set via a migration
    self.badge ||= Placeholder.image_generator(height: 100, width: 100)
  end
end
