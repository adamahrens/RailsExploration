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

class Hand < ApplicationRecord
  belongs_to :user
  belongs_to :hand, class_name: 'User'
end
