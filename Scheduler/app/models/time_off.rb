# == Schema Information
#
# Table name: time_offs
#
#  id         :integer          not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer          default("submitted")
#

class TimeOff < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates :date, :rationale, presence: true
  scope :time_off_by, ->(user) { where(user_id: user.id) unless user.admin? }
end
