require 'rails_helper'

describe 'navigation' do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    @post1 = TimeOff.create(date: Date.today, rationale: 'Vacation', overtime_request: 0.35, user_id: user.id)
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
      expect(page).to have_content(/#{@post1.rationale}/)
    end

    it 'has a scope of requests to only user' do
      other_user = FactoryGirl.create(:user_two)
      other_post = TimeOff.create(date: Date.today, rationale: 'Boom', overtime_request: 0.35, user_id: other_user.id)
      visit time_offs_path
      expect(page).to_not have_content(/#{other_post.rationale}/)
    end

    it 'shows all requests for admin user' do
      other_user = FactoryGirl.create(:user_two)
      other_post = TimeOff.create(date: Date.today, rationale: 'Boom', overtime_request: 0.35, user_id: other_user.id)
      logout(@user)
      admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, scope: :user)
      visit time_offs_path
      expect(page).to have_content(/#{@post1.rationale}|#{other_post.rationale}/)
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
      fill_in 'time_off[overtime_request]', with: 0.67
      click_on 'Save'
      expect(page).to have_content(rationale)
      expect(page).to have_content(0.67)
    end

    it 'redirects to form if invalid' do
      click_on 'Save'
      expect(page).to have_content('New')
    end

    it 'will have an associated User' do
      now = Date.today
      rationale = "Testing time off with User #{now}"
      fill_in 'time_off[rationale]', with: rationale
      fill_in 'time_off[date]', with: now
      fill_in 'time_off[overtime_request]', with: 0.5
      click_on 'Save'
      expect(User.last.time_offs.last.rationale).to eq(rationale)
      expect(User.last.time_offs.last.overtime_request).to eq(0.5)
    end
  end

  describe 'edit' do
    before do
      logout(@user)
      @other_user = User.create(first_name: 'Leroy', last_name: 'Jenkins', email: 'b@b.com', password: 'password123', password_confirmation: 'password123', phoneNumber: '6513331111')
      @other_time_off = TimeOff.create(date: Date.today, rationale: 'Gone', overtime_request: 0.35, user_id: @other_user.id)
      login_as(@other_user, scope: :user)
      visit time_offs_path
      click_link "edit_#{@other_time_off.id}"
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

    it 'can not be updated by a non authorized user' do
      logout(@user)
      wrong_user = FactoryGirl.create(:user_two)
      login_as(wrong_user, scope: :user)
      visit edit_time_off_path(@post1)
      expect(current_path).to eq(root_path)
    end
  end
end
