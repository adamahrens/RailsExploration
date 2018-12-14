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

require 'rails_helper'

RSpec.describe Hand, type: :model do
end
