# == Schema Information
#
# Table name: comments
#
#  blog_id    :integer
#  content    :text
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
end
