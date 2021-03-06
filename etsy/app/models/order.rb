# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  address    :string
#  city       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :integer
#  buyer_id   :integer
#  seller_id  :integer
#

class Order < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'

  validates :address, :state, :city, presence: true
end
