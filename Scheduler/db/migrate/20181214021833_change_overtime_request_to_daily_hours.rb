class ChangeOvertimeRequestToDailyHours < ActiveRecord::Migration[5.1]
  def change
    rename_column :time_offs, :overtime_request, :daily_hours
  end
end
