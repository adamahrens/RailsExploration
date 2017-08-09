require 'rails_helper'

describe 'navigation' do
  describe 'index page' do
    it 'can be reached successfully' do
      visit time_offs_path
      expect(page.status_code).to eq(200)
    end

    it 'has a heading of Time Off Requests' do
      visit time_offs_path
      expect page.has_content?('Time Off Requests')
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached' do
      visit new_time_off_path
      expect(page.status_code).to eq(200)
    end

    it 'can submit a Time Off Request' do
      visit new_time_off_path
      rationale = 'Testing time off'
      now = Date.today
      fill_in 'time_off[rationale]', with: rationale
      fill_in 'time_off[date]', with: now
      click_on 'Save'
      expect page.has_content?(rationale)
    end
  end
end
