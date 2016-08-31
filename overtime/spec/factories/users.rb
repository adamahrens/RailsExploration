FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    password   "password123!"
    confirmation_password "password123!"
  end

  factory :admin_user, class: 'AdminUser' do
    first_name "Bruce"
    last_name  "Wayne"
    password   "I4MB4TM4N!"
    confirmation_password "I4MB4TM4N!"
  end
end
