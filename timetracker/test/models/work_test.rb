# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  project_id     :integer
#  user_id        :integer
#  date_performed :date
#  hours          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
