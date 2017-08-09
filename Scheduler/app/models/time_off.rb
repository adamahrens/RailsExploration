class TimeOff < ApplicationRecord
  belongs_to :user
  validates :date, :rationale, presence: true
end
