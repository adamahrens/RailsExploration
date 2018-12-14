# == Schema Information
#
# Table name: audit_logs
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  status     :integer          default("pending")
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryGirl.create(:audit_log)
  end
  describe 'creating Audit Log' do
    it 'can properly be created' do
      expect(@audit_log).to be_valid
    end
  end

  describe 'validation' do
    it 'should have a user association' do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should have a status' do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should be required to have a start_date' do
      @audit_log.start_date = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should have a start_date equal to 6 days prior' do
      audit = AuditLog.create(user_id: User.last.id, status: 0)
      expect(audit.start_date).to eq(Date.today - 6.days)
    end
  end
end
