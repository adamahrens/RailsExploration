class AddDefaultToPostsForStatus < ActiveRecord::Migration
  def change
    change_column :posts, :status, :integer, default: 0
  end
end
