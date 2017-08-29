require 'rails_helper'

describe 'navigation' do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    @post1 = FactoryGirl.create(:time_off1)
    @user = user
  end

  describe 'index page' do
    it 'can be reached successfully' do
      visit time_offs_path
      expect(page.status_code).to eq(200)
    end

    it 'has a heading of Time Off Requests' do
      visit time_offs_path
      expect page.has_content?('Time Off Requests')
    end

    it 'has a list of time of requests' do
      post2 = FactoryGirl.create(:time_off2)
      visit time_offs_path
      expect(page).to have_content(/#{@post1.rationale}|#{post2.rationale}/)
    end
  end

  describe 'deletion' do
    it 'can be deleted' do
      visit time_offs_path
      click_link "delete_#{@post1.id}"
      expect(page).to_not have_content(/#{@post1.rationale}/)
    end
  end

  describe 'creation' do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit new_time_off_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can submit a Time Off Request' do
      rationale = 'Testing time off'
      now = Date.today
      fill_in 'time_off[rationale]', with: rationale
      fill_in 'time_off[date]', with: now
      click_on 'Save'
      expect(page).to have_content(rationale)
    end

    it 'redirects to form if invalid' do
      click_on 'Save'
      expect(current_path).to eq(new_time_off_path)
    end

    it 'will have an associated User' do
      now = Date.today
      rationale = "Testing time off with User #{now}"
      fill_in 'time_off[rationale]', with: rationale
      fill_in 'time_off[date]', with: now
      click_on 'Save'
      expect(User.last.time_offs.last.rationale).to eq(rationale)
    end
  end

  describe 'edit' do
    before do
      visit time_offs_path
      click_link "edit_#{@post1.id}"
    end
    it 'can be reached from clicking Edit on Index page' do
      expect(page.status_code).to eq(200)
    end

    it 'can be updated with new information' do
      yesterday = Date.yesterday
      rationale = 'Just kidding, Im heading to the beach'
      fill_in 'time_off[rationale]', with: rationale
      fill_in 'time_off[date]', with: yesterday
      click_on 'Save'
      expect(page).to have_content(rationale)
    end
  end
end
