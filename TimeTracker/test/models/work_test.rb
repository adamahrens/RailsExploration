# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  date_performed :datetime
#  hours          :integer
#  project_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
