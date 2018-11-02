class AddDefaultValueForOvertimeInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :overtime, :decimal, default: 0.0
  end
end
