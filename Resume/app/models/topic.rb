# == Schema Information
#
# Table name: topics
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  title      :string
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
  validates :title, presence: true
  has_many :blogs
end
