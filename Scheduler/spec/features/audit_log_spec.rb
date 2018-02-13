require 'rails_helper'

describe 'AuditLog feature' do
  describe 'index' do
    before do
      @audit_log = FactoryGirl.create(:audit_log)
      @admin_user = FactoryGirl.create(:admin_user)
      login_as(@admin_user, scope: :user)
      visit audit_logs_path
    end

    it 'has an index page that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log contents that are available' do
      full_name = @audit_log.user.full_name
      expect(page).to have_content(/#{full_name}/)
    end

    it 'cant be accessed by a non-admin user' do
      logout(@admin_user)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
