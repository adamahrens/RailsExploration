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
