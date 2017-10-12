class AddStatusToTimeOff < ActiveRecord::Migration[5.1]
  def change
    add_column :time_offs, :status, :integer, default: 0
  end
end
