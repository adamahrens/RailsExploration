# == Schema Information
#
# Table name: hands
#
#  id         :bigint(8)        not null, primary key
#  hand_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :hand do
    hand_id 1
    user_id 1
  end
end
