# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer          default(0)
#  overtime   :decimal(, )      default(0.0)
#

FactoryGirl.define do
  factory :first_post, class: Post do
    rationale "I don't feel well"
    date  Date.today
    overtime 8.0
    user
  end
  factory :second_post, class: Post do
    rationale "Heading up North"
    date  Date.yesterday
    overtime 8.0
    user
  end
end
