FactoryGirl.define do
  factory :first_post, class: Post do
    rationale "I don't feel well"
    date  Date.today
    user
  end
  factory :second_post, class: Post do
    rationale "Heading up North"
    date  Date.yesterday
    user
  end
end
