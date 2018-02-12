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
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  type                   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :time_offs
  validates :first_name, :last_name, :phoneNumber, presence: true

  has_many :audit_logs

  # regex means 10 digits only allowed at the beginning
  validates :phoneNumber, format: { with: /\A\d{10}/, message: 'only 10 digits allowed' }

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    type == 'AdminUser'
  end
end
