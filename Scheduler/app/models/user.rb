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
#  phoneNumber            :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :phoneNumber, :ssn, :company, presence: true

  has_many :time_offs
  has_many :audit_logs
  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations

  # regex means 10 digits only allowed at the beginning
  validates :phoneNumber, format: { with: /\A\d{10}/, message: 'only 10 digits allowed' }
  validates :ssn, numericality: { only_integer: true }
  validates :ssn, length: { is: 4 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    type == 'AdminUser'
  end
end
