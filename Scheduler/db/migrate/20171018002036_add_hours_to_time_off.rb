class AddHoursToTimeOff < ActiveRecord::Migration[5.1]
  def change
    add_column :time_offs, :overtime_request, :decimal, default: 0.0
  end
end
