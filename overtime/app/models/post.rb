# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  status     :integer
#

class Post < ActiveRecord::Base
  validates :date, presence: true
  validates :rationale, presence: true

  belongs_to :user

  # Will create methods to call on a Post to automatically change
  # e.g. @post.approved! or @post.rejected!
  # Can even Query then
  # e.g. Post.approved.count
  enum status: { submitted: 0, approved: 1, rejected: 2 }

  scope :created_by, -> (user) { where(user_id: user.id) }
end
