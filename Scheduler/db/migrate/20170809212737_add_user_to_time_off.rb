class AddUserToTimeOff < ActiveRecord::Migration[5.1]
  def change
    add_reference :time_offs, :user, foreign_key: true
  end
end
