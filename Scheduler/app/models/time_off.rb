# == Schema Information
#
# Table name: time_offs
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  rationale   :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#  status      :integer          default("submitted")
#  daily_hours :decimal(, )      default(0.0)
#

class TimeOff < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates :date, :rationale, :daily_hours, presence: true
  validates :daily_hours, numericality: { greater_than: 0.0 }
  scope :time_off_by, ->(user) { where(user_id: user.id) unless user.admin? }

  after_save :confirm_audit_logs, if: :submitted?
  after_save :unconfirm_audit_logs, if: :rejected?

  private
  def confirm_audit_logs
    audit_log = AuditLog.where(user_id: user_id, start_date: (date - 7.days..date)).last

    unless audit_log.nil?
      audit_log.status = 1
      audit_log.save!
    end
  end

  def unconfirm_audit_logs
    audit_log = AuditLog.where(user_id: user_id, start_date: (date - 7.days..date)).last

    unless audit_log.nil?
      audit_log.status = 0
      audit_log.save!
    end
  end
end
