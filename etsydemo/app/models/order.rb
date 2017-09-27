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
#

class Order < ActiveRecord::Base
  validates :address, :city, :state, presence: true

  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
