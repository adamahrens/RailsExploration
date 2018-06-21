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
  include Placeholder

  has_many :technologies, inverse_of: :portfolio, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: ->(attr) { attr['name'].blank? },
                                allow_destroy: true

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
    self.image ||= Placeholder.image_generator(height: 300, width: 300)
    self.thumbnail ||= Placeholder.image_generator(height: 140, width: 100)
  end
end
