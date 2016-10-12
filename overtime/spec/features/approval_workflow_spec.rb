require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @post1 = FactoryGirl.create(:first_post)
    end

    it 'has a status that can be edited on the form' do
      visit edit_post_path(@post1)
      choose('post_status_approved')
      click_on 'Save'
      # Call reload after database call for latest info
      expect(@post1.reload.status).to eq('approved')
    end
  end
end
