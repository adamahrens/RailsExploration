class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :date_performed
      t.integer :number_of_hours

      t.timestamps null: false
    end
  end
end
