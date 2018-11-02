class AddPostHourRequestToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :overtime, :decimal
  end
end
