class AddDefaultValueForOvertimeInPosts < ActiveRecord::Migration
  def change
    change_column :posts, :overtime, :decimal, default: 0.0
  end
end
