require 'rails_helper'

describe 'admin workflow' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @timeoff = FactoryGirl.create(:time_off1)
    end

    it 'has a status that can be edited by an admin' do
      visit edit_time_off_path(@timeoff)
      choose('time_off_status_approved')
      click_on 'Save'
      @timeoff.reload
      expect(@timeoff.status).to eq('approved')
    end

    it 'cant be changed by regular user' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit edit_time_off_path(@timeoff)
      expect(page).to_not have_content('Approved')
    end
  end
end
