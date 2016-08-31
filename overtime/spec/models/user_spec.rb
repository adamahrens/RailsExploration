# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'can not be created without first_name and last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom methods' do
    it 'has a fullname that is the combination of first_name and last_name' do
      expect(@user.full_name).to eq("#{@user.last_name}, #{@user.first_name}")
    end
  end
end
