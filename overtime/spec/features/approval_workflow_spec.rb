require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @post1 = FactoryGirl.create(:first_post)
      visit edit_post_path(@post1)
    end

    it 'has a status that can be edited on the form by an admin user' do
      choose('post_status_approved')
      click_on 'Save'
      # Call reload after database call for latest info
      expect(@post1.reload.status).to eq('approved')
    end

    it 'cant be edited by a regular user' do
      logout(:user)
      regular_user = FactoryGirl.create(:user)
      login_as(regular_user, scope: :user)
      visit edit_post_path(@post1)

      expect(page).to_not have_content('Approved')
      expect(page).to_not have_content('Submitted')
      expect(page).to_not have_content('Rejected')
    end

    it 'should not be editable by the post User if status is approved' do
      logout(:user)
      regular_user = FactoryGirl.create(:user)
      login_as(regular_user, scope: :user)

      @post1.update(user_id: regular_user.id, status: 'approved')

      # User should be redirected
      visit edit_post_path(@post1)
      expect(current_path).to eq(root_path)
    end
  end
end
