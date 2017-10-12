# == Schema Information
#
# Table name: time_offs
#
#  id         :integer          not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer          default("submitted")
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

    it 'cant be created without a date and rationale' do
      @timeoff.date = nil
      @timeoff.rationale = nil
      expect(@timeoff).to_not be_valid
    end
  end
end
