# == Schema Information
#
# Table name: time_offs
#
#  id               :integer          not null, primary key
#  date             :date
#  rationale        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  status           :integer          default("submitted")
#  overtime_request :decimal(, )      default(0.0)
#

class TimeOff < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates :date, :rationale, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  scope :time_off_by, ->(user) { where(user_id: user.id) unless user.admin? }

  after_save :update_audit_logs

  private
  def update_audit_logs
    audit_log = AuditLog.where(user_id: user_id, start_date: (date - 7.days..date)).last

    unless audit_log.nil?
      audit_log.status = 1
      audit_log.save!
    end
  end
end
