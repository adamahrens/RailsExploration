class CreateTimeOffs < ActiveRecord::Migration[5.1]
  def change
    create_table :time_offs do |t|
      t.date :date
      t.text :rationale

      t.timestamps
    end
  end
end
