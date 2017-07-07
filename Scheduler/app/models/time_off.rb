class TimeOff < ApplicationRecord
  validates :date, :rationale, presence: true
end
