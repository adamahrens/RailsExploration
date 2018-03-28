# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  default_rate :decimal(, )
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Project < ApplicationRecord
  belongs_to :company
  has_many :works
  has_many :users, through: :works

  validates :slug, length: { minimum: 3 }
  validates :slug, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :company, presence: true
  validates :default_rate, numericality: { greater_than: 49,
  less_than: 10000}

  before_validation :generate_slug

  def hours_worked
    works.map { |w| w.hours }.reduce(:+)
  end

  def to_s
    "#{name} #{company}"
  end

  private
  def generate_slug
    self.slug = name.downcase.tr(' ', '-')
  end
end
