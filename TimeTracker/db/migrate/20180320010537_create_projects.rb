class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.decimal :default_rate
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
