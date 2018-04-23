# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :works
  has_many :projects, through: :works

  validates :first_name, :last_name, :company, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 5 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    full_name
  end
end
