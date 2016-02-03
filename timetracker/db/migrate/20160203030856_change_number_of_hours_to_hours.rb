class ChangeNumberOfHoursToHours < ActiveRecord::Migration
  def change
  	rename_column :works, :number_of_hours, :hours
  end
end
