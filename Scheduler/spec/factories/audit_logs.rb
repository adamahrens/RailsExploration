# == Schema Information
#
# Table name: audit_logs
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  status     :integer          default("pending")
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :audit_log do
    user
    status 0
    start_date (Date.today - 6.days)
    end_date nil
  end
end
