require 'rails_helper'

describe 'admin' do
  describe 'dashboard' do
    it 'cant be accessed unlessed signed in' do
      visit admin_root_path
      expect(current_path).to eq(new_user_session_path)
    end

    it 'cant be accessed by non-admin users' do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit admin_root_path
      expect(current_path).to eq(root_path)
    end

    it 'can be accessed by admin users' do
      admin = FactoryGirl.create(:admin_user)
      login_as(admin, scope: :user)
      visit admin_root_path
      expect(current_path).to eq(admin_root_path)
    end
  end
end
