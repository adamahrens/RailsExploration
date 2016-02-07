# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  company_id   :integer
#  default_rate :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#

require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
