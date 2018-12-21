# == Schema Information
#
# Table name: blogs
#
#  body       :text
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  slug       :string
#  status     :integer          default("draft")
#  title      :string
#  topic_id   :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_blogs_on_slug      (slug) UNIQUE
#  index_blogs_on_topic_id  (topic_id)
#
# Foreign Keys
#
#  fk_rails_...  (topic_id => topics.id)
#
class Blog < ApplicationRecord
  extend FriendlyId
  enum status: { draft: 0, published: 1 }
  belongs_to :topic
  friendly_id :title, use: :slugged
  validates :title, :body, :topic, presence: true
  has_many :comments, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }
end
