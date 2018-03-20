class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.datetime :date_performed
      t.decimal :hours, precision: 5, scale: 2
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
