class ChangeWorksHoursToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :works, :hours, :integer
  end
end
