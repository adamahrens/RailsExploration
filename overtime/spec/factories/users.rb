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
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    first_name "John"
    last_name  "Doe"
    password   "password123!"
    password_confirmation "password123!"
    email
  end

  factory :admin_user, class: AdminUser do
    first_name "Bruce"
    last_name  "Wayne"
    password   "I4MB4TM4N!"
    password_confirmation "I4MB4TM4N!"
    email
  end
end
