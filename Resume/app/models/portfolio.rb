# == Schema Information
#
# Table name: portfolios
#
#  body       :text
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  image      :text
#  position   :integer
#  subtitle   :string
#  thumbnail  :text
#  title      :string
#  updated_at :datetime         not null
#
class Portfolio < ApplicationRecord
  has_many :technologies, inverse_of: :portfolio, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: ->(attr) { attr['name'].blank? },
                                allow_destroy: true

  validates :title, :subtitle, :body, presence: true

  # Run after Model.new
  after_initialize :set_defaults

  scope :designers, -> { where(title: 'designer') }
  scope :by_position, -> { all.order(position: 'ASC') }

  mount_uploader :thumbnail, PortfolioUploader
  mount_uploader :image, PortfolioUploader

  def self.designer
    where(title: 'designer')
  end

  def set_defaults
    # set an image if it is null
    # useful if defaults arent set via a migration
    # self.image ||= Placeholder.image_generator(height: 300, width: 300)
    # self.thumbnail ||= Placeholder.image_generator(height: 150, width: 150)
  end
end
