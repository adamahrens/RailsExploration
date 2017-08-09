require 'rails_helper'

RSpec.describe TimeOff, type: :model do
  describe 'creation' do
    before do
      @timeoff = TimeOff.create(date: Date.today, rationale: 'Vacation')
    end

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
