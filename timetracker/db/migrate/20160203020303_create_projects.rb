class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :company, index: true, foreign_key: true
      t.float :default_rate

      t.timestamps null: false
    end
  end
end
