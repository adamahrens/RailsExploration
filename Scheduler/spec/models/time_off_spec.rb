# == Schema Information
#
# Table name: time_offs
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  rationale   :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#  status      :integer          default("submitted")
#  daily_hours :decimal(, )      default(0.0)
#

require 'rails_helper'

RSpec.describe TimeOff, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @timeoff = FactoryGirl.create(:time_off1)
  end

  describe 'creation' do
    it 'can create a TimeOff request' do
      expect(@timeoff).to be_valid
    end

    it 'cant be created without a date, daily_hours, and rationale' do
      @timeoff.date = nil
      @timeoff.rationale = nil
      @timeoff.daily_hours = nil
      expect(@timeoff).to_not be_valid
    end

    it 'must have a value for daily_hours greater than 0.0' do
      @timeoff.daily_hours = 0.0
      expect(@timeoff).to_not be_valid
    end
  end
end
