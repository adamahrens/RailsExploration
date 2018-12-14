require 'rails_helper'

describe 'approving on homepage' do
  before do
    @admin = FactoryGirl.create(:admin_user)
    login_as(@admin, scope: :user)
    @user = FactoryGirl.create(:user)
    @post = TimeOff.create(date: Date.today, rationale: 'Vacation', daily_hours: 0.35, user_id: @user.id)
    @audit = AuditLog.create(user_id: @user.id)
  end
  it 'is allowed for the admin to approve' do
    visit root_path
    click_on("approved_#{@post.id}")
    @post.reload
    expect(@post.status).to eq('approved')
  end

  it 'allows the employee to change audit log status' do
    logout(@admin)
    login_as(@user, scope: :user)
    visit root_path
    click_on("approve_#{@audit.id}")
    @audit.reload
    expect(@audit.status).to eq('confirmed')
  end

end
