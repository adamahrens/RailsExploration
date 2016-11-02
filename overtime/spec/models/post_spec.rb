# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer          default(0)
#  overtime   :decimal(, )      default(0.0)
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      @post = FactoryGirl.create(:first_post)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'can not be created without date, overtime and rationale' do
      @post.date = nil
      @post.rationale = nil
      @post.overtime = nil
      expect(@post).to_not be_valid
    end

    it 'can not have an overtime request of 0.0' do
      @post.overtime = 0.0
      expect(@post).to_not be_valid
    end

  end
end
