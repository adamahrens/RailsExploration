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
  after_initialize :set_defaults

  private
  def set_defaults
    # If start date passed in use it, otherwise use default
    self.start_date ||= Date.today - 6.days
  end
end
