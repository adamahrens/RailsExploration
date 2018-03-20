# == Schema Information
#
# Table name: audit_logs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :integer          default(0)
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AuditLog < ApplicationRecord
  belongs_to :user
  validates :user_id, :status, :start_date, presence: true
  enum status: { pending: 0, confirmed: 1 }
  after_initialize :set_defaults
  before_update :set_end_date, if: :confirmed?

  scope :by_start_date, -> { order(start_date: :desc) }

  private
  def set_defaults
    # If start date passed in use it, otherwise use default
    self.start_date ||= Date.today - 6.days
  end

  def set_end_date
    self.end_date = Date.today
  end
end
