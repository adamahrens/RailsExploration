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
#  updated_at :datetime         not null
#
# Indexes
#
#  index_blogs_on_slug  (slug) UNIQUE
#

class Blog < ApplicationRecord
  extend FriendlyId
  enum status: { draft: 0, published: 1 }
  friendly_id :title, use: :slugged
  validates :title, :body, presence: true
end
