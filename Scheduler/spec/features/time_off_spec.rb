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
end
