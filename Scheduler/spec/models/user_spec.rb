require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: 'first@last.com', first_name: 'First', last_name: 'Last', password: 'password123', password_confirmation: 'password123')
    end
    it 'can create a User' do
      expect(@user).to be_valid
    end

    it 'can not be created without first_name and last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
