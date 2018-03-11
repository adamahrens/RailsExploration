require 'rails_helper'

describe 'approving on homepage' do
  before do
    @admin = FactoryGirl.create(:admin_user)
    login_as(@admin, scope: :user)
    @user = FactoryGirl.create(:user)
    @post = TimeOff.create(date: Date.today, rationale: 'Vacation', overtime_request: 0.35, user_id: @user.id)
  end
  it 'is allowed for the admin to approve' do
    visit root_path
    click_on("approved_#{@post.id}")
    @post.reload
    expect(@post.status).to eq('approved')
  end

end
