require 'rails_helper'

describe 'navigation' do
  describe 'index page' do
    before do
      visit time_offs_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a heading of Time Off Requests' do
      expect page.has_content?('Time Off Requests')
    end
  end

  describe 'creation' do
    before do
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
  end
end
