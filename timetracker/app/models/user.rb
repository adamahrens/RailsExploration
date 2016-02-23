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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company
  has_many :works
  has_many :projects, through: :works

  validates :first_name, length: { minimum: 2, message: 'First name must be greater than 1 character' }
  validates :last_name, length: { minimum: 5, message: 'Last name must be greater than 4 characters' }
  validates :company, presence: { message: 'User must belog to a Company' }

  def to_s
  	"#{first_name} #{last_name}"
  end
end
