FactoryGirl.define do
  factory :time_off1, class: 'TimeOff' do
    date Date.today
    rationale 'I need a vacation'
    daily_hours 1.5
    user
  end

  factory :time_off2, class: 'TimeOff' do
    date Date.yesterday
    rationale 'Just want some time off'
    daily_hours 0.35
    user
  end
end
