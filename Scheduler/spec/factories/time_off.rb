FactoryGirl.define do
  factory :time_off1, class: 'TimeOff' do
    date Date.today
    rationale 'I need a vacation'
    user
  end

  factory :time_off2, class: 'TimeOff' do
    date Date.yesterday
    rationale 'Just want some time off'
    user
  end
end
