# == Schema Information
#
# Table name: portfolios
#
#  id         :integer          not null, primary key
#  title      :string
#  subtitle   :string
#  body       :text
#  image      :text
#  thumbnail  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :image, :thumbnail, presence: true

  # Run after Model.new
  after_initialize :set_defaults

  scope :designers, -> { where(title: 'designer') }

  def self.designer
    where(title: 'designer')
  end

  def set_defaults
    # set an image if it is null
    # useful if defaults arent set via a migration
    self.image ||= 'http://via.placeholder.com/300x300'
    self.thumbnail ||= 'http://via.placeholder.com/140x100'
  end
end
