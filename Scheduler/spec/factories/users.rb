# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  type                   :string
#

FactoryGirl.define do

  # To avoid validation logic with device to ensure unique emails
  sequence :email do |number|
    "email#{number}@test.com"
  end

  factory :user, class: 'User' do
    first_name 'Leroy'
    last_name 'Jenkins'
    email { generate :email }
    password 'hello1234'
    password_confirmation 'hello1234'
    phoneNumber '6513331112'
    ssn 1234
    company 'When I Work'
  end

  factory :user_two, class: 'User' do
    first_name 'Donald'
    last_name 'Duck'
    email { generate :email }
    password 'hello1234'
    password_confirmation 'hello1234'
    phoneNumber '6513331113'
    ssn 4567
    company 'When I Work'
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'hello1234'
    password_confirmation 'hello1234'
    phoneNumber '6513331114'
    ssn 9999
    company 'When I Work'
  end
end
