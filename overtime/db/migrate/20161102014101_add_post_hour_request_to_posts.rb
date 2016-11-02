class AddPostHourRequestToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :overtime, :decimal
  end
end
