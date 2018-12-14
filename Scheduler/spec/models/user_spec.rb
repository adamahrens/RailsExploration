# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  type                   :string
#  phoneNumber            :string
#  ssn                    :integer
#  company                :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe 'creation' do
    it 'can create a User' do
      expect(@user).to be_valid
    end

    it 'can not be created without first_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'can not be created without last_name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'can not be created without phoneNumber' do
      @user.phoneNumber = nil
      expect(@user).to_not be_valid
    end

    it 'must have a valid phoneNumber of 10 digits with no dashes' do
      @user.phoneNumber = '651-408-5143'
      expect(@user).to_not be_valid

      @user.phoneNumber = 'Im not a number'
      expect(@user).to_not be_valid

      @user.phoneNumber = '+1 (319) 622-3922'
      expect(@user).to_not be_valid

      @user.phoneNumber = 'aBcDeFgHiJ'
      expect(@user).to_not be_valid

      @user.phoneNumber = 'boom 6514085143'
      expect(@user).to_not be_valid

      @user.phoneNumber = '6514085143'
      expect(@user).to be_valid
    end

    it 'must have an ssn' do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it 'must have a company' do
      @user.company = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom full name method' do
    it 'has a full name method that combines first_name & last_name' do
      expect(@user.full_name).to eq("#{@user.first_name} #{@user.last_name}")
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee_1 = FactoryGirl.create(:user)
      employee_2 = FactoryGirl.create(:user_two)
      admin = FactoryGirl.create(:admin_user)

      Hand.create!(user_id: admin.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin.id, hand_id: employee_2.id)

      expect(admin.hands.count).to eq(2)
    end
  end
end
