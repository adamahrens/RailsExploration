class User < ApplicationRecord
  # Delete a User then delete all their listings
  has_many :listings, dependent: :destroy
  has_many :sales, class_name: 'User', foreign_key: 'seller_id'
  has_many :purchases, class_name: 'User', foreign_key: 'buyer_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
end
