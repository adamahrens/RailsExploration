# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User must belong to a Company' do
    company = Company.create(name: 'Happy LLC')
    user = User.new(first_name: 'First', last_name: 'MyLastName')
    assert_not user.valid?

    user.company_id = company.id
    assert user.valid?
  end

  test 'User last name has to be greater than 4 letters' do
    company = Company.create(name: 'Happy LLC')
    user = User.new(first_name: 'First', last_name: 'aaaa', company_id: company.id)
    assert_not user.valid?

    user.last_name = 'aaaaa'
    assert user.valid?
  end

  test 'User must have a first and last name to be valid' do
    company = Company.create(name: 'Happy LLC')
    user = User.new
    user.company = company
    assert_not user.valid?

    user.first_name = 'First'
    assert_not user.valid?

    user.last_name = 'Last!'
    user.save
    assert user.valid?
  end

  test 'User full name is combination of first and last' do
    company = Company.create(name: 'Happy LLC')
    user = User.new(first_name: 'First', last_name: 'Last!', company_id: company.id)
    assert user.full_name == 'First Last!'
  end
end
