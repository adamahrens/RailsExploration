FactoryGirl.define do
  factory :first_post do
    rationale "I don't feel well"
    date  Date.today
  end
  factory :second_post, class: "Post" do
    rationale "Heading up North"
    date  Date.yesterday
  end
end
