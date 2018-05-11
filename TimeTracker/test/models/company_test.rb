# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'company must have a name to be valid' do
    company = Company.new
    assert_not company.valid?

    company.name = 'My Company LLC'
    assert company.valid?
  end
end
