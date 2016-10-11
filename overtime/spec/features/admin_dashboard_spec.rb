require 'rails_helper'

describe 'admin dashboard' do
  it 'can be reached successfully by admin user' do
    @user = FactoryGirl.create(:admin_user)
    login_as(@user, scope: :user)
    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end

  it 'cant be accessed by non-signed user' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'cant be accessed by non-admin user' do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
  end
end
