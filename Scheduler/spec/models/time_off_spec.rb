require 'rails_helper'

RSpec.describe TimeOff, type: :model do
  before do
    @user = User.create(email: 'first@last.com', first_name: 'First', last_name: 'Last', password: 'password123', password_confirmation: 'password123')
    @timeoff = TimeOff.create(date: Date.today, rationale: 'Vacation', user_id: @user.id)
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
