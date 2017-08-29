require 'rails_helper'

describe 'navigation' do
  describe 'index page' do
    before do
      user = User.create(email: 'first@last.com', first_name: 'First', last_name: 'Last', password: 'password123', password_confirmation: 'password123')
      login_as(user, scope: :user)
      @user = user
    end

    it 'can be reached successfully' do
      visit time_offs_path
      expect(page.status_code).to eq(200)
    end

    it 'has a heading of Time Off Requests' do
      visit time_offs_path
      expect page.has_content?('Time Off Requests')
    end

    it 'has a list of time of requests' do
      post1 = TimeOff.create(date: Date.today, rationale: 'Vacation1', user_id: @user.id)
      post2 = TimeOff.create(date: Date.today, rationale: 'Vacation2', user_id: @user.id)
      visit time_offs_path
      expect(page).to have_content(/#{post1.rationale}|#{post2.rationale}/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: 'first@last.com', first_name: 'First', last_name: 'Last', password: 'password123', password_confirmation: 'password123')
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
end
