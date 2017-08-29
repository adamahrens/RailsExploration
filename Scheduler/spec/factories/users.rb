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
  end

  factory :user_two, class: 'User' do
    first_name 'Donald'
    last_name 'Duck'
    email { generate :email }
    password 'hello1234'
    password_confirmation 'hello1234'
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'hello1234'
    password_confirmation 'hello1234'
  end
end
