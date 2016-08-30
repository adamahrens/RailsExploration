require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a header with content Overtime Requests' do
      expect(page).to have_content(/Overtime Requests/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'I need time off'
      click_on 'Save'
      expect(page).to have_content('I need time off')
    end
  end
end
